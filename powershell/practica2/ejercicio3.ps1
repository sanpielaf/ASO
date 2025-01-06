$horasTrabajadas = Read-Host "Introduce el número de horas trabajadas"
$costePorHora = Read-Host "Introduce el coste por hora"

$horasTrabajadas = [decimal]$horasTrabajadas
$costePorHora = [decimal]$costePorHora

$salario = $horasTrabajadas * $costePorHora

Write-Host "El salario a pagar es: $salario euros"
