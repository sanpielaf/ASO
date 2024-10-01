#!/bin/bash

existe() {
    if [ -f "$1" ]; then
        echo "El fichero $1 existe."
        chmod u+x,go-x "$1"
        echo "Permisos cambiados: ejecutable para el propietario, no ejecutable para el resto."
        return 0
    else
        echo "El fichero $1 no existe."
        return 1
    fi
}

if [ $# -eq 0 ]; then
    echo "Error: Debe proporcionar el nombre de un fichero como parámetro."
    exit 1
fi

existe "$1"
