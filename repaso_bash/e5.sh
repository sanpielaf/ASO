#!/bin/bash

echo "escribe el primer número: "
read numero1

echo "escribe el segundo número: "
read numero2

suma=$((numero1 + numero2))
media_aritmetica=$((suma/2))
echo "La media aritmetica de ambos número es: $media_aritmetica"
