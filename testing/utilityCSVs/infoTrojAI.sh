#!/bin/bash

# bash script that iterates through all directories and creates a csv of all detector submissions 
searchDir=/mnt/isgnas/project/ai/trojai/rounds-backup

for entry in $searchDir/*;do
        entry=$(basename $entry)
        for team in $searchDir/$entry/es/submissions/*;do
                team=$(basename $team)
                for version in $searchDir/$entry/es/submissions/$team/*;do
                        version=$(basename $version)
                        for file in $searchDir/$entry/es/submissions/$team/$version/*;do       
                                file=$(basename $file)
                                temp=""$entry","$team","$version","$file""
                                 echo "$temp" >> infoTrojAi.csv
           done
        done
    done
done
