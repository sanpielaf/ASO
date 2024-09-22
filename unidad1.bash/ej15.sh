#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Error: Por favor, proporciona un número como parámetro."
    echo "Uso: $0 <número>"
    exit 1
fi

n=$1

if ! [[ "$n" =~ ^[0-9]+$ ]]; then
    echo "Error: El parámetro debe ser un número entero positivo."
    exit 1
fi

echo "Tabla de multiplicar del $n:"
for i in {1..10}
do
    resultado=$((i * n))
    echo "$i x $n = $resultado"
done
