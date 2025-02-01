#Ejercicio2. Crea un script en PowerShell que pida dos números al usuario 
#e imprima por pantalla su suma, la resta, la multiplicación, división y resto.

[int]$num1 = read-host "escribe el primer numero"
[int]$num2 = Read-Host "escribe el segundo numero"

$suma = $num1 + $num2
$resta = $num1 - $num2
$division = $num1/$num2
$multiplicacion = $num1*$num2

write-host "la suma es: $suma"
write-host "la resta es: $resta"
write-host "la division es: $division"
write-host "la multiplicacion es: $multiplicacion"