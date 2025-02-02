#Ejercicio2. Escribir un programa que pregunte al usuario su edad y muestre 
#por pantalla si es mayor de edad o no.

[int]$edad = read-host "ingresa la edad"

if ($edad -ge 18) {
       write-host "es mayor de edad"}
else {
        write-host "no es mayor de edad"}