#!/bin/bash

Userid=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
LOGS_FOLDER="/var/log/shellscript-logs"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGS_FILE=$LOGS_FOLDER/$SCRIPT_NAME
mkdir -p $LOGS_FOLDER
echo "Script started executing at: $(date)" &>>$LOGS_FILE
if [ $Userid -ne 0 ]
then
    echo -e "$R Error: Please run script with root access $N" &>>$LOGS_FILE
    exit 1
else
    echo "You are running with root access" &>>$LOGS_FILE
fi
VALIDATE()
{
if [ $1 -eq 0 ]
then
    echo -e "Installing $2 is ...$G Success $N" &>>$LOGS_FILE
else
    echo -e "Installing $2 is ...$R FAILURE $N" &>>$LOGS_FILE
    exit 1
fi 
}
dnf list installed nginx &>>$LOGS_FILE
if [ $? -ne 0 ]
then 
    echo -e "Nginx is not installed...$G going to install it $N" &>>$LOGS_FILE
    dnf install nginx -y &>>$LOGS_FILE
    VALIDATE $? "Nginx"
else
    echo -e "Nothing to do Nginx...$Y already installed $N" &>>$LOGS_FILE
fi