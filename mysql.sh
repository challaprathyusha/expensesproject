#!/bin/bash

source ./common.sh

checkuser

echo "please enter password of root user:"
read MYSQLPASSWD

dnf install mysql-server -y &>>$LOGFILE
validate $? "Installation of mysql-server is"

systemctl enable mysqld &>>$LOGFILE
validate $? "enabling of mysql-server is"

systemctl start mysqld &>>$LOGFILE
validate $? "starting of mysql-server is"

mysql -h db.expensesnote.site -uroot -p$MYSQLPASSWD -e "show databases;" &>>$LOGFILE
if [ $? -ne 0 ]
then
    mysql_secure_installation --set-root-pass $MYSQLPASSWD &>>$LOGFILE
    validate $? "mysql secure installation is"
else
    echo "mysql root password is already set so....$Y SKIPPING $N"
fi