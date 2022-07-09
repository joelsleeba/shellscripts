#!/bin/bash
cd ~/Study/Mathematics
IFSOLD=$IFS
IFS=$'\n'
list=$(find . -type f -name "*libgen*")

for i in $list
do
    mv $i $(echo $i | sed -r "s/ - libgen.(li|lc|gen.rus|lol|me)| (z-lib|1lib).(in|org)//g")
    echo $i changed
done
IFS=$IFSOLD
