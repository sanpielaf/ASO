#Ejercicio 6. Crea un script que diga si lo que se pasa por teclado es 
#un directorio. En ese caso sacará una lista con los archivos que contiene 
#y subdirectorios. Debes utilizar el parámetro Recurse.


$ruta = Read-Host "ingresa un directorio"
if (Test-Path $ruta -PathType Container) {
    Write-Host "el directorio si existe y su contenido es"
    Get-ChildItem -Path $ruta -Recurse
}
else {
    Write-Host "no existe ese directorio"
}
