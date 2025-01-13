$ruta = Read-Host "ingresa un directorio"
if (Test-Path $ruta -PathType Container) {
    write-host "el directorio si existe y su contenido es"
    Get-ChildItem -Path $ruta -Recurse}
  else {
    Write-Host "no existe ese directorio"}
