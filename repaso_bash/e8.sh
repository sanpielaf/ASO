#!/bin/bash

echo "ingresa el primer numero: "
read numero1

echo "ingresa el segundo numero: "
read numero2

if [[ $numero1 -gt $numero2 ]]; then

	echo "el primer número es mayor"

 elif [[ $numero1 -lt $numero2 ]]; then

	echo "el segundo número es mayor"
 else 

      echo "ambos son iguales"
fi
