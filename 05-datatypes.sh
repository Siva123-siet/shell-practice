#!/bin/bash

# this describes comment in shell scripting

Number1=100
Number2=200

Timestamp=$(date)
echo "Script executed at: $Timestamp"

Number=$(($Number1+$Number2))
echo "Output is: $Number"
