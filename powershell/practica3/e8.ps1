$nombre = Read-Host "ingrese su nombre"
$sexo = Read-Host "ingrese su sexo (M para masculino, F para femenino)"

$primeraLetra = $nombre.Substring(0, 1).ToUpper()

if ($sexo -eq "F") {
    if ($primeraLetra -lt "M") {
        $grupo = "A"
    } else {
        $grupo = "B"
    }
} elseif ($sexo -eq "M") {
    if ($primeraLetra -gt "N") {
        $grupo = "A"
    } else {
        $grupo = "B"
    }
}

Write-Host "Usted pertenece al Grupo $grupo"