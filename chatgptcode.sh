#!/bin/bash

SOURCEDIR="$1"
DESTINATIONDIR="$2"

if [ ! -d "$SOURCEDIR" ]; then
    echo "Source directory '$SOURCEDIR' does not exist"
    exit 1
fi

if [ ! -d "$DESTINATIONDIR" ]; then
    echo "Destination directory '$DESTINATIONDIR' does not exist"
    exit 1
fi

FILES=$(find "$SOURCEDIR" -name '*.log' -mtime +14 -print0)
echo "Files that are more than 14 days old:"
echo "$FILES" | tr '\0' '\n'

while IFS= read -r -d '' line; do
    echo "Archiving file: $line"
    tar -C "$SOURCEDIR" -cvf "$line.tar" "$line"
    if [ $? -eq 0 ]; then
        mv "$SOURCEDIR/$line.tar" "$DESTINATIONDIR"
        echo "File archived and moved successfully."
    else
        echo "Error: Failed to archive $line"
    fi
done <<< "$FILES"
