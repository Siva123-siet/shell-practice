#!/bin/bash

#for i in {1..100}
#do
 #  echo $i
#done

PACKAGES=("mysql","python","nginx")
for package in ${PACKAGES[@]}
do 
   echo $package
done