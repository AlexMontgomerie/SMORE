#!/bin/bash

SMORE_PATH=~/SMORE

# 1 - Chose a random pair of keys
KEYS_ALL=( $(cat $SMORE_PATH/KEYS.txt) )
KEY_ORIGINAL=${KEYS_ALL[$(($RANDOM % ${#KEYS_ALL[@]}))]}
KEY_SWAP=${KEYS_ALL[$(($RANDOM % ${#KEYS_ALL[@]}))]}

# 2 - Change key mapping
echo "TODO: change key mapping"

# 3 - Wait for key stroke
xinput list | grep -Po 'id=\K\d+(?=.*slave\s*keyboard)' | xargs -P0 -n1 xinput test | \
    $SMORE_PATH/smore_check.sh $KEY_ORIGINAL $KEY_SWAP  

# 4 - Change key mapping
echo "TODO: reset key mapping"



