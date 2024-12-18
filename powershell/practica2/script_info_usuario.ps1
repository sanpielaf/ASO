$nombreUsuario = $env:USERNAME
$directorioTrabajo = Get-Location
$nombreDominio = (Get-WmiObject Win32_ComputerSystem).Domain
$nombreEquipo = $env:COMPUTERNAME

Write-Host "Hola $nombreUsuario"
Write-Host "Tu directorio de trabajo es $directorioTrabajo"
Write-Host "Perteneces al dominio $nombreDominio"
Write-Host "Tu equipo se llama $nombreEquipo"
