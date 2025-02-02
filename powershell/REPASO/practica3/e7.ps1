#Ejercicio 7. Escribir un programa que almacene la cadena de 
#caracteres contraseña en una variable, pregunte al usuario por la contraseña 
#e imprima por pantalla si la contraseña introducida por el usuario coincide 
#con la guardada en la variable sin tener en cuenta mayúsculas y minúsculas.

[string]$password = Read-Host "crea tu constraseña"
[string]$password2 = Read-Host "escribe tu constraseña"

if ($password -ieq $password2) {write-host "la contraseña es correcta"}
else {write-host "la contraseña no es correcta"}