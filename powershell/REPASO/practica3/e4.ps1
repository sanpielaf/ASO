#Ejercicio 4. Crea una calculadora muy sencilla, en la que se preguntará 
#al usuario dos números y que operación desea realizar.


[int]$num1 = read-host "ingresa un numero"
[int]$num2 = read-host "ingresa otro numero"

$suma = $num1+$num2
$resta = $num1-$num2
$multiplicar = $num1*$num2
$dividir= $num1 / $num2 

write-host "Sumar"
write-host "Restar"
write-host "Multiplicar"
write-host "Dividir"
$x = Read-Host "¿Qué desea hacer?Elige una opción:"


switch ($x) {

            sumar {write-host "la suma es $suma"}
            restar {write-host "la resta es $resta"}
            multiplicar {write-host "la multiplicacion es $multiplicar"}
            dividir {write-host "la division es $dividir"}
             

}