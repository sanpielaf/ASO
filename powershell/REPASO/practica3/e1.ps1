#Ejercicio 1. Crea un script que solicite un número al usuario. 
#El programa debe indicar si el número es impar o par.

[int]$num = read-host "ingresa un numero"

if ($num % 2 -eq 0) {
                    Write-Host "el numero es par"
                    }
 else {
 
  write-host "el numero no es par" }