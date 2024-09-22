#!/bin/bash

generar_id() {
    local nombre=$1
    local apellido1=$2
    local apellido2=$3
    echo "alu${apellido1:0:2}${apellido2:0:2}${nombre:0:1}" | tr '[:upper:]' '[:lower:]'
}

alta_usuario() {
    local id=$(generar_id "$2" "$3" "$4")
    local grupo=${5:-$id}
    
    if ! getent group "$grupo" > /dev/null 2>&1; then
        sudo groupadd "$grupo"
    fi
    
    sudo useradd -m -g "$grupo" -c "$2 $3 $4" "$id"
    
    echo "Usuario $id creado y asignado al grupo $grupo"
}

baja_usuario() {
    local id=$(generar_id "$2" "$3" "$4")
    
    if id "$id" >/dev/null 2>&1; then
        sudo userdel -r "$id"
        echo "Usuario $id eliminado"
    else
        echo "El usuario $id no existe"
    fi
}

if [ $# -lt 4 ] || [ $# -gt 5 ]; then
    echo "Error. La sintaxis correcta es ./gestionusuarios.sh alta/baja nombre apellido1 apellido2 [grupo]"
    exit 1
fi

case $1 in
    alta)
        alta_usuario "$@"
        ;;
    baja)
        baja_usuario "$@"
        ;;
    *)
        echo "Error. La sintaxis correcta es ./gestionusuarios.sh alta/baja nombre apellido1 apellido2 [grupo]"
        exit 1
        ;;
esac
