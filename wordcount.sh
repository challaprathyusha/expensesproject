SOURCEFILE="$1"

CONTENT=$(cat $SOURCEFILE)
echo $CONTENT|tr [A-Z]  [a-z]|tr " " "\n"