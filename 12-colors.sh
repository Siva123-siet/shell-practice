#!/bin/bash

Userid=$(id -u)

if [ $Userid -ne 0 ]
then
    echo "Error: Please run script with root access:"
    exit 1
else
    echo "You are running with root access"
fi
VALIDATE()
{
if [ $1 -eq 0 ]
then
    echo " Installing $2"
else
    echo "Not installing $2"
    exit 1
fi 
}
dnf list installed nginx
if [ $? -ne 0 ]
then   
    dnf install nginx
    VALIDATE $? "Nginx"
else
    echo "Nginx already installed...Nothing to do"
fi