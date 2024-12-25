#!/bin/bash

# file as agrument
if [[ $# -ne 1 ]]; then
  echo "Usage: $0 name_of_simulation"
  exit 1
fi

if [ -z "$TT_PROJECT_NAME" ]; then
    echo "env variable PROJECT_NAME is not set use `export PROJECT_NAME=xxx`"
    exit 1
fi


#create the file name
FILE="tb_${TT_PROJECT_NAME}_$1.sch"
RAW_FILE="tb_${TT_PROJECT_NAME}_$1.raw"
echo "create $FILE"
cp tb_template.sch $FILE

#set all RAW file paths in the template
sed -i "s/RAW_FILE_NAME.raw/$RAW_FILE/g" $FILE



