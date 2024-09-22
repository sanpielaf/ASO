#!/bin/bash

imprimir_resultado() {
    echo "La suma de los números del 1 al 1000 usando $1 es: $2"
}

suma_for=0
for ((i=1; i<=1000; i++))
do
    suma_for=$((suma_for + i))
done
imprimir_resultado "for" $suma_for

suma_while=0
i=1
while [ $i -le 1000 ]
do
    suma_while=$((suma_while + i))
    i=$((i + 1))
done
imprimir_resultado "while" $suma_while

suma_until=0
i=1
until [ $i -gt 1000 ]
do
    suma_until=$((suma_until + i))
    i=$((i + 1))
done
imprimir_resultado "until" $suma_until
