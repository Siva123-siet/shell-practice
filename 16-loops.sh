#!/bin/bash

Userid=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
LOGS_FOLDER="/var/log/shellscript-logs"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGS_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"
PACKAGES=("nginx","nodejs","mysql")
mkdir -p $LOGS_FOLDER
echo "Script started executing at: $(date)" | tee -a $LOGS_FILE
if [ $Userid -ne 0 ]
then
    echo -e "$R Error: Please run script with root access $N" | tee -a $LOGS_FILE
    exit 1
else
    echo "You are running with root access" | tee -a $LOGS_FILE
fi
VALIDATE()
{
if [ $1 -eq 0 ]
then
    echo -e "Installing $2 is ...$G Success $N" | tee -a $LOGS_FILE
else
    echo -e "Installing $2 is ...$R FAILURE $N" | tee -a $LOGS_FILE
    exit 1
fi 
}
for package in ${PACKAGES[@]}
do
   dnf list installed $package &>>$LOGS_FILE
   if [ $? -ne 0 ]
   then 
       echo -e "$package is not installed...$G going to install it $N" | tee -a $LOGS_FILE
       dnf install $package -y &>>$LOGS_FILE
       VALIDATE $? "$package"
   else
       echo -e "Nothing to do $package...$Y already installed $N" | tee -a $LOGS_FILE
   fi
done