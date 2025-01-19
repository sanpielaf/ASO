$numero = [int](Read-Host "Escribe un número entero positivo")

#esto hace una lista vacia llamada impares
$impares = @()

for ($i = 1; $i -le $numero; $i = $i + 2) {
     if ($numero % 10 -notin @(0, 2, 4, 6, 8)){ #se pone un 10 para indicar que el ultimo numero...
        $impares = $impares + $i
    } else {
        $impares = $impares + $i
    }
}

Write-Host "Los números impares son: $($impares -join ', ')" 