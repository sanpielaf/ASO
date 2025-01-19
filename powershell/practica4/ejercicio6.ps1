[int]$numganador = 56
do {

$numuser = [int](Read-Host "ingresa el numero del 1 al 100 que creas que es el ganador")

    if ($numuser -gt $numganador) {
        write-host "el numero introducido es mayor al numero ganador"
    } elseif ($numuser -lt $numganador) {
       write-host "el numero introducido es menor al numero ganador" 
    } else {
       write-host "el numero introducido es el numero ganador"
    }
}
until ($numuser -eq $numganador)