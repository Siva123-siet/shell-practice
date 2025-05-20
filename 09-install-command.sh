#!/bin/bash

Userid=$(id -u)

if [ $Userid -ne 0 ]
then
    echo "Error: Please run script with root access:"
    exit 1
else
    echo "You are running with root access"
fi
dnf list installed nginx
if [ $? -ne 0 ]
then   
    dnf install nginx
    if [ $? -eq 0 ]
    then
        echo " Installing nginx"
    else
        echo "Not installing nginx"
        exit 1
    fi 
else
    echo "Nginx already installed...Nothing to do"
fi