$numero = [int](Read-Host "Escribe un número entero positivo")

$numeros = @()
$numerosOrdenados = $numeros | Sort-Object -Descending
for ($i = 0;$i -le $numero; $i = $i + 1) {
    
    $numeros += $i

}
$numerosOrdenados = $numeros | Sort-Object -Descending

Write-Host "La cuenta atrás es: $($numerosOrdenados -join ', ')"