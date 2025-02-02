#Ejercicio 9. Los tramos impositivos para la declaración de la renta 
#en un determinado país son los siguientes:

Renta	Tipo Impositivo
Menos de 10000€	5%
Entre 10000€ y 20000€	15%
Entre 20000€ y 35000€	20%
Entre 35000€ y 60000€	30%
Más de 60000€	45%

[int]$renta = read-host "ingresa tu renta"

if ($renta -lt 10000 -and $renta -gt 0) {
    write-host "tu tipo impositivo es del 5%"}
elseif ($renta -ge 10000 -and $renta -lt 20000) {
    write-host "tu tipo impositivo es del 15%"}
elseif ($renta -ge 20000 -and $renta -lt 35000) {
    write-host "tu tipo impositivo es del 20%"}
elseif ($renta -ge 35000 -and $renta -lt 60000) {
    write-host "tu tipo impositivo es del 30%"}
elseif ($renta -ge 60000) {
    write-host "tu tipo impositivo es del 45%"}
else {write-host "la renta no existe"}
