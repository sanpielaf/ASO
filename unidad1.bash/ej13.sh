#!/bin/bash

ARCHIVO="lista.txt"

anadir() {
    echo "Ingrese el nombre:"
    read nombre
    echo "Ingrese la dirección:"
    read direccion
    echo "Ingrese el teléfono:"
    read telefono
    echo "$nombre:$direccion:$telefono" >> $ARCHIVO
    echo "Registro añadido."
}

buscar() {
    echo "Ingrese el término de búsqueda:"
    read termino
    grep -i "$termino" $ARCHIVO
}

listar() {
    if [ -s $ARCHIVO ]; then
        cat $ARCHIVO
    else
        echo "El archivo está vacío."
    fi
}

ordenar() {
    sort $ARCHIVO -o $ARCHIVO
    echo "Archivo ordenado alfabéticamente."
}

borrar() {
    rm $ARCHIVO
    echo "Archivo borrado."
}

# Menú principal
while true; do
    echo "
    AGENDA
    1. Añadir
    2. Buscar
    3. Listar
    4. Ordenar
    5. Borrar
    6. Salir
    "
    read -p "Seleccione una opción: " opcion
    case $opcion in
        1) anadir ;;
        2) buscar ;;
        3) listar ;;
        4) ordenar ;;
        5) borrar ;;
        6) exit ;;
        *) echo "Opción no válida" ;;
    esac
done
