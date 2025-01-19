function Sumar($a, $b) {
    return $a + $b
}

function Restar($a, $b) {
    return $a - $b
}

function Multiplicar($a, $b) {
    return $a * $b
}

function Dividir($a, $b) {
    return $a / $b
}

function Calculadora {
    do {
        Clear-Host
        Write-Host "****** CALCULADORA ********"
        Write-Host "1. Sumar"
        Write-Host "2. Restar"
        Write-Host "3. Multiplicar"
        Write-Host "4. Dividir"
        Write-Host "5. Salir"
        Write-Host ""
        $opcion = Read-Host "¿Qué desea hacer? Elige una opción"

        if ($opcion -ne "5") {
            $num1 = [double](Read-Host "Introduce el primer número")
            $num2 = [double](Read-Host "Introduce el segundo número")

            switch ($opcion) {
                "1" { $resultado = Sumar $num1 $num2; Write-Host "Resultado: $resultado" }
                "2" { $resultado = Restar $num1 $num2; Write-Host "Resultado: $resultado" }
                "3" { $resultado = Multiplicar $num1 $num2; Write-Host "Resultado: $resultado" }
                "4" { $resultado = Dividir $num1 $num2; Write-Host "Resultado: $resultado" }
                default { Write-Host "Opción no válida" }
            }
            Read-Host "Presiona Enter para continuar"
        }
    } until ($opcion -eq "5") 
}

# la línea Calculadora es la que ejecuta la función principal. 
#Si la borras, el script definirá las funciones pero no las ejecutará automáticamente
Calculadora