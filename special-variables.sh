#!/bin/bash

echo "All variables passed to the script: $@"
echo "Number of variables: $#"
echo "Script name: $0"
echo "Current Directory: $PWD"
echo "User running this script: $USER"
echo "Home directory of user: $Home"
echo "PID of the script: $$"
echo "PID of last command in background: $!"