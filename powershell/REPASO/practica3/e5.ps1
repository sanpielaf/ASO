#Ejercicio 5. Crea un script en el que pidas un fichero o carpeta por teclado 
#y te diga si existe o no.

$archivo = read-host "ingresa un fichero o carpeta"

if (Test-Path $archivo -PathType container) {
       write-host "existe y es un directorio"}

elseif (Test-Path $archivo -PathType file) {
          write-host "existe y es un fichero"  }
else {write-host "o no existe o no es ni un fichero ni un directorio"} 