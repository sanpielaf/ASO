#!/bin/bash

# Verificar si se proporcionó un directorio como argumento
if [ $# -eq 0 ]; then
    echo "Por favor, proporciona un directorio como argumento."
    echo "Uso: $0 /ruta/al/directorio"
    exit 1
fi

# Obtener el directorio del argumento
directorio="$1"

# Verificar si el directorio existe
if [ ! -d "$directorio" ]; then
    echo "El directorio $directorio no existe."
    exit 1
fi

# Obtener la fecha actual en formato yyyy-mm-dd
fecha=$(date +"%Y-%m-%d")

# Obtener el nombre del directorio sin la ruta completa
nombre_directorio=$(basename "$directorio")

# Crear el nombre del archivo comprimido
archivo_comprimido="${fecha}-${nombre_directorio}.tar.gz"

# Crear el archivo tar comprimido con gzip
tar -czvf "$archivo_comprimido" "$directorio"

echo "Se ha creado el archivo comprimido: $archivo_comprimido"
