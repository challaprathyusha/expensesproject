#!/bin/bash
SOURCEDIR="$1"

if [ -d $SOURCEDIR ]
then
    echo "$SOURCEDIR exists"
else
    echo "Please make sure $SOURCEDIR exists"
    exit 1
fi

cd $SOURCEDIR
FILES=$( find . -name '*.log' -mtime +14)
echo "Files that are more than 14days old:$FILES"

while read -r line
do 
    echo "files to archive:$line"
    rm $SOURCEDIR/*.log.gz
    gzip $line

done <<< $FILES
