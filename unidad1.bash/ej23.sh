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

    nombre=$(basename "$entrada")
    
    if [ -L "$entrada" ]; then
        echo "Enlace simbólico: $nombre"
    elif [ -b "$entrada" ]; then
        echo "Archivo especial de bloque: $nombre"
    elif [ -c "$entrada" ]; then
        echo "Archivo especial de carácter: $nombre"
    elif [ -d "$entrada" ]; then
        echo "Directorio: $nombre"
    elif [ -f "$entrada" ]; then
        echo "Archivo regular: $nombre"
    else
        echo "Otro tipo de archivo: $nombre"
    fi
    ((contador++))
done

echo "Total de entradas procesadas: $contador"
