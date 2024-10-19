#!/bin/bash

lista="/home/admin01/Escritorio/lista.txt"
touch "$lista"
echo "escribe una palabra: "
read palabra 
echo "$palabra" >> "$lista"
echo "se añadió la palabra $palabra"
cat "$lista"

