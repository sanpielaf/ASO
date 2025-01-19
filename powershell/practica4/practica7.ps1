$numbase = [int](Read-Host "Introduce un número para hacer el triángulo")

for ($i = 1; $i -le $numbase; $i = $i +1) {
    $linea = "*" * $i
    Write-Host $linea
}
