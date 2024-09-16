#!/bin/bash

# Nombre del fichero donde guardaremos el listado
FICHERO="listado_etc.txt"

# Listar archivos y directorios de /etc y guardarlos en el fichero
ls -l /etc > $FICHERO

# Imprimir por pantalla el contenido del fichero
cat $FICHERO

echo "El listado se ha guardado en $FICHERO y se ha mostrado por pantalla."
