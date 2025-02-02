#Ejercicio 11. Escribir un programa para una empresa que tiene salas de juegos 
#para todas las edades y quiere calcular de forma automática el precio que debe 
#cobrar a sus clientes por entrar. El programa debe preguntar al usuario la edad 
#del cliente y mostrar el precio de la entrada. Si el cliente es menor de 4 años 
#puede entrar gratis, si tiene entre 4 y 18 años debe pagar 5€ y si es mayor de 
#18 años, 10€.

[int]$edad = read-host "introduce tu edad"

if ($edad -ge 0 -and $edad -lt 4) {write-host "entra gratis"}
elseif ($edad -ge 4 -and $edad -lt 18) {write-host "pagas 5 euros"}
elseif ($edad -ge 18) {write-host "pagas 10 euros"}
else {write-host "el numero debe ser positivo"}