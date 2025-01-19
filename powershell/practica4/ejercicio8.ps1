#el numero que ingrea el usuario determina tanto la altura del triangulo como su base
# o dicho de otra manera, el numero que ingrea el usuario es el numero que determinará 
# la cantidad de numeros que formarán los dos catetos del triángulo rectángulo.
#La hipotenusa estará confurmada únicamente por el número "1" y dicho número
# se repetirá tantas veces como el número introducido por el usuario

$altura = [int](Read-Host "Introduce la altura del triángulo")

for ($fila = 1; $fila -le $altura; $fila++) {
    $linea = ""
    # Comenzar con el primer número impar en esta fila. 
    #numeroActual se refiere al primero numero con el que empieza cada fila.
    for ($numeroActual = ($fila * 2 - 1); $numeroActual -ge 1; $numeroActual -= 2) {
        $linea += $numeroActual
    }
    Write-Host $linea
}