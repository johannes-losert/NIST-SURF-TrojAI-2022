#!/bin/bash

# bash script used to generate tokenizer info csv file 

  searchDir=/mnt/isgnas/project/ai/trojai/datasets

 for round in $searchDir/*;do
         TOKENIZER_FILENAME=0
         test_dataset=$round-test-dataset
         MODELS_DIR=$searchDir/$(basename $round)/$(basename $test_dataset)/models
         for id in $MODELS_DIR/*;do
           if [ ${$(basename $round):-1} -le 7 ]; then
              TOKENIZER_FILENAME=`cat $id/config.json | python3 -c "import sys, json; print(json.load(sys.stdin)['embedding_flavor'])"`
           else
              TOKENIZER_FILENAME=`cat $id/config.json | python3 -c "import sys, json; print(json.load(sys.stdin)['model_architecture'])"`

           fi

        tokenizer_filepath=""$(basename $round)","$(basename $id)","$TOKENIZER_FILENAME""      
        echo "$tokenizer_filepath" >> tokenizerinfo.csv
    done
done
