#Ejercicio 11. Realizar un shell script que copie el fichero indicado como primer parámetro posicional 
#de manera que la copia tenga el nombre indicado en el segundo parámetro posicional. 
#Hay que controlar: 
#a) Que se indiquen dos parámetros. 
#b) Que exista y sea archivo ordinario el primer parámetro. 
#c) Que no exista un identificador (fichero ordinario, directorio, etc..) con el mismo nombre que el indicado en el segundo parámetro. 
#Si se produce alguna de las situaciones anteriores se visualizará un mensaje de error indicativo.

#!/bin/bash

if [[ $# -ne 2 ]]; then 
echo "no hay dos parametros"

fi

fichero=$1
copia=$2

if [[ -f $fichero  && ! -e $copia ]]; then 

cp "$fichero" "$copia"

elif [[ ! -e $fichero ]]; then

echo "el fichero no existe"

elif [[ -e $copia ]]; then 

echo "el nombre del segundo parametro esta ocupado"

fi

