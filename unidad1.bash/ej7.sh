#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Error: Por favor, proporciona un directorio como argumento."
    exit 1
fi

directorio="$1"

if [ ! -d "$directorio" ]; then
    echo "Error: El directorio '$directorio' no existe."
    exit 1
fi

fecha=$(date +%Y-%m-%d)

nombre_archivo="${fecha}_$(basename "$directorio").tar.gz"

tar -czf "$nombre_archivo" "$directorio"

if [ $? -eq 0 ]; then
    echo "Archivo creado exitosamente: $nombre_archivo"
else
    echo "Error al crear el archivo."
    exit 1
fi