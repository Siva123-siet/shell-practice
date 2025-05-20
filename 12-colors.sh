#!/bin/bash

Userid=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
if [ $Userid -ne 0 ]
then
    echo -e "$R Error: Please run script with root access $N"
    exit 1
else
    echo "You are running with root access"
fi
VALIDATE()
{
if [ $1 -eq 0 ]
then
    echo -e "Installing $2 is ...$G Success $N"
else
    echo -e "Installing $2 is ...$R FAILURE $N"
    exit 1
fi 
}
dnf list installed nginx
if [ $? -ne 0 ]
then 
    echo -e "Nginx is not installed...$G going to install it $N" 
    dnf install nginx -y
    VALIDATE $? "Nginx"
else
    echo -e "Nothing to do Nginx...$Y already installed $N"
fi