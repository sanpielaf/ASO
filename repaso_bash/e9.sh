#!/bin/bash

echo "ingresa el primer num: "
read num1

echo "ingresa el segundo num: "
read num2

suma=$(( num1 + num2 ))
resta=$(( num1 - num2 ))
multiplicacion=$(( num1 * num2 ))
division=$(( num1 / num2 ))

echo "suma"
echo "resta"
echo "multiplicacion"
echo "division"
echo "selecciona una opción: "
read opcion

if [[ opcion -eq suma ]]; then 

    echo "$suma"
elif [[ opcion -eq resta ]]; then 
    echo "$resta"

elif [[ opcion -eq multiplicacion ]]; then

   echo "$multiplicacion"

elif [[ opcion -eq division ]]; then

   echo "$division"

fi
