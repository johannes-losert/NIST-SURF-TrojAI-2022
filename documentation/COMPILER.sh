#!/bin/bash
searchDir=C:\Users\jal20\2022-surf-trojai\documentation 
temp="round,node,cpus,driver,team,model,1" 
echo $temp >> CoresDeterminism9.csv 


temp="round9,charlie,1,default,ARM-UCSD,id-0" 
for data in $searchDir/round9/charlie/1/default/ARM-UCSD/id-0/*;do 
nums=$(<$data) 
temp+="$nums," 
 done 
 echo $temp >> CoresDeterminism9.csv 

temp="round9,charlie,1,default,ICSI-UMD,id-0" 
for data in $searchDir/round9/charlie/1/default/ICSI-UMD/id-0/*;do 
nums=$(<$data) 
temp+="$nums," 
 done 
 echo $temp >> CoresDeterminism9.csv 

temp="round9,charlie,1,default,Perspecta-PurdueRutgers,id-0" 
for data in $searchDir/round9/charlie/1/default/Perspecta-PurdueRutgers/id-0/*;do 
nums=$(<$data) 
temp+="$nums," 
 done 
 echo $temp >> CoresDeterminism9.csv 

temp="round9,charlie,1,default,TrinitySRITrojAI,id-0" 
for data in $searchDir/round9/charlie/1/default/TrinitySRITrojAI/id-0/*;do 
nums=$(<$data) 
temp+="$nums," 
 done 
 echo $temp >> CoresDeterminism9.csv 