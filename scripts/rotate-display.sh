#!/bin/bash
# run with sudo
# reboot raspberry pi for changes to take effect

CONFIG='/boot/config.txt'

# save default configuration file
if [ ! -f $CONFIG.save ]; then
    cp $CONFIG $CONFIG.save
fi

# get the rotation of the file
ROTATION=$(tail -1 $CONFIG)

# override current config file to remove changes
cp $CONFIG.save $CONFIG

# rotate clause
if [ $ROTATION == 'display_rotate=0' ]; then
    echo 'display_rotate=1' >> $CONFIG
    echo 'display_rotate=1'
elif [ $ROTATION == 'display_rotate=1' ]; then
    echo 'display_rotate=2' >> $CONFIG
    echo 'display_rotate=2'
elif [ $ROTATION == 'display_rotate=2' ]; then
    echo 'display_rotate=3' >> $CONFIG
    echo 'display_rotate=3'
elif [ $ROTATION == 'display_rotate=3' ]; then
    echo 'display_rotate=0' >> $CONFIG
    echo 'display_rotate=0'
else
    echo 'display_rotate=1' >> $CONFIG
    echo 'display_rotate=1'
fi
