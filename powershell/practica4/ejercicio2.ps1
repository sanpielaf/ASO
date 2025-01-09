$edad = [int](Read-Host "introduce tu edad")

for ($i = 1; $i -le $edad; $i++) {
    Write-Host "cumpliste $i años"
}