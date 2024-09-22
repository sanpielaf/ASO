#!/bin/bash
usage() {
    echo "Uso: $0 <archivo_origen> <archivo_destino>"
    exit 1
}

# a) Comprobar que se han proporcionado exactamente dos parámetros
if [ $# -ne 2 ]; then
    echo "Error: Se deben proporcionar exactamente dos parámetros."
    usage
fi

origen="$1"
destino="$2"

# b) Comprobar que el archivo de origen existe y es un archivo ordinario
if [ ! -f "$origen" ]; then
    echo "Error: El archivo de origen '$origen' no existe o no es un archivo ordinario."
    exit 1
fi

# c) Comprobar que el archivo de destino no existe
if [ -e "$destino" ]; then
    echo "Error: Ya existe un archivo o directorio con el nombre '$destino'."
    exit 1
fi

# Si todas las comprobaciones son correctas, realizar la copia
cp "$origen" "$destino"

if [ $? -eq 0 ]; then
    echo "El archivo se ha copiado correctamente de '$origen' a '$destino'."
else
    echo "Error: No se pudo copiar el archivo."
    exit 1
fi
