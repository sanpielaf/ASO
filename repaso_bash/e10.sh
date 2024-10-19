#!/bin/bash

echo "ingresa un numero"
read num 
 
ultimo_digito=${num: -1}

if [[ ultimo_digito -eq 0 || ultimo_digito -eq 2 || ultimo_digito -eq 4 || ultimo_digito -eq 6 || ultimo_digito -eq 8 ]]; then
 echo "el numero es par"

else 
 echo "el numero es impar"

fi
