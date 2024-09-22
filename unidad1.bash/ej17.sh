#!/bin/bash

suma=0

while true; do
    echo "Introduce un número (0 para terminar):"
    read numero
    
    if ! [[ "$numero" =~ ^-?[0-9]+$ ]]; then
        echo "Por favor, introduce un número válido."
        continue
    fi
    
    if [ "$numero" -eq 0 ]; then
        break
    fi
    
    # Sumar el número al total
    suma=$((suma + numero))
    
    echo "Suma actual: $suma"
done

echo "Suma final: $suma"
echo "Programa terminado."
