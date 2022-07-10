#!/bin/bash

# name: filename-scrub
# author: Joel Sleeba

cd ~/Study
IFSOLD=$IFS
IFS=$'\n'
list=$(find . -type f -name "*lib*")

# changes the following sections in the filenames
# "( - |)libgen.(li|lc|gen.rus|lol|me|is)"
# "( - \(| \(|)(z-lib|[1-9]lib).(in|org)(\)|)"
# to ""

for i in $list
do
    mv $i $(echo $i | sed -r "s/( - |)libgen.(li|lc|gen.rus|lol|me|is)|( - \(| \(|\(|)(z-lib|[1-9]lib).(in|org)(\)|)//g")
    echo $i changed
done
IFS=$IFSOLD
