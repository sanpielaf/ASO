#!/bin/bash

FICHERO="listado_etc.txt"

ls -l /etc > $FICHERO

cat $FICHERO

LINEAS=$(wc -l < $FICHERO)
PALABRAS=$(wc -w < $FICHERO)

echo "El listado se ha guardado en $FICHERO y se ha mostrado por pantalla."
echo "El archivo tiene $LINEAS líneas y $PALABRAS palabras."
