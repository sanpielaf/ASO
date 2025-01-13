$num1 = Read-Host "Introduce el primer número"
$num2 = Read-Host "Introduce el segundo número"

$num1 = [int]$num1
$num2 = [int]$num2

Write-Host "1. Sumar"
Write-Host "2. Restar"
Write-Host "3. Multiplicar"
Write-Host "4. Dividir"

[int]$opcion = Read-Host "¿Qué desea hacer? Elige una opción"

$suma = $num1 + $num2
$resta = $num1 - $num2
$multiplicacion = $num1 * $num2
$division = $num1 / $num2

switch ($opcion) {
        1 {Write-Host "Suma: $suma"}
        2 {Write-Host "Resta: $resta"}
        3  {Write-Host "Multiplicación: $multiplicacion"}
        4  {Write-Host "División: $division"}
}