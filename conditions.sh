#!/bin/bash

Number=$a

#-gt --> greater than
#-lt --> less than
#-eq --> equal
#-ne --> not equal

if [ $Number -lt 10 ]
then
    echo "Given Number $Number is less than 10"
else
    echo "Given Number $Number is not less than 10"
fi