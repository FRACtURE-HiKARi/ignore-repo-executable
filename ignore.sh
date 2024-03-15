# a script used to update .gitignore
# for new executables appear in this repo
# coded by Yuanzhe Liu
# Mar 2024

#!/bin/bash

if [ -f executable.txt ]
then
    cp executable.txt.bak
fi
ls -lR | grep "\-..x..x..x" | grep -v "\." | while read line
do
    array=($line)
    echo ${array[8]}
done > executable.txt
if [ -f .gitignore ]
then
    diff executable.txt .gitignore | grep ">" | while read line
    do
        array=($line)
        sed -i "1i ${array[1]}" executable.txt
    done
fi
mv executable.txt .gitignore
if [ -f executable.txt.bak ]
then
    cp executable.txt
fi