#Ejercicio 10. En una determinada empresa, sus empleados son evaluados al final 
#de cada año. Los puntos que pueden obtener en la evaluación comienzan en 0.0 y 
#pueden ir aumentando, traduciéndose en mejores beneficios. Los puntos que pueden 
#conseguir los empleados pueden ser 0.0, 0.4, 0.6 o más, pero no valores 
#intermedios entre las cifras mencionadas. 
#A continuación se muestra una tabla con los niveles correspondientes a cada 
#puntuación. La cantidad de dinero conseguida en cada nivel es de 2.400€ 
#multiplicada por la puntuación del nivel.

Nivel	Puntuación
Inaceptable	0.0
Aceptable	0.4
Meritorio	0.6 o más
#Escribir un programa que lea la puntuación del usuario e indique su nivel 
#de rendimiento, así como la cantidad de dinero que recibirá el usuario

[double]$puntos = read-host "escribe los puntos obtenidos"

[double]$dinero = $puntos*2400

if ($puntos -eq 0.0){
    write-host "nivel inaceptable, recibes $dinero"}
elseif ($puntos -eq 0.4){
    write-host "nivel aceptable, recibes $dinero"}
elseif ($puntos -ge 0.6){
    write-host "nivel meritorio, recibes $dinero"}
else {write-host "los puntos deben ser 0.0, 0.4 o mayor o igual a 0.6"}