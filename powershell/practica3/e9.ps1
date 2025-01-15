$renta = [int](Read-Host "ingresa tu renta anual")
switch ($renta) {
        {($_ -gt 0) -and ($_ -lt 10000)} {Write-Host "Tipo impositivo de 5%"}
        {($_ -ge 10000) -and ($_ -lt 20000)} {write-host "tipo impositivo de 15%"}
        {($_ -ge 20000) -and ($_ -lt 35000)} {Write-Host "tipo impositivo de 20%"}
        {($_ -ge 35000) -and ($_ -lt 60000)} {Write-Host "tipo impositivo de 30%"}
        {$_ -ge 60000} {write-host "tipo impositivo de 45%"}

        default {Write-Host "la renta debe ser un numero positivo"}
}