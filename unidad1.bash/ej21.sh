#!/bin/bash

numero_secreto=42

echo "Bienvenido al juego de adivinar el número!"
echo "Estoy pensando en un número entre 1 y 100."
echo "Intenta adivinarlo o introduce 0 para rendirte."

while true; do
    read -p "Introduce tu intento: " intento

    if ! [[ "$intento" =~ ^[0-9]+$ ]]; then
        echo "Por favor, introduce un número válido."
        continue
    fi

    if [ $intento -eq 0 ]; then
        echo "Te has rendido. El número secreto era $numero_secreto."
        exit 0
    fi

    if [ $intento -lt 1 ] || [ $intento -gt 100 ]; then
        echo "El número debe estar entre 1 y 100."
        continue
    fi

    if [ $intento -eq $numero_secreto ]; then
        echo "¡Enhorabuena! Has adivinado el número."
        exit 0
    elif [ $intento -lt $numero_secreto ]; then
        echo "El número secreto es mayor."
    else
        echo "El número secreto es menor."
    fi
done
