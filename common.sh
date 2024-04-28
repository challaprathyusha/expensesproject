#!/bin/bash
USERID="$(id -u)"
TIMESTAMP="$(date +%F-%H-%M-%S)"
SCRIPTNAME="$(echo $0|awk -F "." '{print$1F}')"
LOGFILE="/tmp/$SCRIPTNAME-$TIMESTAMP.log"
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

checkuser(){
if [ $USERID -ne 0 ]
then
    echo -e "$R Please run the script with super user privilages $N"
    exit 1
else
    echo -e "$G You are super user $N"
fi
}

validate(){
if [ $1 -ne 0 ]
then
    echo -e "$2.....$R FAILURE $N"
else 
    echo -e "$2......$G SUCCESS $N"
fi
}