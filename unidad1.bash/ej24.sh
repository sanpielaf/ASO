#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Error: Debes proporcionar exactamente un parámetro."
    echo "Uso: $0 <ruta_del_directorio>"
    exit 1
fi

if [ ! -d "$1" ]; then
    echo "Error: '$1' no es un directorio válido o no existe."
    exit 1
fi

num_ficheros=0
num_subdirectorios=0

for entrada in "$1"/*; do
    if [ -f "$entrada" ]; then
        ((num_ficheros++))
    elif [ -d "$entrada" ]; then
        ((num_subdirectorios++))
    fi
done

echo "Estadísticas del directorio '$1':"
echo "Número de ficheros: $num_ficheros"
echo "Número de subdirectorios: $num_subdirectorios"
