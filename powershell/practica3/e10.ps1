$puntos = [Double](Read-host "ingresa tu puntuación")

[int]$base = 2400
[int]$recibe = $puntos*$base

switch ($puntos) {
        {$_ -eq 0.0} {Write-Host "el nivel es inaceptable, usted recibe $recibe"}
        {$_ -eq 0.4} {Write-host "el nivel es Aceptable, usted recibe $recibe"}
        {$_ -ge 0.6} {Write-Host "el nivel es meritorio, usted recibe $recibe"}
        default {Write-Host "el puntaje no es valido"}
}