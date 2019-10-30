#!/bin/bash

# USAGE: ./smore_check.sh KEY_ORIGINAL KEY_SWAP (e.g. 10 11 , which is "1 2") 

KEY_ORIGINAL=$1
KEY_SWAP=$2

while read keystroke
do
    if [[ "$keystroke" == *"press"* ]] &&  \
    ( [[ "$keystroke" == *[[:space:]]"$KEY_ORIGINAL" ]] || \
    [[ "$keystroke" == *[[:space:]]"$KEY_SWAP" ]] ) 
    then
        exit
    fi
done
