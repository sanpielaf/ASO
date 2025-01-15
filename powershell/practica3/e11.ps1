$edad = [int](Read-Host "ingresa tu edad")

switch ($edad) {

    {($_ -ge 4) -and ($_ -lt 18)} {write-host "pagas 5 euros"}
    {$_ -ge 18} {Write-Host "pagas 10 euros"}

    default {Write-Host "entras gratis"}
}