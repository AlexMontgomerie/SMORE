#!/bin/bash

# USAGE: ./smore_check.sh KEY_NUM (e.g. 42, which is "g") 

KEY_NUM=$1

while read keystroke
do
    if [[ "$keystroke" == *"press"* ]] && [[ "$keystroke" == *[[:space:]]"$KEY_NUM" ]]
    then
        exit
    fi
done
