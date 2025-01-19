$numero = [int] Read-Host "Escribe un número entero positivo"

for ($i = 1, $i -le $numero, $i = $i + 2) {
    write-host "los numeros impares son: $numero"
}