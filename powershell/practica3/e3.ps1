$num1 = Read-Host "Escribe el primer número entero"
$num2 = Read-Host "Escribe el segundo número entero"
If ($num1 -eq $num2) {
    Write-Host "ambos números son iguales"
    }
ElseIf ($num1 -gt $num2) {
    write-host "el primer número es mayor que el segundo"}
else {
    Write-Host "el primer número es menor que el segundo"}  