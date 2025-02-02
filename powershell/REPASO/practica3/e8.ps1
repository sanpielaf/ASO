#Ejercicio 8. Los alumnos de un curso se han dividido en dos grupos A y B 
#de acuerdo al sexo y el nombre. El grupo A esta formado por las mujeres 
#con un nombre anterior a la M y los hombres con un nombre posterior a la N 
#y el grupo B por el resto. Escribir un programa que pregunte al usuario su 
#nombre y sexo, y muestre por pantalla el grupo que le corresponde

[string]$sexo = Read-Host "Introduce tu género (M para mujer, H para hombre)"
[string]$nombre = Read-Host "Introduce tu nombre"

if (($sexo -ieq "M" -and $nombre[0] -lt 'M') -or ($sexo -ieq "H" -and $nombre[0] -gt 'N')) {
    Write-Host "Perteneces al grupo A"
} else {
    Write-Host "Perteneces al grupo B"
}
