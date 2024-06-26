#!/bin/bash
SOURCEDIR="$1"
DESTINATIONDIR="$2"
if [ -d $SOURCEDIR ]
then
    echo "$SOURCEDIR exists"
else
    echo "Please make sure $SOURCEDIR exists"
    exit 1
fi

if [ -d $DESTINATIONDIR ]
then
    echo "$DESTINATIONDIR exists"
else
    echo "Please make sure $DESTINATIONDIR exists"
    exit 1
fi


FILES=$(find $SOURCEDIR -name '*.log' -mtime +14)
echo "Files that are more than 14days old:$FILES"

while read -r line
do
    echo "files to archive:$line"
    tar cvf $line.tar $line
    if [ $? -ne 0 ]
    then 
        echo "archived files already exist so..skipping"
        exit
    else 
        mv "$SOURCEDIR/$line.tar" "$DESTINATIONDIR"
        echo "files archived and moved successfully"
    fi
done <<< $FILES

