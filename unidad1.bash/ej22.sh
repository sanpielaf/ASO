#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Error: Debes proporcionar exactamente un parámetro."
    echo "Uso: $0 <ruta_completa_del_directorio>"
    exit 1
fi

if [ ! -d "$1" ]; then
    echo "Error: '$1' no es un directorio válido."
    exit 1
fi

contador=0

for entrada in "$1"/*; do
   
    if [ -f "$entrada" ]; then
        echo "Archivo: $(basename "$entrada")"
        ((contador++))

    elif [ -d "$entrada" ]; then
        echo "Directorio: $(basename "$entrada")"
        ((contador++))
    fi
done

echo "Total de entradas procesadas: $contador"
