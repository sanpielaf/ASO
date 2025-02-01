#Ejercicio 1. Crea un script en lenguaje PowerShell que muestre al usuario 
#los siguientes mensajes:

#Hola nombre de usuario
#Tu directorio de trabajo es directorio
#Perteneces al dominio Nombre_dominio
#Tu equipo se llama Nombre_equipo

$directorioDtrabajo = get-location
$nombreDominio = (Get-WmiObject Win32_ComputerSystem).Domain
write-host "hola $env:USERNAME"
write-host "tu directorio de trabajo es $directorioDtrabajo"
write-host "perteneces al dominio $nombreDominio"
write-host "tu equipo se llama $env:COMPUTERNAME"