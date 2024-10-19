#!/bin/bash
fichero="/home/admin01/Escritorio/e3"
touch "$fichero"
ls /etc > "$fichero"
lineas=$(wc -l < "$fichero")
palabras=$(wc -w < "$fichero")
cat "$fichero" 
echo "tiene $lineas lineas y $palabras palabras"
