$numero = Read-Host "Introduce un número"

$numero = [int]$numero

if ($numero % 2 -eq 0) {
    Write-Host "El número $numero es par"
} else {
    Write-Host "El número $numero es impar"
}
