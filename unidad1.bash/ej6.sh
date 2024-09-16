#!/bin/bash

ARCHIVO="lista.txt"

echo "Por favor, ingrese una palabra:"
read palabra

# Añadir la palabra al archivo
echo "$palabra" >> "$ARCHIVO"

# Confirmar que la palabra se ha añadido
echo "La palabra '$palabra' ha sido añadida al archivo $ARCHIVO."

# Mostrar el contenido actual del archivo
echo "Contenido actual de $ARCHIVO:"
cat "$ARCHIVO"
