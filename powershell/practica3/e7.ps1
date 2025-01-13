$pass = Read-Host "escribe una contraseña"
$pass2 = Read-Host "cual es tu contraseña?"

if ($pass -eq $pass2 -or $pass.ToLower() -eq $pass2.ToLower()) {
    write-host "la contraseña es correcta"}
    else { Write-Host "la contraseña no es correcta"}