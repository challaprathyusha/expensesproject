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
echo $FILES

while read -r line
do 
 echo "files to archive:$line"


done <<< $FILES
