#!/bin/bash

hora=$(date +%H)

hora_num=$((10#$hora))

if [ $hora_num -ge 8 ] && [ $hora_num -lt 15 ]; then
    echo "Buenos días"
elif [ $hora_num -ge 15 ] && [ $hora_num -lt 20 ]; then
    echo "Buenas tardes"
else
    echo "Buenas noches"
fi
