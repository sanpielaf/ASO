#!/bin/bash

echo "Seleccione una opción:
1. Sumar
2. Restar
3. Multiplicar
4. Dividir"

read -p "Opción: " opcion

read -p "Introduce el primer número: " num1
read -p "Introduce el segundo número: " num2

case $opcion in
    1) resultado=$(echo "$num1 + $num2" | bc)
       echo "Resultado de la suma: $resultado"
       ;;
    2) resultado=$(echo "$num1 - $num2" | bc)
       echo "Resultado de la resta: $resultado"
       ;;
    3) resultado=$(echo "$num1 * $num2" | bc)
       echo "Resultado de la multiplicación: $resultado"
       ;;
    4) if [ $num2 -eq 0 ]; then
           echo "Error: División por cero."
       else
           resultado=$(echo "$num1 / $num2" | bc)
           echo "Resultado de la división: $resultado"
       fi
       ;;
    *) echo "Opción inválida."
       ;;
esac

