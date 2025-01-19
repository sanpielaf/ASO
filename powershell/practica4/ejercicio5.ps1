$num = [int](read-host "ingresa el numero cuya tabla se mostrará")

for ($i = 0 ; $i -le  10 ; $i = $i + 1) {
    $tabla = $num*$i
    Write-Host "la tabla del $num es $num x $i = $tabla"  
}