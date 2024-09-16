#!/bin/bash

FICHERO="listado_etc.txt"

ls -l /etc > $FICHERO

cat $FICHERO

echo "El listado se ha guardado en $FICHERO y se ha mostrado por pantalla."
