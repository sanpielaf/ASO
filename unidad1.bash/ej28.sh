#!/bin/bash

get_network_info() {
    IP=$(ip -o -4 addr list | grep -v "127.0.0.1" | awk '{print $4}' | cut -d/ -f1 | head -n1)
    CIDR=$(ip -o -4 addr list | grep -v "127.0.0.1" | awk '{print $4}' | cut -d/ -f2 | head -n1)
    NETWORK=$(ipcalc -n $IP/$CIDR | grep Network | awk '{print $2}')
    BROADCAST=$(ipcalc -b $IP/$CIDR | grep Broadcast | awk '{print $2}')
    NETMASK=$(ipcalc -m $IP/$CIDR | grep Netmask | awk '{print $2}')
}

check_ip() {
    ping -c 1 -W 1 $1 > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo "$1 - Ocupada"
    else
        echo "$1 - Libre"
    fi
}

generate_report() {
    get_network_info
    echo "Informe de IP libres en la red"
    echo "==============================="
    echo "Tipo de red (CIDR): /$CIDR"
    echo "Nombre de la red: $NETWORK"
    echo "Broadcast: $BROADCAST"
    echo "Máscara de subred: $NETMASK"
    echo "==============================="
    echo "Listado de IPs:"

    IFS='.' read -r -a ip_parts <<< "$NETWORK"
    start_ip="${ip_parts[0]}.${ip_parts[1]}.${ip_parts[2]}.1"
    end_ip="${ip_parts[0]}.${ip_parts[1]}.${ip_parts[2]}.254"

    current_ip=$start_ip
    while [ "$current_ip" != "$end_ip" ]; do
        check_ip $current_ip
        current_ip=$(echo $current_ip | awk -F. '{$NF++;print}' OFS=.)
    done
    check_ip $end_ip
}

generate_report
