#Ejercicio3. Crea un script en PowerShell que pregunte al usuario 
#por el número de horas trabajadas y el coste por hora. 
#Después debe mostrar por pantalla el salario que debemos pagarle.


[int]$horastrabajadas = read-host "ingresa las horas trabajadas"
[int]$costeporhora = read-host "cual es el coste por hora"

$pago = $horastrabajadas*$costeporhora

Write-Host "el trabajador recibe $pago"