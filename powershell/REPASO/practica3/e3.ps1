#Ejercicio 3. Crea un script en el que se pida dos números enteros al usuario. 
#El script debe indicar si el primer número es mayor, menor o igual que el otro.

[int]$num1 = read-host "escribe un numero entero"
[int]$num2 = read-host "escribe otro numero entero"

if ($num1 -eq $num2) {
    write-host "los numero son iguales"}

elseif ($num1 -gt $num2){
    write-host "el primer numero es mayor al segundo"} 

elseif ($num1 -lt $num2){
    write-host "el primer numero es menor al segundo"} 