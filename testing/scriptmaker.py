from anytree import Node, RenderTree
import pandas as pd
import csv 
from os import system
import os 
here = os.path.dirname(os.path.abspath(__file__))

# Broad explanation: 
# 0. User passes arguments to auto method. Their input may look something like this: 
# auto(9,node="pn116125",iterations=10,cpus=10,model=3,driver="default", teams =["TrinitySRITrojAI"] ,custom=True, bits = 16)
#
# 1. Using a csv file of the form round#,team,date,containerName, 
# it creates a tree  data structure which can be traversed to generate valid containers 
# (which are represented # by "Submission" objects 
# these objects contain relevant information about filepaths, etc) 
# 
# 2. Depending on what round the model you're testing is from, a class 
# called ModelTree (which is really just a dictionary with multiple levels) 
# will return a tokenizer.  
#
# 3. With the help of a shellscript method and the information
# generated above with the model, tokenizer, the singularity script necessary to run a container 
# given by the auto method configuration is returned. 
#
#
# 4. A csvformat method uses the number of iterations requested to create a csv file where # the cells correspond to different iterations and teams [row ~ team, col ~ iteration]. The 
# indexing of the helps make sure that the outputs and scratch directories have #corresponding indexing to make them unique from one another. 
#
# 5. Lastly the makeslurm method translates the csv file generated in 4. to a single file
# of slurm and singularity commands. To run the individual containers these commands
# generate bash files with the name structure "(ROW)_(COL).sh" which are run individually. # Directories such as the scratch and output directories are cleared out before this happens. 

#Tree data Structure of the form HEAD/ROUND/TEAM/VERSION/FILENAME
#allows the creation of a Submission object using a tree. All parameters apart from tree are indices.
def autoSubmission(tree, round, team, version):
    roundtxt = tree.children[round].name
    teamtxt = tree.children[round].children[team].name
    versiontxt = tree.children[round].children[team].children[version].name
    filenametxt =  tree.children[round].children[team].children[version].children[0].name
    return Submission(roundtxt,teamtxt,versiontxt,filenametxt)


#Class containing relevant information of a submission 
class Submission():
    round = 0
    team = ""
    version =  ""
    filename = ""
    path = ""

    def __init__(self, round, team, version, filename):
        self.round = str(round)
        self.team = str(team)
        self.version = str(version)
        self.filename = str(filename)
        self.path = "/mnt/isgnas/deploy/trojai/"+ self.round +"/es/submissions/"+ self.team +"/"+ self.version +"/"+ self.filename + " "



class SubmissionsTree(Node):

    head = Node('head')

    #iterator settings
    high_r = 8
    rnd = 0
    currTeam = 0
    vsetting = "N"
    version = 0

    #Tree construction. Could be made more efficient by using different Pandas function if necessary.
    def __init__(self, info_csv):
        df = pd.read_csv(info_csv)
        df = df[df['round'] != 'round4-errata']
        for rnd in df['round'].unique():
            roundNode = Node(rnd, parent=self.head)
            for team in df.loc[df['round'] == rnd]['team'].unique():
                teamNode = Node(team, parent=roundNode)
                for version in df.loc[(df['round'] == rnd) & (df['team'] == team)]['version'].unique():
                    versionNode = Node(version, parent=teamNode)
                    for file in df.loc[(df['round'] == rnd) & (df['team'] == team) & (df['version'] == version)]['filename'].unique():
                        Node(file, parent=versionNode)

    #Iterator settings: this will allow the iterator to access low_r (inclusive) to high_r (inclusive)
    #A vsetting of "ALL" indicates an iterator that iterates through all brances of the tree, while 
    # a vsetting of "N" indicates an iterator that iterates through the newest "Version branches" of the 
    # tree. 
    def setIterator(self, high_r,low_r,vsetting):
        self.high_r = high_r
        self.rnd = low_r
        self.vsetting = vsetting
        self.version = -1

    def __iter__(self):
        return self

    def __next__(self):
        if (self.rnd - 1> self.high_r):
            raise StopIteration
        elif (self.vsetting == "N"):
            self.version = -1
            self.currTeam += 1
            if (self.currTeam == len(self.head.children[self.rnd].children)):
                self.currTeam = 0
                self.rnd += 1

        elif (self.vsetting == "ALL"):
            self.version += 1
            if (self.version == len(self.head.children[self.rnd].children[self.currTeam].children)):
                self.version = 0
                self.currTeam += 1
            if (self.currTeam == len(self.head.children[self.rnd].children)):
                self.currTeam = 0
                self.rnd += 1
        else:
            raise ValueError("vsetting parameter must be 'ALL' or 'N'")

        if (self.rnd > self.high_r):
            raise StopIteration
        return autoSubmission(self.head, self.rnd, self.currTeam, self.version)

    #prints the tree structure 
    def illustrate(self):
        print(RenderTree(self.head))

#Class responsible for generating shell scripts

#creates the shellscript text
def shellscript(submission, model, output,homedir,iteration,node,cpus,driver):
    
    round = int(submission.round[-1])
    
    txt = "singularity run "
    txt += "--bind " + model.model_filepath_bind
    txt += "--bind " + model.examples_dirpath
    if round == 9:
        txt += "--bind " + model.tokenizer_dirpath
    txt += "--bind " + homedir + " "
    txt += "--nv "
    txt += submission.path
    txt += "--model_filepath=" + model.model_filepath
    txt += "--examples_dirpath=" + model.examples_dirpath
    
    if round == 9:
        txt += "--tokenizer_filepath=" + model.tokenizer_filepath
        txt += "--features_filepath="+homedir+"/features.csv " #+ output + str(round) + "_" + str(idInt(model.id)) + ".csv"
        txt += "--round_training_dataset_dirpath=" + model.training_data
        txt += "--schema_filepath=/metaparameters_schema.json "
        txt += "--metaparameters_filepath=" + model.metaparameters_filepath
        #txt += "--schema_filepath="+ model.model_filepath_bind
        txt += "--learned_parameters_dirpath=/learned_parameters "
        #txt += "configure_mode="
        #txt += "configure_models_dirpath="+ model.model_filepath_bind
    
    out = submission.round + "/" + node+ "/" + cpus + "/" + driver + "/" + submission.team + "/id-" + str(model.idint)
    txt += "--scratch_dirpath="+homedir+"/scratch/"+ out +"/scratch" + str(iteration) +" "
    txt += "--result_filepath="+homedir+"/outputs/"+ out + "/" + str(iteration) + ".txt "

    return txt

# raw shellscript text that is used to run tweaked versions of 
def shellscriptCustom(submission, model, output,homedir,iteration,node,cpus,driver,bits, modeldir):
    
    round = int(submission.round[-1])
    bstring = ""
    
    if bits == 16:
        bstring = "16"
    else :
        bstring = "32"
    
    out = submission.round + "/" + node+ "/" + cpus + "/" + driver + "/" + submission.team + "/MODIFIED_id-" + bstring +str(model.idint)
    
    txt = "singularity run "
    txt += "--bind " + model.examples_dirpath
    txt += "--bind " + homedir+"/outputs/"+ out + " "
    txt += "--bind " + homedir+"/scratch/"+ out +"/scratch" + str(iteration) +" "
    if round == 9:
        txt += "--bind " + model.tokenizer_dirpath
    
    #CHANGE THIS IF YOU DECIDE TO PUT YOUR TWEAKED MODELS ANYWHERE OTHER THAN IN homedir/models
    txt += "--bind " + homedir + modeldir + r"/" + str(model.id) + " "
    txt += "--nv "
    txt += submission.path
    txt += "--model_filepath=" + homedir + modeldir + r"/" + str(model.id) + "/model" + str(bits) + str(iteration) + ".pt "
    txt += "--examples_dirpath=" +  model.examples_dirpath
   
    if round == 9:
        txt += "--tokenizer_filepath=" + model.tokenizer_filepath
        txt += "--features_filepath="+homedir+"/scratch/"+ out +"/scratch" + str(iteration) +"/features.csv "
        txt += "--round_training_dataset_dirpath=" + model.training_data
        txt += "--schema_filepath=/metaparameters_schema.json "
        txt += "--metaparameters_filepath=" + model.metaparameters_filepath
        #txt += "--schema_filepath="+ model.model_filepath_bind
        txt += "--learned_parameters_dirpath=/learned_parameters "
        #txt += "configure_mode="
        #txt += "configure_models_dirpath="+ model.model_filepath_bind
    
    txt += "--scratch_dirpath="+homedir+"/scratch/"+ out +"/scratch" + str(iteration) +" "
    txt += "--result_filepath="+homedir+"/outputs/"+ out + "/" + str(iteration) + ".txt "

    return txt

#Class representing models
#contains string information about a model
#only supports image rounds (<5)


#Data Structure with which to find tokenizers corresponding with models
class ModelTree():
    rounds = {}

    def __init__(self,csv_file):
        dfmain = pd.read_csv(csv_file)

        for i in range(5,10):
            df = dfmain[(dfmain['round'] == 'round' + str(i))]
            temp = []
            self.rounds["round" + str(i)] = temp
            for index, row in df.iterrows():
                temp.append(row['tokenizer'] + ".pt")

#class to represent AI models to check for trojans 
class Model():
    
    round = ""
    id = ""
    id_int = 0
    examples_dirpath = ""
    model_filepath = ""
    model_filepath_bind = ""
    examples_filepath_bind = ""
    tokenizer_dirpath = ""
    tokenizer_filepath = ""
    embedding_filepath = ""
    config_dir = ""
    round_training_dataset_dir = ""
    training_data = ""
    features_filepath = ""
    metaparameters_filepath = ""
    schema_filepath = ""

    def __init__(self, round, id):
        
        roundNr = int(round[-1])
        self.round = round
        self.id = id
        self.idint = idInt(id)
        if (roundNr == 4 ):

            self.model_filepath = "/mnt/isgnas/project/ai/trojai/datasets/" + round \
                                  + "/"+round+"-test-dataset/"+id+"/model.pt "
            self.model_filepath_bind = "/mnt/isgnas/project/ai/trojai/datasets/" + round \
                                  + "/"+round+"-test-dataset/"+id +" "

            self.examples_dirpath = "/mnt/isgnas/project/ai/trojai/datasets/" + round \
                                  + "/"+round+"-test-dataset/"+id+"/clean_example_data/ "

            self.examples_filepath_bind = "/mnt/isgnas/project/ai/trojai/datasets/" + round \
                                  + "/"+round+"-test-dataset/"+id+"/ "

        if (roundNr == 9) :
            self.model_filepath = "/mnt/isgnas/project/ai/trojai/datasets/" + round \
                                  + "/" + round + "-test-dataset/models/" + id + "/model.pt "
            self.model_filepath_bind = "/mnt/isgnas/project/ai/trojai/datasets/" + round \
                                       + "/" + round + "-test-dataset/" + "models" + " "

            self.examples_dirpath = "/mnt/isgnas/project/ai/trojai/datasets/" + round \
                                    + "/" + round + "-test-dataset/models/" + id + " "

            self.examples_filepath_bind = "/mnt/isgnas/project/ai/trojai/datasets/" + round \
                                          + "/" + round + "-test-dataset/models" + id + " "
            self.tokenizer_dirpath = "/mnt/isgnas/project/ai/trojai/datasets/" + round \
                                  + "/tokenizers/ "
            self.embedding_filepath = self.model_filepath
            filename = os.path.join(here, r'utilityCSVs\tokenizerinfo.csv')
            tree = ModelTree(filename)
            #change to filepath on your system as needed 
            self.tokenizer_filepath = "/mnt/isgnas/project/ai/trojai/datasets/"+round+"/tokenizers/" + tree.rounds.get(round)[idInt(self.id)] + " "
            self.training_data = "/mnt/isgnas/project/ai/trojai/datasets/" + round \
                                  + "/"+round+"-train-dataset/ "
            self.schema_filepath = "/mnt/isgnas/project/ai/trojai/datasets/" + round \
                                  + "/"+round+"-test-dataset/METADATA_DICTIONARY.csv "
            self.metaparameters_filepath = "/metaparameters.json "

#converts an id string into an integer 
def idInt(id):
    id = id[8:11]
    while(id[0] == 0):
        id = id[1:]
    return int(id)

#converts a number into an id string 
def id_constructor(num):
    digits = 0
    temp = num
    while(num > 0):
        num = num // 10
        digits = digits + 1
    if temp != 0:
        return "id-" + "0" * (8 - digits) + str(temp)
    else:
        return "id-" + "0" * (8 - digits)

#Makes use of path in tree to get only desired algorithms 
def csvFormat(tree,outputDir,modeldir,homedir,iterations,node,driver,cpus,model,teams="ALL", custom = False,bits=32):
    filename = os.path.join(here, r'utilityCSVs\temp.csv')
    with open(filename, 'w+', newline='') as csvfile:
        filewriter = csv.writer(csvfile, delimiter=',',
                                quotechar='|', quoting=csv.QUOTE_MINIMAL)
        for i in tree:
            if str(i.team) in set(teams) or teams == "ALL":
                id = id_constructor(model)
                for iter in range(iterations):
                    if custom == True:
                        temp = (shellscriptCustom(Submission(i.round, i.team, i.version,  i.filename), Model(i.round, id), outputDir+ "/" + i.round + "_"+ i.team + "_" + i.version +".txt",homedir,iteration=iter,node=node,driver=driver,cpus=cpus,bits=bits, modeldir = modeldir))
                    else :
                        temp = (shellscript(Submission(i.round, i.team, i.version,  i.filename), Model(i.round, id), outputDir+ "/" + i.round + "_"+ i.team + "_" + i.version +".txt",homedir,iteration=iter,node=node,driver=driver,cpus=cpus))
                    filewriter.writerow([temp])

#Class that generates the singularity run command parameters 
class ShellscriptGenerator():
    tree = None

    def __init__(self,startRound,endRound,modeldir,node,driver,cpus,model=3,newest=True,homedir=r"/mnt/isgnas/home/jal20",teams="ALL",iterations=1,custom=False,bits=32):
        filename = os.path.join(here, r'utilityCSVs\infoTrojAi.csv')
        self.tree = SubmissionsTree(filename)
        if newest == True:
            self.tree.setIterator(low_r=startRound, high_r=endRound, vsetting="N")
        elif newest == False:
            self.tree.setIterator(low_r=startRound, high_r=endRound, vsetting="ALL")
        csvFormat(modeldir = modeldir, tree=self.tree,model=model,outputDir=homedir +"/outputs", homedir=homedir,teams=teams,iterations=iterations,node=node,driver=driver,cpus=cpus, custom = custom,bits=bits)



#clears out scratch folders and creates necessary folders for heirarchy to maintain structure 
def generateBashCMDs(node,cpus,driver,round,model,teams,
csvFile=r"utilityCSVs\temp.csv",custom=False,iterations = 1,bits=32):
    
    model=str(model)
    round = str(round)
    cpus = str(cpus)
    
    with open("TEST.sh", 'a') as f:
        init = "#!/bin/bash"+ ' \n'
        all = list()
        
        if custom == False:
            f.writelines([init])
            for team in teams:      
                for i in range(iterations):
                    i = str(i)
                    clear = "rm -r scratch/" + round +"/"  + node+ "/" + cpus + "/" + driver + "/" + team + "/id-" + model + "/scratch" + i + ' \n'
                    make = "mkdir -p scratch/"+ round +"/" + node+ "/" + cpus + "/" + driver + "/" + team+ "/id-" + model + "/scratch" + i + ' \n'
                    all += [clear,make]
                rmOut = "rm -r outputs/"+ round +"/" + node+ "/" + cpus + "/" + driver + "/" + team + "/id-" + model + ' \n'
                makeOut = "mkdir -p outputs/"+ round +"/" + node+ "/" + cpus + "/" + driver + "/" + team + "/id-" + model + ' \n'
                all+= [rmOut,makeOut]
                f.writelines(all)


        else:
            f.writelines([init])
            bstring = ""
            if bits == 16:
                bstring = "16"
            else :
                bstring = "32"
            for team in teams:
                
                for i in range(iterations):
                    i= str(i)
                    clear = "rm -r scratch/" + round +"/"  + node+ "/" + cpus + "/" + driver + "/" + team + "/MODIFIED_id-" + bstring + model + "/scratch" + i + ' \n'
                    make = "mkdir -p scratch/"+ round +"/" + node+ "/" + cpus + "/" + driver + "/" + team+  "/MODIFIED_id-"+ bstring + model + "/scratch" + i + ' \n'
                    all += [clear,make]
                rmOut = "rm -r outputs/"+ round +"/" + node+ "/" + cpus + "/" + driver + "/" + team + "/MODIFIED_id-"+ bstring + model + ' \n'
                makeOut = "mkdir -p outputs/"+ round +"/" + node+ "/" + cpus + "/" + driver + "/" + team + "/MODIFIED_id-"+ bstring + model + ' \n'  
                all += [rmOut,makeOut]
                f.writelines(all)


#uses a csv file to generate commands 
def makeSlurm(filename,node,partition,cpus,driver):
    
    rows = None 
    df = pd.read_csv(filename)
    with open(filename, "r") as csv_file:
        reader = csv.reader(csv_file)
        rows = list(reader)
    for row in range(df.shape[0] + 1):
        for col in range(df.shape[1]):
           with open("TEST.sh", 'a') as f:
            name = str(row) + "_"+str(col)+".sh"
            cmd = ' \n'
            cmd = ("echo \"" + giveSkeleton(node=node,cpus=cpus,partition=partition) +"\" > " + name)+ ' \n'
            cmd += ("chmod u=rwx,g=rwx " + name) + ' \n'
            cmd += "echo " + str(rows[row][col]) + " >> " + name + '  \n'
            cmd  += ("sbatch " + name) + ' \n'
            f.writelines([cmd])
        
#returns the skeleton for a slurm job request  
def giveSkeleton(node,cpus,partition):
    cmd = "#!/bin/bash"+ ' \n'
    cmd += "#SBATCH --partition="+partition+ ' \n'
    cmd += "#SBATCH --nodelist="+node+ ' \n'
    cmd += "#SBATCH --nodes=1"+ ' \n'
    cmd += "#SBATCH --cpus-per-task="+ str(cpus)+' \n'
    cmd += "#SBATCH --gres=gpu:1"+ ' \n'
    cmd += "#SBATCH --job-name=trojai_reproducibility"+ ' \n'
    cmd += "#SBATCH -o INFO%n.out" + ' \n'
    cmd +="#SBATCH --time=0:20:0"+ ' \n'
    cmd += ' \n'
    cmd += "#!/bin/bash"+ ' \n' 
    cmd += "time "   
    return cmd

def auto(round,modeldir = r"/models", model = 3,iterations = 1,teams="ALL",node="charlie",homedir=r"/mnt/isgnas/home/jal20/slurm/tests",driver="510.73.08",cpus =10,custom=False,partition = "isg",bits = 32):
   ShellscriptGenerator(model = model, startRound=round,endRound=round,teams=teams,iterations=iterations,node=node,driver=driver,cpus=str(cpus),custom=custom,bits = bits, homedir=homedir, modeldir = modeldir)
   generateBashCMDs(model=model,node=node,cpus=str(cpus),driver=driver,round="round" + str(round), custom = custom, iterations = iterations,bits = bits, teams=teams)
   filename = os.path.join(here, r'utilityCSVs\temp.csv')
   makeSlurm(filename,node=node,partition = partition, driver = driver, cpus= str(cpus))


#prints a script that goes to all result entries in your machine
def compiler(round, experiment = "Determinism", model = 3,iterations = 1, teams="ALL",node="charlie",homedir=r"/mnt/isgnas/home/jal20/slurm/tests",driver="510.73.08", cpus =10, custom = False, partition = None, bits=32):
    out = "#!/bin/bash" + '\n'
    out += "searchDir=" + homedir + ' \n'
    enumstr = [str(i + 1) + ", " for i in range(iterations)]
    finalenumstr = ""
    for i in enumstr:
        finalenumstr += i
    out+= 'temp="round,node,cpus,driver,team,model,'  + finalenumstr[:-2] + '"' + ' \n'
    bstring = ""
    if bits == 16:
        bstring = "16"
    else: 
        bstring = "32"


    out += "echo $temp >> " + experiment + ".csv " + '\n'
    if teams != "ALL":
        for team in teams:
            if custom != True:
                out += "\n\n"
                out += 'temp="round'+str(round) +"," +node + "," + str(cpus)+ "," + driver + "," +team +",id-"+ str(model) + '\" \n'
                out+='for data in $searchDir/round'+str(round) +'/' +node + '/' + str(cpus)+ '/' + driver + '/' +team +'/id-'+ str(model)+ '/*;do \n'
                out += 'nums=$(<$data) \n'
                out += 'temp+="$nums," \n done \n echo $temp >> ' + experiment + '.csv '
            else :
                out += "\n\n"
                out += 'temp="round'+str(round) +"," +node + "," + str(cpus)+ "," + driver + "," +team +",MODIFIED_id-"+ str(model) + "," '\" \n'
                out+='for data in $searchDir/round'+str(round) +'/' +node + '/' + str(cpus)+ '/' + driver + '/' +team +'/MODIFIED_id-'+ bstring + str(model)+ '/*;do \n'
                out += 'nums=$(<$data) \n'
                out += 'temp+="$nums," \n done \n done \n echo $temp >> ' + experiment + '.csv '
    elif teams == "ALL":
        out += "\n\n"
        out += 'temp="round'+str(round) +"," +node + "," + str(cpus)+ "," + driver + "," '\" \n'
        out+='for team in $searchDir/round'+str(round) +'/' +node + '/' + str(cpus)+ '/' + driver + '/*;do \n'
        out += 'temp+="$team," \n '
        out += 'for data in $searchDir/round'+str(round) +'/' +node + '/' + str(cpus)+ '/' + driver + '/$team/id-'+ str(model)+ '/*;do \n'
        out += 'nums=$(<$data) \n'
        out += 'temp+="$nums," \n done \n done \n echo $temp >> ' + experiment + ' '

    with open('COMPILER.sh', 'w+') as f:
        f.write(out)



