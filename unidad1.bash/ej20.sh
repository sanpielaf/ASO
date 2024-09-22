#!/bin/bash

es_primo() {
    local num=$1
    
    if [ $num -eq 1 ]; then
        return 1
    fi
    
    if [ $num -eq 2 ]; then
        return 0
    fi
    
    if [ $((num % 2)) -eq 0 ]; then
        return 1
    fi
    
    local limite=$(echo "sqrt($num)" | bc)
    for ((i=3; i<=limite; i+=2))
    do
        if [ $((num % i)) -eq 0 ]; then
            return 1
        fi
    done
    
    return 0
}

if [ $# -eq 0 ]; then
    echo "Error: Por favor, proporciona un número como parámetro."
    echo "Uso: $0 <número>"
    exit 1
fi

if ! [[ $1 =~ ^[0-9]+$ ]]; then
    echo "Error: El parámetro debe ser un número entero positivo."
    exit 1
fi

numero=$1

if es_primo $numero; then
    echo "$numero es primo."
else
    echo "$numero no es primo."
fi
