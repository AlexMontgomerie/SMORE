#!/bin/bash

# USAGE: ./smore_check.sh KEYCODE_ORIGINAL KEYCODE_SWAP (e.g. 10 11 , which is "1 2") 

set -x

KEYCODE_ORIGINAL=$1
KEYCODE_SWAP=$2
KEYVALUE_ORIGINAL=$3
KEYVALUE_SWAP=$4

while read keystroke
do
    if [[ "$keystroke" == *"press"* ]] &&  \
    ( [[ "$keystroke" == *[[:space:]]"$KEYCODE_ORIGINAL" ]] || \
    [[ "$keystroke" == *[[:space:]]"$KEYCODE_SWAP" ]] ) 
    then
        KEYVALUE_ORIGINAL=${KEYVALUE_ORIGINAL/$KEYCODE_SWAP/$KEYCODE_ORIGINAL}
        KEYVALUE_SWAP=${KEYVALUE_SWAP/$KEYCODE_ORIGINAL/$KEYCODE_SWAP}
        xmodmap -e "${KEYVALUE_ORIGINAL}"
        xmodmap -e "${KEYVALUE_SWAP}"
        exit 
    fi
done
