SOURCEFILE="$1"

if [ $# -ne 0 ]
then
    echo "textfile passed as an argument from commandline"
else
    echo  "Please mention the path of a textfile from commandline"
    exit 1
fi

if [ -f $SOURCEFILE ]
then
    echo "file exists with name textfile in path:$SOURCEFILE"
else
    echo "file does not exist in the provide path:$SOURCEFILE"
    exit 1
fi

checkcommand(){
if [ $? -eq 0 ]
then
    echo "the command executed successfully"
else    
    cho "once check the command and execute"
    exit 1
fi
}

CONTENT=$(cat $SOURCEFILE)
UNIQWORDS=$(echo $CONTENT|tr [A-Z]  [a-z]|tr " " "\n"|sort -u)
echo "unique words in a file:$UNIQWORDS"

for word in $UNIQWORDS
do
    OCCURENCES=$(echo $CONTENT|grep -o "$word"|wc -l)
    echo "word:$word,occurence of a word:$OCCURENCES"
done