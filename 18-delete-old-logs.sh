#!/bin/bash

SOURCE_DIR=/home/ec2-user/app-logs
FILE_PATH=$(find $SOURCE_DIR -name "*.log" -mtime +14)

while IFS= read -r FILE_PATH
do
  echo "Deleting file: $FILE_PATH"
  rm -rf $FILE_PATH

done >>> FILE_PATH