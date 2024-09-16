#!/bin/bash

echo "Por favor, ingrese el primer número:"
read numero1

echo "Por favor, ingrese el segundo número:"
read numero2

# para calcular la media aritmética, nos interesa que el resultado tenga
#dos decimales, por ello ponemos scale=2

media=$(echo "scale=2; ($numero1 + $numero2) / 2" | bc)

echo "La media aritmética de $numero1 y $numero2 es: $media"
