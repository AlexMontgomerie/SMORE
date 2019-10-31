#!/bin/bash

SMORE_PATH=/etc/smore
# 0 - Reset key mapping
xmodmap $SMORE_PATH/.Xmodmap

# 1 - Chose a random pair of keys
KEYS_ALL=( {9..66} ) #KEYS_ALL=( $(cat $SMORE_PATH/KEYS.txt) )
KEYCODE_ORIGINAL=${KEYS_ALL[$(($RANDOM % ${#KEYS_ALL[@]}))]}
KEYCODE_SWAP=${KEYS_ALL[$(($RANDOM % ${#KEYS_ALL[@]}))]}

# 2 - Change key mapping
KEYVALUE_ORIGINAL=$(xmodmap -pke | grep "^keycode[[:space:]]\{1,\}$KEYCODE_ORIGINAL = ")
KEYVALUE_SWAP=$(xmodmap -pke | grep "^keycode[[:space:]]\{1,\}$KEYCODE_SWAP = ")

KEYVALUE_ORIGINAL=${KEYVALUE_ORIGINAL/$KEYCODE_ORIGINAL/$KEYCODE_SWAP}
KEYVALUE_SWAP=${KEYVALUE_SWAP/$KEYCODE_SWAP/$KEYCODE_ORIGINAL}

xmodmap -e "${KEYVALUE_ORIGINAL}"
xmodmap -e "${KEYVALUE_SWAP}"

# 3 - Wait for key stroke
xinput list | grep -Po 'id=\K\d+(?=.*slave\s*keyboard)' | xargs -P0 -n1 xinput test | \
    $SMORE_PATH/smore_check.sh $KEYCODE_ORIGINAL $KEYCODE_SWAP  

# 4 - Change key mapping
KEYVALUE_ORIGINAL=${KEYVALUE_ORIGINAL/$KEYCODE_SWAP/$KEYCODE_ORIGINAL}
KEYVALUE_SWAP=${KEYVALUE_SWAP/$KEYCODE_ORIGINAL/$KEYCODE_SWAP}

xmodmap -e "${KEYVALUE_ORIGINAL}"
xmodmap -e "${KEYVALUE_SWAP}"

