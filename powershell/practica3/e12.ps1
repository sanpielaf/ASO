[int]$tipoDpizza = Read-Host "¿Qué tipo de pizza quieres?
1. Vegetariana
2. No vegetariana"

$pizza = "tomate, mozzarella"
$ingredienteElegido = ""

switch ($tipoDpizza) {
    1 {
        Write-Host "Elegiste la pizza Vegetariana. Ahora elige un ingrediente:"
        Write-Host "1. Tofu"
        Write-Host "2. Pimiento"
        [int]$opcionVegetariana = Read-Host "Elige el número del ingrediente"
        
        switch ($opcionVegetariana) {
            1 { $ingredienteElegido = "tofu" }
            2 { $ingredienteElegido = "pimiento" }
            default { Write-Host "Opción no válida. Se usará tofu por defecto."; $ingredienteElegido = "tofu" }
        }
        Write-Host "Tu pizza es vegetariana y tiene los siguientes ingredientes: $pizza, $ingredienteElegido"
    }
    2 {
        Write-Host "Elegiste la pizza No Vegetariana. Ahora elige un ingrediente:"
        Write-Host "1. Pepperoni"
        Write-Host "2. Jamón"
        Write-Host "3. Salmón"
        [int]$opcionNoVegetariana = Read-Host "Elige el número del ingrediente"
        
        switch ($opcionNoVegetariana) {
            1 { $ingredienteElegido = "pepperoni" }
            2 { $ingredienteElegido = "jamón" }
            3 { $ingredienteElegido = "salmón" }
            default { Write-Host "Opción no válida. Se usará pepperoni por defecto."; $ingredienteElegido = "pepperoni" }
        }
        Write-Host "Tu pizza no es vegetariana y tiene los siguientes ingredientes: $pizza, $ingredienteElegido"
    }
    default { Write-Host "Opción no válida. Por favor, elige 1 o 2." }
}