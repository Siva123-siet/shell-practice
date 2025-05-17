#!/bin/bash

Userid=$(id -u)

if [ $Userid -ne 0 ]
then
    echo "Error: Please run script with root access:"
else
    echo "You are running with root access"
fi

dnf install mysql