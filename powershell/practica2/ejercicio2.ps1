$num1 = Read-Host "Introduce el primer número"
$num2 = Read-Host "Introduce el segundo número"

$num1 = [int]$num1
$num2 = [int]$num2

$suma = $num1 + $num2
$resta = $num1 - $num2
$multiplicacion = $num1 * $num2
$division = $num1 / $num2
$resto = $num1 % $num2

Write-Host "Suma: $suma"
Write-Host "Resta: $resta"
Write-Host "Multiplicación: $multiplicacion"
Write-Host "División: $division"
Write-Host "Resto: $resto"
