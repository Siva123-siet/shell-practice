#!/bin/bash

Userid=$(id -u)

if [ $Userid -ne 0 ]
then
    echo "Error: Please run script with root access:"
    exit 1
else
    echo "You are running with root access"
fi

dnf install mysql
if [ $? -eq 0 ]
then
    echo " Installing mysql"
else
    echo "Not installing mysql"
    exit 1
fi 