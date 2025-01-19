$usuarios = Import-Csv -Path .\usuarios.csv

foreach ($usuario in $usuarios) {
    Write-Host "Nombre: $($usuario.Nombre)"
    Write-Host "Apellidos: $($usuario.Apellidos)"
    Write-Host "Grupo: $($usuario.Grupo)"
    Write-Host ""
}