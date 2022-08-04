#!/bin/bash 
rm -r scratch/round9/charlie/10/default/ARM-UCSD/id-0/scratch0 
mkdir -p scratch/round9/charlie/10/default/ARM-UCSD/id-0/scratch0 
rm -r outputs/round9/charlie/10/default/ARM-UCSD/id-0 
mkdir -p outputs/round9/charlie/10/default/ARM-UCSD/id-0 
rm -r scratch/round9/charlie/10/default/ARM-UCSD/id-0/scratch0 
mkdir -p scratch/round9/charlie/10/default/ARM-UCSD/id-0/scratch0 
rm -r outputs/round9/charlie/10/default/ARM-UCSD/id-0 
mkdir -p outputs/round9/charlie/10/default/ARM-UCSD/id-0 
rm -r scratch/round9/charlie/10/default/ICSI-UMD/id-0/scratch0 
mkdir -p scratch/round9/charlie/10/default/ICSI-UMD/id-0/scratch0 
rm -r outputs/round9/charlie/10/default/ICSI-UMD/id-0 
mkdir -p outputs/round9/charlie/10/default/ICSI-UMD/id-0 
rm -r scratch/round9/charlie/10/default/ARM-UCSD/id-0/scratch0 
mkdir -p scratch/round9/charlie/10/default/ARM-UCSD/id-0/scratch0 
rm -r outputs/round9/charlie/10/default/ARM-UCSD/id-0 
mkdir -p outputs/round9/charlie/10/default/ARM-UCSD/id-0 
rm -r scratch/round9/charlie/10/default/ICSI-UMD/id-0/scratch0 
mkdir -p scratch/round9/charlie/10/default/ICSI-UMD/id-0/scratch0 
rm -r outputs/round9/charlie/10/default/ICSI-UMD/id-0 
mkdir -p outputs/round9/charlie/10/default/ICSI-UMD/id-0 
rm -r scratch/round9/charlie/10/default/Perspecta-PurdueRutgers/id-0/scratch0 
mkdir -p scratch/round9/charlie/10/default/Perspecta-PurdueRutgers/id-0/scratch0 
rm -r outputs/round9/charlie/10/default/Perspecta-PurdueRutgers/id-0 
mkdir -p outputs/round9/charlie/10/default/Perspecta-PurdueRutgers/id-0 
rm -r scratch/round9/charlie/10/default/ARM-UCSD/id-0/scratch0 
mkdir -p scratch/round9/charlie/10/default/ARM-UCSD/id-0/scratch0 
rm -r outputs/round9/charlie/10/default/ARM-UCSD/id-0 
mkdir -p outputs/round9/charlie/10/default/ARM-UCSD/id-0 
rm -r scratch/round9/charlie/10/default/ICSI-UMD/id-0/scratch0 
mkdir -p scratch/round9/charlie/10/default/ICSI-UMD/id-0/scratch0 
rm -r outputs/round9/charlie/10/default/ICSI-UMD/id-0 
mkdir -p outputs/round9/charlie/10/default/ICSI-UMD/id-0 
rm -r scratch/round9/charlie/10/default/Perspecta-PurdueRutgers/id-0/scratch0 
mkdir -p scratch/round9/charlie/10/default/Perspecta-PurdueRutgers/id-0/scratch0 
rm -r outputs/round9/charlie/10/default/Perspecta-PurdueRutgers/id-0 
mkdir -p outputs/round9/charlie/10/default/Perspecta-PurdueRutgers/id-0 
rm -r scratch/round9/charlie/10/default/TrinitySRITrojAI/id-0/scratch0 
mkdir -p scratch/round9/charlie/10/default/TrinitySRITrojAI/id-0/scratch0 
rm -r outputs/round9/charlie/10/default/TrinitySRITrojAI/id-0 
mkdir -p outputs/round9/charlie/10/default/TrinitySRITrojAI/id-0 
echo "#!/bin/bash 
#SBATCH --partition=isg 
#SBATCH --nodelist=charlie 
#SBATCH --nodes=1 
#SBATCH --cpus-per-task=10 
#SBATCH --gres=gpu:1 
#SBATCH --job-name=trojai_reproducibility 
#SBATCH -o INFO%n.out 
#SBATCH --time=0:20:0 
 
#!/bin/bash 
time " > 0_0.sh 
chmod u=rwx,g=rwx 0_0.sh 
echo singularity run --bind /mnt/isgnas/project/ai/trojai/datasets/round9/round9-test-dataset/models --bind /mnt/isgnas/project/ai/trojai/datasets/round9/round9-test-dataset/models/id-00000000 --bind /mnt/isgnas/project/ai/trojai/datasets/round9/tokenizers/ --bind C:\Users\jal20\2022-surf-trojai\documentation --nv /mnt/isgnas/deploy/trojai/round9/es/submissions/ARM-UCSD/20220505T010001/round9_sub6_6.simg --model_filepath=/mnt/isgnas/project/ai/trojai/datasets/round9/round9-test-dataset/models/id-00000000/model.pt --examples_dirpath=/mnt/isgnas/project/ai/trojai/datasets/round9/round9-test-dataset/models/id-00000000 --tokenizer_filepath=/mnt/isgnas/project/ai/trojai/datasets/round9/tokenizers/distilbert-base-cased.pt --features_filepath=C:\Users\jal20\2022-surf-trojai\documentation/features.csv --round_training_dataset_dirpath=/mnt/isgnas/project/ai/trojai/datasets/round9/round9-train-dataset/ --schema_filepath=/metaparameters_schema.json --metaparameters_filepath=/metaparameters.json --learned_parameters_dirpath=/learned_parameters --scratch_dirpath=C:\Users\jal20\2022-surf-trojai\documentation/scratch/round9/charlie/10/default/ARM-UCSD/id-0/scratch0 --result_filepath=C:\Users\jal20\2022-surf-trojai\documentation/outputs/round9/charlie/10/default/ARM-UCSD/id-0/0.txt  >> 0_0.sh  
sbatch 0_0.sh 
echo "#!/bin/bash 
#SBATCH --partition=isg 
#SBATCH --nodelist=charlie 
#SBATCH --nodes=1 
#SBATCH --cpus-per-task=10 
#SBATCH --gres=gpu:1 
#SBATCH --job-name=trojai_reproducibility 
#SBATCH -o INFO%n.out 
#SBATCH --time=0:20:0 
 
#!/bin/bash 
time " > 1_0.sh 
chmod u=rwx,g=rwx 1_0.sh 
echo singularity run --bind /mnt/isgnas/project/ai/trojai/datasets/round9/round9-test-dataset/models --bind /mnt/isgnas/project/ai/trojai/datasets/round9/round9-test-dataset/models/id-00000000 --bind /mnt/isgnas/project/ai/trojai/datasets/round9/tokenizers/ --bind C:\Users\jal20\2022-surf-trojai\documentation --nv /mnt/isgnas/deploy/trojai/round9/es/submissions/ICSI-UMD/20220322T172002/trojan_detector.simg --model_filepath=/mnt/isgnas/project/ai/trojai/datasets/round9/round9-test-dataset/models/id-00000000/model.pt --examples_dirpath=/mnt/isgnas/project/ai/trojai/datasets/round9/round9-test-dataset/models/id-00000000 --tokenizer_filepath=/mnt/isgnas/project/ai/trojai/datasets/round9/tokenizers/distilbert-base-cased.pt --features_filepath=C:\Users\jal20\2022-surf-trojai\documentation/features.csv --round_training_dataset_dirpath=/mnt/isgnas/project/ai/trojai/datasets/round9/round9-train-dataset/ --schema_filepath=/metaparameters_schema.json --metaparameters_filepath=/metaparameters.json --learned_parameters_dirpath=/learned_parameters --scratch_dirpath=C:\Users\jal20\2022-surf-trojai\documentation/scratch/round9/charlie/10/default/ICSI-UMD/id-0/scratch0 --result_filepath=C:\Users\jal20\2022-surf-trojai\documentation/outputs/round9/charlie/10/default/ICSI-UMD/id-0/0.txt  >> 1_0.sh  
sbatch 1_0.sh 
echo "#!/bin/bash 
#SBATCH --partition=isg 
#SBATCH --nodelist=charlie 
#SBATCH --nodes=1 
#SBATCH --cpus-per-task=10 
#SBATCH --gres=gpu:1 
#SBATCH --job-name=trojai_reproducibility 
#SBATCH -o INFO%n.out 
#SBATCH --time=0:20:0 
 
#!/bin/bash 
time " > 2_0.sh 
chmod u=rwx,g=rwx 2_0.sh 
echo singularity run --bind /mnt/isgnas/project/ai/trojai/datasets/round9/round9-test-dataset/models --bind /mnt/isgnas/project/ai/trojai/datasets/round9/round9-test-dataset/models/id-00000000 --bind /mnt/isgnas/project/ai/trojai/datasets/round9/tokenizers/ --bind C:\Users\jal20\2022-surf-trojai\documentation --nv /mnt/isgnas/deploy/trojai/round9/es/submissions/Perspecta-PurdueRutgers/20220417T150001/r9_abs_re2_15_2.simg --model_filepath=/mnt/isgnas/project/ai/trojai/datasets/round9/round9-test-dataset/models/id-00000000/model.pt --examples_dirpath=/mnt/isgnas/project/ai/trojai/datasets/round9/round9-test-dataset/models/id-00000000 --tokenizer_filepath=/mnt/isgnas/project/ai/trojai/datasets/round9/tokenizers/distilbert-base-cased.pt --features_filepath=C:\Users\jal20\2022-surf-trojai\documentation/features.csv --round_training_dataset_dirpath=/mnt/isgnas/project/ai/trojai/datasets/round9/round9-train-dataset/ --schema_filepath=/metaparameters_schema.json --metaparameters_filepath=/metaparameters.json --learned_parameters_dirpath=/learned_parameters --scratch_dirpath=C:\Users\jal20\2022-surf-trojai\documentation/scratch/round9/charlie/10/default/Perspecta-PurdueRutgers/id-0/scratch0 --result_filepath=C:\Users\jal20\2022-surf-trojai\documentation/outputs/round9/charlie/10/default/Perspecta-PurdueRutgers/id-0/0.txt  >> 2_0.sh  
sbatch 2_0.sh 
echo "#!/bin/bash 
#SBATCH --partition=isg 
#SBATCH --nodelist=charlie 
#SBATCH --nodes=1 
#SBATCH --cpus-per-task=10 
#SBATCH --gres=gpu:1 
#SBATCH --job-name=trojai_reproducibility 
#SBATCH -o INFO%n.out 
#SBATCH --time=0:20:0 
 
#!/bin/bash 
time " > 3_0.sh 
chmod u=rwx,g=rwx 3_0.sh 
echo singularity run --bind /mnt/isgnas/project/ai/trojai/datasets/round9/round9-test-dataset/models --bind /mnt/isgnas/project/ai/trojai/datasets/round9/round9-test-dataset/models/id-00000000 --bind /mnt/isgnas/project/ai/trojai/datasets/round9/tokenizers/ --bind C:\Users\jal20\2022-surf-trojai\documentation --nv /mnt/isgnas/deploy/trojai/round9/es/submissions/TrinitySRITrojAI/20220605T072002/trojai-r9-v5.simg --model_filepath=/mnt/isgnas/project/ai/trojai/datasets/round9/round9-test-dataset/models/id-00000000/model.pt --examples_dirpath=/mnt/isgnas/project/ai/trojai/datasets/round9/round9-test-dataset/models/id-00000000 --tokenizer_filepath=/mnt/isgnas/project/ai/trojai/datasets/round9/tokenizers/distilbert-base-cased.pt --features_filepath=C:\Users\jal20\2022-surf-trojai\documentation/features.csv --round_training_dataset_dirpath=/mnt/isgnas/project/ai/trojai/datasets/round9/round9-train-dataset/ --schema_filepath=/metaparameters_schema.json --metaparameters_filepath=/metaparameters.json --learned_parameters_dirpath=/learned_parameters --scratch_dirpath=C:\Users\jal20\2022-surf-trojai\documentation/scratch/round9/charlie/10/default/TrinitySRITrojAI/id-0/scratch0 --result_filepath=C:\Users\jal20\2022-surf-trojai\documentation/outputs/round9/charlie/10/default/TrinitySRITrojAI/id-0/0.txt  >> 3_0.sh  
sbatch 3_0.sh 
#!/bin/bash 
rm -r scratch/round9/charlie/1/default/ARM-UCSD/id-0/scratch0 
mkdir -p scratch/round9/charlie/1/default/ARM-UCSD/id-0/scratch0 
rm -r outputs/round9/charlie/1/default/ARM-UCSD/id-0 
mkdir -p outputs/round9/charlie/1/default/ARM-UCSD/id-0 
rm -r scratch/round9/charlie/1/default/ARM-UCSD/id-0/scratch0 
mkdir -p scratch/round9/charlie/1/default/ARM-UCSD/id-0/scratch0 
rm -r outputs/round9/charlie/1/default/ARM-UCSD/id-0 
mkdir -p outputs/round9/charlie/1/default/ARM-UCSD/id-0 
rm -r scratch/round9/charlie/1/default/ICSI-UMD/id-0/scratch0 
mkdir -p scratch/round9/charlie/1/default/ICSI-UMD/id-0/scratch0 
rm -r outputs/round9/charlie/1/default/ICSI-UMD/id-0 
mkdir -p outputs/round9/charlie/1/default/ICSI-UMD/id-0 
rm -r scratch/round9/charlie/1/default/ARM-UCSD/id-0/scratch0 
mkdir -p scratch/round9/charlie/1/default/ARM-UCSD/id-0/scratch0 
rm -r outputs/round9/charlie/1/default/ARM-UCSD/id-0 
mkdir -p outputs/round9/charlie/1/default/ARM-UCSD/id-0 
rm -r scratch/round9/charlie/1/default/ICSI-UMD/id-0/scratch0 
mkdir -p scratch/round9/charlie/1/default/ICSI-UMD/id-0/scratch0 
rm -r outputs/round9/charlie/1/default/ICSI-UMD/id-0 
mkdir -p outputs/round9/charlie/1/default/ICSI-UMD/id-0 
rm -r scratch/round9/charlie/1/default/Perspecta-PurdueRutgers/id-0/scratch0 
mkdir -p scratch/round9/charlie/1/default/Perspecta-PurdueRutgers/id-0/scratch0 
rm -r outputs/round9/charlie/1/default/Perspecta-PurdueRutgers/id-0 
mkdir -p outputs/round9/charlie/1/default/Perspecta-PurdueRutgers/id-0 
rm -r scratch/round9/charlie/1/default/ARM-UCSD/id-0/scratch0 
mkdir -p scratch/round9/charlie/1/default/ARM-UCSD/id-0/scratch0 
rm -r outputs/round9/charlie/1/default/ARM-UCSD/id-0 
mkdir -p outputs/round9/charlie/1/default/ARM-UCSD/id-0 
rm -r scratch/round9/charlie/1/default/ICSI-UMD/id-0/scratch0 
mkdir -p scratch/round9/charlie/1/default/ICSI-UMD/id-0/scratch0 
rm -r outputs/round9/charlie/1/default/ICSI-UMD/id-0 
mkdir -p outputs/round9/charlie/1/default/ICSI-UMD/id-0 
rm -r scratch/round9/charlie/1/default/Perspecta-PurdueRutgers/id-0/scratch0 
mkdir -p scratch/round9/charlie/1/default/Perspecta-PurdueRutgers/id-0/scratch0 
rm -r outputs/round9/charlie/1/default/Perspecta-PurdueRutgers/id-0 
mkdir -p outputs/round9/charlie/1/default/Perspecta-PurdueRutgers/id-0 
rm -r scratch/round9/charlie/1/default/TrinitySRITrojAI/id-0/scratch0 
mkdir -p scratch/round9/charlie/1/default/TrinitySRITrojAI/id-0/scratch0 
rm -r outputs/round9/charlie/1/default/TrinitySRITrojAI/id-0 
mkdir -p outputs/round9/charlie/1/default/TrinitySRITrojAI/id-0 
echo "#!/bin/bash 
#SBATCH --partition=isg 
#SBATCH --nodelist=charlie 
#SBATCH --nodes=1 
#SBATCH --cpus-per-task=1 
#SBATCH --gres=gpu:1 
#SBATCH --job-name=trojai_reproducibility 
#SBATCH -o INFO%n.out 
#SBATCH --time=0:20:0 
 
#!/bin/bash 
time " > 0_0.sh 
chmod u=rwx,g=rwx 0_0.sh 
echo singularity run --bind /mnt/isgnas/project/ai/trojai/datasets/round9/round9-test-dataset/models --bind /mnt/isgnas/project/ai/trojai/datasets/round9/round9-test-dataset/models/id-00000000 --bind /mnt/isgnas/project/ai/trojai/datasets/round9/tokenizers/ --bind C:\Users\jal20\2022-surf-trojai\documentation --nv /mnt/isgnas/deploy/trojai/round9/es/submissions/ARM-UCSD/20220505T010001/round9_sub6_6.simg --model_filepath=/mnt/isgnas/project/ai/trojai/datasets/round9/round9-test-dataset/models/id-00000000/model.pt --examples_dirpath=/mnt/isgnas/project/ai/trojai/datasets/round9/round9-test-dataset/models/id-00000000 --tokenizer_filepath=/mnt/isgnas/project/ai/trojai/datasets/round9/tokenizers/distilbert-base-cased.pt --features_filepath=C:\Users\jal20\2022-surf-trojai\documentation/features.csv --round_training_dataset_dirpath=/mnt/isgnas/project/ai/trojai/datasets/round9/round9-train-dataset/ --schema_filepath=/metaparameters_schema.json --metaparameters_filepath=/metaparameters.json --learned_parameters_dirpath=/learned_parameters --scratch_dirpath=C:\Users\jal20\2022-surf-trojai\documentation/scratch/round9/charlie/1/default/ARM-UCSD/id-0/scratch0 --result_filepath=C:\Users\jal20\2022-surf-trojai\documentation/outputs/round9/charlie/1/default/ARM-UCSD/id-0/0.txt  >> 0_0.sh  
sbatch 0_0.sh 
echo "#!/bin/bash 
#SBATCH --partition=isg 
#SBATCH --nodelist=charlie 
#SBATCH --nodes=1 
#SBATCH --cpus-per-task=1 
#SBATCH --gres=gpu:1 
#SBATCH --job-name=trojai_reproducibility 
#SBATCH -o INFO%n.out 
#SBATCH --time=0:20:0 
 
#!/bin/bash 
time " > 1_0.sh 
chmod u=rwx,g=rwx 1_0.sh 
echo singularity run --bind /mnt/isgnas/project/ai/trojai/datasets/round9/round9-test-dataset/models --bind /mnt/isgnas/project/ai/trojai/datasets/round9/round9-test-dataset/models/id-00000000 --bind /mnt/isgnas/project/ai/trojai/datasets/round9/tokenizers/ --bind C:\Users\jal20\2022-surf-trojai\documentation --nv /mnt/isgnas/deploy/trojai/round9/es/submissions/ICSI-UMD/20220322T172002/trojan_detector.simg --model_filepath=/mnt/isgnas/project/ai/trojai/datasets/round9/round9-test-dataset/models/id-00000000/model.pt --examples_dirpath=/mnt/isgnas/project/ai/trojai/datasets/round9/round9-test-dataset/models/id-00000000 --tokenizer_filepath=/mnt/isgnas/project/ai/trojai/datasets/round9/tokenizers/distilbert-base-cased.pt --features_filepath=C:\Users\jal20\2022-surf-trojai\documentation/features.csv --round_training_dataset_dirpath=/mnt/isgnas/project/ai/trojai/datasets/round9/round9-train-dataset/ --schema_filepath=/metaparameters_schema.json --metaparameters_filepath=/metaparameters.json --learned_parameters_dirpath=/learned_parameters --scratch_dirpath=C:\Users\jal20\2022-surf-trojai\documentation/scratch/round9/charlie/1/default/ICSI-UMD/id-0/scratch0 --result_filepath=C:\Users\jal20\2022-surf-trojai\documentation/outputs/round9/charlie/1/default/ICSI-UMD/id-0/0.txt  >> 1_0.sh  
sbatch 1_0.sh 
echo "#!/bin/bash 
#SBATCH --partition=isg 
#SBATCH --nodelist=charlie 
#SBATCH --nodes=1 
#SBATCH --cpus-per-task=1 
#SBATCH --gres=gpu:1 
#SBATCH --job-name=trojai_reproducibility 
#SBATCH -o INFO%n.out 
#SBATCH --time=0:20:0 
 
#!/bin/bash 
time " > 2_0.sh 
chmod u=rwx,g=rwx 2_0.sh 
echo singularity run --bind /mnt/isgnas/project/ai/trojai/datasets/round9/round9-test-dataset/models --bind /mnt/isgnas/project/ai/trojai/datasets/round9/round9-test-dataset/models/id-00000000 --bind /mnt/isgnas/project/ai/trojai/datasets/round9/tokenizers/ --bind C:\Users\jal20\2022-surf-trojai\documentation --nv /mnt/isgnas/deploy/trojai/round9/es/submissions/Perspecta-PurdueRutgers/20220417T150001/r9_abs_re2_15_2.simg --model_filepath=/mnt/isgnas/project/ai/trojai/datasets/round9/round9-test-dataset/models/id-00000000/model.pt --examples_dirpath=/mnt/isgnas/project/ai/trojai/datasets/round9/round9-test-dataset/models/id-00000000 --tokenizer_filepath=/mnt/isgnas/project/ai/trojai/datasets/round9/tokenizers/distilbert-base-cased.pt --features_filepath=C:\Users\jal20\2022-surf-trojai\documentation/features.csv --round_training_dataset_dirpath=/mnt/isgnas/project/ai/trojai/datasets/round9/round9-train-dataset/ --schema_filepath=/metaparameters_schema.json --metaparameters_filepath=/metaparameters.json --learned_parameters_dirpath=/learned_parameters --scratch_dirpath=C:\Users\jal20\2022-surf-trojai\documentation/scratch/round9/charlie/1/default/Perspecta-PurdueRutgers/id-0/scratch0 --result_filepath=C:\Users\jal20\2022-surf-trojai\documentation/outputs/round9/charlie/1/default/Perspecta-PurdueRutgers/id-0/0.txt  >> 2_0.sh  
sbatch 2_0.sh 
echo "#!/bin/bash 
#SBATCH --partition=isg 
#SBATCH --nodelist=charlie 
#SBATCH --nodes=1 
#SBATCH --cpus-per-task=1 
#SBATCH --gres=gpu:1 
#SBATCH --job-name=trojai_reproducibility 
#SBATCH -o INFO%n.out 
#SBATCH --time=0:20:0 
 
#!/bin/bash 
time " > 3_0.sh 
chmod u=rwx,g=rwx 3_0.sh 
echo singularity run --bind /mnt/isgnas/project/ai/trojai/datasets/round9/round9-test-dataset/models --bind /mnt/isgnas/project/ai/trojai/datasets/round9/round9-test-dataset/models/id-00000000 --bind /mnt/isgnas/project/ai/trojai/datasets/round9/tokenizers/ --bind C:\Users\jal20\2022-surf-trojai\documentation --nv /mnt/isgnas/deploy/trojai/round9/es/submissions/TrinitySRITrojAI/20220605T072002/trojai-r9-v5.simg --model_filepath=/mnt/isgnas/project/ai/trojai/datasets/round9/round9-test-dataset/models/id-00000000/model.pt --examples_dirpath=/mnt/isgnas/project/ai/trojai/datasets/round9/round9-test-dataset/models/id-00000000 --tokenizer_filepath=/mnt/isgnas/project/ai/trojai/datasets/round9/tokenizers/distilbert-base-cased.pt --features_filepath=C:\Users\jal20\2022-surf-trojai\documentation/features.csv --round_training_dataset_dirpath=/mnt/isgnas/project/ai/trojai/datasets/round9/round9-train-dataset/ --schema_filepath=/metaparameters_schema.json --metaparameters_filepath=/metaparameters.json --learned_parameters_dirpath=/learned_parameters --scratch_dirpath=C:\Users\jal20\2022-surf-trojai\documentation/scratch/round9/charlie/1/default/TrinitySRITrojAI/id-0/scratch0 --result_filepath=C:\Users\jal20\2022-surf-trojai\documentation/outputs/round9/charlie/1/default/TrinitySRITrojAI/id-0/0.txt  >> 3_0.sh  
sbatch 3_0.sh 
#!/bin/bash 
rm -r scratch/round4/charlie/10/default/id-0/id-0/scratch0 
mkdir -p scratch/round4/charlie/10/default/id-0/id-0/scratch0 
rm -r outputs/round4/charlie/10/default/id-0/id-0 
mkdir -p outputs/round4/charlie/10/default/id-0/id-0 
#!/bin/bash 
rm -r scratch/round9/charlie/10/default/ARM-UCSD/id-0/scratch0 
mkdir -p scratch/round9/charlie/10/default/ARM-UCSD/id-0/scratch0 
rm -r outputs/round9/charlie/10/default/ARM-UCSD/id-0 
mkdir -p outputs/round9/charlie/10/default/ARM-UCSD/id-0 
rm -r scratch/round9/charlie/10/default/ARM-UCSD/id-0/scratch0 
mkdir -p scratch/round9/charlie/10/default/ARM-UCSD/id-0/scratch0 
rm -r outputs/round9/charlie/10/default/ARM-UCSD/id-0 
mkdir -p outputs/round9/charlie/10/default/ARM-UCSD/id-0 
rm -r scratch/round9/charlie/10/default/ICSI-UMD/id-0/scratch0 
mkdir -p scratch/round9/charlie/10/default/ICSI-UMD/id-0/scratch0 
rm -r outputs/round9/charlie/10/default/ICSI-UMD/id-0 
mkdir -p outputs/round9/charlie/10/default/ICSI-UMD/id-0 
rm -r scratch/round9/charlie/10/default/ARM-UCSD/id-0/scratch0 
mkdir -p scratch/round9/charlie/10/default/ARM-UCSD/id-0/scratch0 
rm -r outputs/round9/charlie/10/default/ARM-UCSD/id-0 
mkdir -p outputs/round9/charlie/10/default/ARM-UCSD/id-0 
rm -r scratch/round9/charlie/10/default/ICSI-UMD/id-0/scratch0 
mkdir -p scratch/round9/charlie/10/default/ICSI-UMD/id-0/scratch0 
rm -r outputs/round9/charlie/10/default/ICSI-UMD/id-0 
mkdir -p outputs/round9/charlie/10/default/ICSI-UMD/id-0 
rm -r scratch/round9/charlie/10/default/Perspecta-PurdueRutgers/id-0/scratch0 
mkdir -p scratch/round9/charlie/10/default/Perspecta-PurdueRutgers/id-0/scratch0 
rm -r outputs/round9/charlie/10/default/Perspecta-PurdueRutgers/id-0 
mkdir -p outputs/round9/charlie/10/default/Perspecta-PurdueRutgers/id-0 
rm -r scratch/round9/charlie/10/default/ARM-UCSD/id-0/scratch0 
mkdir -p scratch/round9/charlie/10/default/ARM-UCSD/id-0/scratch0 
rm -r outputs/round9/charlie/10/default/ARM-UCSD/id-0 
mkdir -p outputs/round9/charlie/10/default/ARM-UCSD/id-0 
rm -r scratch/round9/charlie/10/default/ICSI-UMD/id-0/scratch0 
mkdir -p scratch/round9/charlie/10/default/ICSI-UMD/id-0/scratch0 
rm -r outputs/round9/charlie/10/default/ICSI-UMD/id-0 
mkdir -p outputs/round9/charlie/10/default/ICSI-UMD/id-0 
rm -r scratch/round9/charlie/10/default/Perspecta-PurdueRutgers/id-0/scratch0 
mkdir -p scratch/round9/charlie/10/default/Perspecta-PurdueRutgers/id-0/scratch0 
rm -r outputs/round9/charlie/10/default/Perspecta-PurdueRutgers/id-0 
mkdir -p outputs/round9/charlie/10/default/Perspecta-PurdueRutgers/id-0 
rm -r scratch/round9/charlie/10/default/TrinitySRITrojAI/id-0/scratch0 
mkdir -p scratch/round9/charlie/10/default/TrinitySRITrojAI/id-0/scratch0 
rm -r outputs/round9/charlie/10/default/TrinitySRITrojAI/id-0 
mkdir -p outputs/round9/charlie/10/default/TrinitySRITrojAI/id-0 
echo "#!/bin/bash 
#SBATCH --partition=isg 
#SBATCH --nodelist=charlie 
#SBATCH --nodes=1 
#SBATCH --cpus-per-task=10 
#SBATCH --gres=gpu:1 
#SBATCH --job-name=trojai_reproducibility 
#SBATCH -o INFO%n.out 
#SBATCH --time=0:20:0 
 
#!/bin/bash 
time " > 0_0.sh 
chmod u=rwx,g=rwx 0_0.sh 
echo singularity run --bind /mnt/isgnas/project/ai/trojai/datasets/round9/round9-test-dataset/models --bind /mnt/isgnas/project/ai/trojai/datasets/round9/round9-test-dataset/models/id-00000000 --bind /mnt/isgnas/project/ai/trojai/datasets/round9/tokenizers/ --bind C:\Users\jal20\2022-surf-trojai\documentation --nv /mnt/isgnas/deploy/trojai/round9/es/submissions/ARM-UCSD/20220505T010001/round9_sub6_6.simg --model_filepath=/mnt/isgnas/project/ai/trojai/datasets/round9/round9-test-dataset/models/id-00000000/model.pt --examples_dirpath=/mnt/isgnas/project/ai/trojai/datasets/round9/round9-test-dataset/models/id-00000000 --tokenizer_filepath=/mnt/isgnas/project/ai/trojai/datasets/round9/tokenizers/distilbert-base-cased.pt --features_filepath=C:\Users\jal20\2022-surf-trojai\documentation/features.csv --round_training_dataset_dirpath=/mnt/isgnas/project/ai/trojai/datasets/round9/round9-train-dataset/ --schema_filepath=/metaparameters_schema.json --metaparameters_filepath=/metaparameters.json --learned_parameters_dirpath=/learned_parameters --scratch_dirpath=C:\Users\jal20\2022-surf-trojai\documentation/scratch/round9/charlie/10/default/ARM-UCSD/id-0/scratch0 --result_filepath=C:\Users\jal20\2022-surf-trojai\documentation/outputs/round9/charlie/10/default/ARM-UCSD/id-0/0.txt  >> 0_0.sh  
sbatch 0_0.sh 
echo "#!/bin/bash 
#SBATCH --partition=isg 
#SBATCH --nodelist=charlie 
#SBATCH --nodes=1 
#SBATCH --cpus-per-task=10 
#SBATCH --gres=gpu:1 
#SBATCH --job-name=trojai_reproducibility 
#SBATCH -o INFO%n.out 
#SBATCH --time=0:20:0 
 
#!/bin/bash 
time " > 1_0.sh 
chmod u=rwx,g=rwx 1_0.sh 
echo singularity run --bind /mnt/isgnas/project/ai/trojai/datasets/round9/round9-test-dataset/models --bind /mnt/isgnas/project/ai/trojai/datasets/round9/round9-test-dataset/models/id-00000000 --bind /mnt/isgnas/project/ai/trojai/datasets/round9/tokenizers/ --bind C:\Users\jal20\2022-surf-trojai\documentation --nv /mnt/isgnas/deploy/trojai/round9/es/submissions/ICSI-UMD/20220322T172002/trojan_detector.simg --model_filepath=/mnt/isgnas/project/ai/trojai/datasets/round9/round9-test-dataset/models/id-00000000/model.pt --examples_dirpath=/mnt/isgnas/project/ai/trojai/datasets/round9/round9-test-dataset/models/id-00000000 --tokenizer_filepath=/mnt/isgnas/project/ai/trojai/datasets/round9/tokenizers/distilbert-base-cased.pt --features_filepath=C:\Users\jal20\2022-surf-trojai\documentation/features.csv --round_training_dataset_dirpath=/mnt/isgnas/project/ai/trojai/datasets/round9/round9-train-dataset/ --schema_filepath=/metaparameters_schema.json --metaparameters_filepath=/metaparameters.json --learned_parameters_dirpath=/learned_parameters --scratch_dirpath=C:\Users\jal20\2022-surf-trojai\documentation/scratch/round9/charlie/10/default/ICSI-UMD/id-0/scratch0 --result_filepath=C:\Users\jal20\2022-surf-trojai\documentation/outputs/round9/charlie/10/default/ICSI-UMD/id-0/0.txt  >> 1_0.sh  
sbatch 1_0.sh 
echo "#!/bin/bash 
#SBATCH --partition=isg 
#SBATCH --nodelist=charlie 
#SBATCH --nodes=1 
#SBATCH --cpus-per-task=10 
#SBATCH --gres=gpu:1 
#SBATCH --job-name=trojai_reproducibility 
#SBATCH -o INFO%n.out 
#SBATCH --time=0:20:0 
 
#!/bin/bash 
time " > 2_0.sh 
chmod u=rwx,g=rwx 2_0.sh 
echo singularity run --bind /mnt/isgnas/project/ai/trojai/datasets/round9/round9-test-dataset/models --bind /mnt/isgnas/project/ai/trojai/datasets/round9/round9-test-dataset/models/id-00000000 --bind /mnt/isgnas/project/ai/trojai/datasets/round9/tokenizers/ --bind C:\Users\jal20\2022-surf-trojai\documentation --nv /mnt/isgnas/deploy/trojai/round9/es/submissions/Perspecta-PurdueRutgers/20220417T150001/r9_abs_re2_15_2.simg --model_filepath=/mnt/isgnas/project/ai/trojai/datasets/round9/round9-test-dataset/models/id-00000000/model.pt --examples_dirpath=/mnt/isgnas/project/ai/trojai/datasets/round9/round9-test-dataset/models/id-00000000 --tokenizer_filepath=/mnt/isgnas/project/ai/trojai/datasets/round9/tokenizers/distilbert-base-cased.pt --features_filepath=C:\Users\jal20\2022-surf-trojai\documentation/features.csv --round_training_dataset_dirpath=/mnt/isgnas/project/ai/trojai/datasets/round9/round9-train-dataset/ --schema_filepath=/metaparameters_schema.json --metaparameters_filepath=/metaparameters.json --learned_parameters_dirpath=/learned_parameters --scratch_dirpath=C:\Users\jal20\2022-surf-trojai\documentation/scratch/round9/charlie/10/default/Perspecta-PurdueRutgers/id-0/scratch0 --result_filepath=C:\Users\jal20\2022-surf-trojai\documentation/outputs/round9/charlie/10/default/Perspecta-PurdueRutgers/id-0/0.txt  >> 2_0.sh  
sbatch 2_0.sh 
echo "#!/bin/bash 
#SBATCH --partition=isg 
#SBATCH --nodelist=charlie 
#SBATCH --nodes=1 
#SBATCH --cpus-per-task=10 
#SBATCH --gres=gpu:1 
#SBATCH --job-name=trojai_reproducibility 
#SBATCH -o INFO%n.out 
#SBATCH --time=0:20:0 
 
#!/bin/bash 
time " > 3_0.sh 
chmod u=rwx,g=rwx 3_0.sh 
echo singularity run --bind /mnt/isgnas/project/ai/trojai/datasets/round9/round9-test-dataset/models --bind /mnt/isgnas/project/ai/trojai/datasets/round9/round9-test-dataset/models/id-00000000 --bind /mnt/isgnas/project/ai/trojai/datasets/round9/tokenizers/ --bind C:\Users\jal20\2022-surf-trojai\documentation --nv /mnt/isgnas/deploy/trojai/round9/es/submissions/TrinitySRITrojAI/20220605T072002/trojai-r9-v5.simg --model_filepath=/mnt/isgnas/project/ai/trojai/datasets/round9/round9-test-dataset/models/id-00000000/model.pt --examples_dirpath=/mnt/isgnas/project/ai/trojai/datasets/round9/round9-test-dataset/models/id-00000000 --tokenizer_filepath=/mnt/isgnas/project/ai/trojai/datasets/round9/tokenizers/distilbert-base-cased.pt --features_filepath=C:\Users\jal20\2022-surf-trojai\documentation/features.csv --round_training_dataset_dirpath=/mnt/isgnas/project/ai/trojai/datasets/round9/round9-train-dataset/ --schema_filepath=/metaparameters_schema.json --metaparameters_filepath=/metaparameters.json --learned_parameters_dirpath=/learned_parameters --scratch_dirpath=C:\Users\jal20\2022-surf-trojai\documentation/scratch/round9/charlie/10/default/TrinitySRITrojAI/id-0/scratch0 --result_filepath=C:\Users\jal20\2022-surf-trojai\documentation/outputs/round9/charlie/10/default/TrinitySRITrojAI/id-0/0.txt  >> 3_0.sh  
sbatch 3_0.sh 
#!/bin/bash 
rm -r scratch/round9/charlie/1/default/ARM-UCSD/id-0/scratch0 
mkdir -p scratch/round9/charlie/1/default/ARM-UCSD/id-0/scratch0 
rm -r outputs/round9/charlie/1/default/ARM-UCSD/id-0 
mkdir -p outputs/round9/charlie/1/default/ARM-UCSD/id-0 
rm -r scratch/round9/charlie/1/default/ARM-UCSD/id-0/scratch0 
mkdir -p scratch/round9/charlie/1/default/ARM-UCSD/id-0/scratch0 
rm -r outputs/round9/charlie/1/default/ARM-UCSD/id-0 
mkdir -p outputs/round9/charlie/1/default/ARM-UCSD/id-0 
rm -r scratch/round9/charlie/1/default/ICSI-UMD/id-0/scratch0 
mkdir -p scratch/round9/charlie/1/default/ICSI-UMD/id-0/scratch0 
rm -r outputs/round9/charlie/1/default/ICSI-UMD/id-0 
mkdir -p outputs/round9/charlie/1/default/ICSI-UMD/id-0 
rm -r scratch/round9/charlie/1/default/ARM-UCSD/id-0/scratch0 
mkdir -p scratch/round9/charlie/1/default/ARM-UCSD/id-0/scratch0 
rm -r outputs/round9/charlie/1/default/ARM-UCSD/id-0 
mkdir -p outputs/round9/charlie/1/default/ARM-UCSD/id-0 
rm -r scratch/round9/charlie/1/default/ICSI-UMD/id-0/scratch0 
mkdir -p scratch/round9/charlie/1/default/ICSI-UMD/id-0/scratch0 
rm -r outputs/round9/charlie/1/default/ICSI-UMD/id-0 
mkdir -p outputs/round9/charlie/1/default/ICSI-UMD/id-0 
rm -r scratch/round9/charlie/1/default/Perspecta-PurdueRutgers/id-0/scratch0 
mkdir -p scratch/round9/charlie/1/default/Perspecta-PurdueRutgers/id-0/scratch0 
rm -r outputs/round9/charlie/1/default/Perspecta-PurdueRutgers/id-0 
mkdir -p outputs/round9/charlie/1/default/Perspecta-PurdueRutgers/id-0 
rm -r scratch/round9/charlie/1/default/ARM-UCSD/id-0/scratch0 
mkdir -p scratch/round9/charlie/1/default/ARM-UCSD/id-0/scratch0 
rm -r outputs/round9/charlie/1/default/ARM-UCSD/id-0 
mkdir -p outputs/round9/charlie/1/default/ARM-UCSD/id-0 
rm -r scratch/round9/charlie/1/default/ICSI-UMD/id-0/scratch0 
mkdir -p scratch/round9/charlie/1/default/ICSI-UMD/id-0/scratch0 
rm -r outputs/round9/charlie/1/default/ICSI-UMD/id-0 
mkdir -p outputs/round9/charlie/1/default/ICSI-UMD/id-0 
rm -r scratch/round9/charlie/1/default/Perspecta-PurdueRutgers/id-0/scratch0 
mkdir -p scratch/round9/charlie/1/default/Perspecta-PurdueRutgers/id-0/scratch0 
rm -r outputs/round9/charlie/1/default/Perspecta-PurdueRutgers/id-0 
mkdir -p outputs/round9/charlie/1/default/Perspecta-PurdueRutgers/id-0 
rm -r scratch/round9/charlie/1/default/TrinitySRITrojAI/id-0/scratch0 
mkdir -p scratch/round9/charlie/1/default/TrinitySRITrojAI/id-0/scratch0 
rm -r outputs/round9/charlie/1/default/TrinitySRITrojAI/id-0 
mkdir -p outputs/round9/charlie/1/default/TrinitySRITrojAI/id-0 
echo "#!/bin/bash 
#SBATCH --partition=isg 
#SBATCH --nodelist=charlie 
#SBATCH --nodes=1 
#SBATCH --cpus-per-task=1 
#SBATCH --gres=gpu:1 
#SBATCH --job-name=trojai_reproducibility 
#SBATCH -o INFO%n.out 
#SBATCH --time=0:20:0 
 
#!/bin/bash 
time " > 0_0.sh 
chmod u=rwx,g=rwx 0_0.sh 
echo singularity run --bind /mnt/isgnas/project/ai/trojai/datasets/round9/round9-test-dataset/models --bind /mnt/isgnas/project/ai/trojai/datasets/round9/round9-test-dataset/models/id-00000000 --bind /mnt/isgnas/project/ai/trojai/datasets/round9/tokenizers/ --bind C:\Users\jal20\2022-surf-trojai\documentation --nv /mnt/isgnas/deploy/trojai/round9/es/submissions/ARM-UCSD/20220505T010001/round9_sub6_6.simg --model_filepath=/mnt/isgnas/project/ai/trojai/datasets/round9/round9-test-dataset/models/id-00000000/model.pt --examples_dirpath=/mnt/isgnas/project/ai/trojai/datasets/round9/round9-test-dataset/models/id-00000000 --tokenizer_filepath=/mnt/isgnas/project/ai/trojai/datasets/round9/tokenizers/distilbert-base-cased.pt --features_filepath=C:\Users\jal20\2022-surf-trojai\documentation/features.csv --round_training_dataset_dirpath=/mnt/isgnas/project/ai/trojai/datasets/round9/round9-train-dataset/ --schema_filepath=/metaparameters_schema.json --metaparameters_filepath=/metaparameters.json --learned_parameters_dirpath=/learned_parameters --scratch_dirpath=C:\Users\jal20\2022-surf-trojai\documentation/scratch/round9/charlie/1/default/ARM-UCSD/id-0/scratch0 --result_filepath=C:\Users\jal20\2022-surf-trojai\documentation/outputs/round9/charlie/1/default/ARM-UCSD/id-0/0.txt  >> 0_0.sh  
sbatch 0_0.sh 
echo "#!/bin/bash 
#SBATCH --partition=isg 
#SBATCH --nodelist=charlie 
#SBATCH --nodes=1 
#SBATCH --cpus-per-task=1 
#SBATCH --gres=gpu:1 
#SBATCH --job-name=trojai_reproducibility 
#SBATCH -o INFO%n.out 
#SBATCH --time=0:20:0 
 
#!/bin/bash 
time " > 1_0.sh 
chmod u=rwx,g=rwx 1_0.sh 
echo singularity run --bind /mnt/isgnas/project/ai/trojai/datasets/round9/round9-test-dataset/models --bind /mnt/isgnas/project/ai/trojai/datasets/round9/round9-test-dataset/models/id-00000000 --bind /mnt/isgnas/project/ai/trojai/datasets/round9/tokenizers/ --bind C:\Users\jal20\2022-surf-trojai\documentation --nv /mnt/isgnas/deploy/trojai/round9/es/submissions/ICSI-UMD/20220322T172002/trojan_detector.simg --model_filepath=/mnt/isgnas/project/ai/trojai/datasets/round9/round9-test-dataset/models/id-00000000/model.pt --examples_dirpath=/mnt/isgnas/project/ai/trojai/datasets/round9/round9-test-dataset/models/id-00000000 --tokenizer_filepath=/mnt/isgnas/project/ai/trojai/datasets/round9/tokenizers/distilbert-base-cased.pt --features_filepath=C:\Users\jal20\2022-surf-trojai\documentation/features.csv --round_training_dataset_dirpath=/mnt/isgnas/project/ai/trojai/datasets/round9/round9-train-dataset/ --schema_filepath=/metaparameters_schema.json --metaparameters_filepath=/metaparameters.json --learned_parameters_dirpath=/learned_parameters --scratch_dirpath=C:\Users\jal20\2022-surf-trojai\documentation/scratch/round9/charlie/1/default/ICSI-UMD/id-0/scratch0 --result_filepath=C:\Users\jal20\2022-surf-trojai\documentation/outputs/round9/charlie/1/default/ICSI-UMD/id-0/0.txt  >> 1_0.sh  
sbatch 1_0.sh 
echo "#!/bin/bash 
#SBATCH --partition=isg 
#SBATCH --nodelist=charlie 
#SBATCH --nodes=1 
#SBATCH --cpus-per-task=1 
#SBATCH --gres=gpu:1 
#SBATCH --job-name=trojai_reproducibility 
#SBATCH -o INFO%n.out 
#SBATCH --time=0:20:0 
 
#!/bin/bash 
time " > 2_0.sh 
chmod u=rwx,g=rwx 2_0.sh 
echo singularity run --bind /mnt/isgnas/project/ai/trojai/datasets/round9/round9-test-dataset/models --bind /mnt/isgnas/project/ai/trojai/datasets/round9/round9-test-dataset/models/id-00000000 --bind /mnt/isgnas/project/ai/trojai/datasets/round9/tokenizers/ --bind C:\Users\jal20\2022-surf-trojai\documentation --nv /mnt/isgnas/deploy/trojai/round9/es/submissions/Perspecta-PurdueRutgers/20220417T150001/r9_abs_re2_15_2.simg --model_filepath=/mnt/isgnas/project/ai/trojai/datasets/round9/round9-test-dataset/models/id-00000000/model.pt --examples_dirpath=/mnt/isgnas/project/ai/trojai/datasets/round9/round9-test-dataset/models/id-00000000 --tokenizer_filepath=/mnt/isgnas/project/ai/trojai/datasets/round9/tokenizers/distilbert-base-cased.pt --features_filepath=C:\Users\jal20\2022-surf-trojai\documentation/features.csv --round_training_dataset_dirpath=/mnt/isgnas/project/ai/trojai/datasets/round9/round9-train-dataset/ --schema_filepath=/metaparameters_schema.json --metaparameters_filepath=/metaparameters.json --learned_parameters_dirpath=/learned_parameters --scratch_dirpath=C:\Users\jal20\2022-surf-trojai\documentation/scratch/round9/charlie/1/default/Perspecta-PurdueRutgers/id-0/scratch0 --result_filepath=C:\Users\jal20\2022-surf-trojai\documentation/outputs/round9/charlie/1/default/Perspecta-PurdueRutgers/id-0/0.txt  >> 2_0.sh  
sbatch 2_0.sh 
echo "#!/bin/bash 
#SBATCH --partition=isg 
#SBATCH --nodelist=charlie 
#SBATCH --nodes=1 
#SBATCH --cpus-per-task=1 
#SBATCH --gres=gpu:1 
#SBATCH --job-name=trojai_reproducibility 
#SBATCH -o INFO%n.out 
#SBATCH --time=0:20:0 
 
#!/bin/bash 
time " > 3_0.sh 
chmod u=rwx,g=rwx 3_0.sh 
echo singularity run --bind /mnt/isgnas/project/ai/trojai/datasets/round9/round9-test-dataset/models --bind /mnt/isgnas/project/ai/trojai/datasets/round9/round9-test-dataset/models/id-00000000 --bind /mnt/isgnas/project/ai/trojai/datasets/round9/tokenizers/ --bind C:\Users\jal20\2022-surf-trojai\documentation --nv /mnt/isgnas/deploy/trojai/round9/es/submissions/TrinitySRITrojAI/20220605T072002/trojai-r9-v5.simg --model_filepath=/mnt/isgnas/project/ai/trojai/datasets/round9/round9-test-dataset/models/id-00000000/model.pt --examples_dirpath=/mnt/isgnas/project/ai/trojai/datasets/round9/round9-test-dataset/models/id-00000000 --tokenizer_filepath=/mnt/isgnas/project/ai/trojai/datasets/round9/tokenizers/distilbert-base-cased.pt --features_filepath=C:\Users\jal20\2022-surf-trojai\documentation/features.csv --round_training_dataset_dirpath=/mnt/isgnas/project/ai/trojai/datasets/round9/round9-train-dataset/ --schema_filepath=/metaparameters_schema.json --metaparameters_filepath=/metaparameters.json --learned_parameters_dirpath=/learned_parameters --scratch_dirpath=C:\Users\jal20\2022-surf-trojai\documentation/scratch/round9/charlie/1/default/TrinitySRITrojAI/id-0/scratch0 --result_filepath=C:\Users\jal20\2022-surf-trojai\documentation/outputs/round9/charlie/1/default/TrinitySRITrojAI/id-0/0.txt  >> 3_0.sh  
sbatch 3_0.sh 
