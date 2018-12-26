#!/bin/bash

# lolfiltration.sh
# Wraper Script for the core_lolfiltration script

# Set Path
script_name=$0
script_full_path=$(dirname "$0")


for arg in "$@"
do
    if [ "$arg" == "--help" ] || [ "$arg" == "-h" ]
    then
        ## Help Routine
        echo "Help argument detected."
        echo "kringlefiltration.sh <file_name_to_encode>"
        echo "kringlefiltration.sh -d <file_name_to_decode>.lol"
        exit
    elif [ "$arg" == "-d" ]
    then
        ## Decode Lolfiltrated File
        echo "Converting KringleFiltration File into base64: $$.64"
        $script_full_path/core_kringle.py -d $2 $$.64
        echo "Converting $$.64 into original binary file: kringlefiltrated.file"
        base64 -d $$.64 > kringlefiltrated.file
        # Clean Up
        echo "Cleaning up $$.64"
        rm $$.64
        exit
    else
        ## Encode File for LolFiltration
        # Convert Target File
        echo "Converting file into base64: $$.64"
        base64 $1 | tr -d "\r \n" > $$.64
        echo "Converting base64 file into kringlefiltration file: $1.kringle"
        $script_full_path/core_kringle.py $$.64 $1.kringle
        # Clean Up
        echo "Cleaning up base64 file: $$.64"
        rm $$.64
    fi
done
