#!/bin/bash

read -p "Introduce el primer número: " num1
read -p "Introduce el segundo número: " num2

if [ "$num1" -gt "$num2" ]; then
    echo "El número $num1 es mayor que $num2."
elif [ "$num1" -lt "$num2" ]; then
    echo "El número $num2 es mayor que $num1."
else
    echo "Los números son iguales."
fi

