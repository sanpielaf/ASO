#!/bin/bash
while true; do
    # Mostrar menú
    echo "AGENDA"
    echo "1. Añadir registro"
    echo "2. Buscar"
    echo "3. Listar"
    echo "4. Ordenar"
    echo "5. Borrar archivo"
    echo "6. Salir"
    echo -n "Seleccione una opción: "
    read opcion

    # Procesar la opción seleccionada
    if [ "$opcion" = "1" ]; then
        # Añadir registro
        echo -n "Nombre: "
        read nombre
        echo -n "Dirección: "
        read direccion
        echo -n "Teléfono: "
        read telefono
        echo "$nombre:$direccion:$telefono" >> lista.txt
        echo "Registro añadido."

    elif [ "$opcion" = "2" ]; then
        # Buscar
        echo -n "Buscar por (nombre/direccion/telefono): "
        read criterio
        echo -n "Ingrese el término de búsqueda: "
        read termino
        grep -i "$termino" lista.txt | cut -d: -f1-3 | column -t -s:

    elif [ "$opcion" = "3" ]; then
        # Listar
        if [ -s lista.txt ]; then
            cat lista.txt | column -t -s:
        else
            echo "El archivo está vacío."
        fi

    elif [ "$opcion" = "4" ]; then
        # Ordenar
        sort lista.txt -o lista.txt
        echo "Registros ordenados alfabéticamente."

    elif [ "$opcion" = "5" ]; then
        # Borrar archivo
        rm -f lista.txt
        echo "Archivo borrado."

    elif [ "$opcion" = "6" ]; then
        # Salir
        echo "Saliendo..."
        exit 0

    else
        # Opción inválida
        echo "Opción inválida. Intente de nuevo."
    fi

    echo
done

