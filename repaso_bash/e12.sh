#!/bin/bash

hora=$(date +%H)

if [[ $hora -ge 8 && $hora -lt 15 ]]; then 

echo "buenos dias"

elif [[ $hora -ge 15 && $hora -lt 20 ]]; then

echo "buenas tardes"

elif [[ $hora -ge 20 || $hora -lt 8 ]]; then
echo "buenas noches"

fi
