[string]$pass = Read-Host "crea tu contraseña"

do {
    $pass2 = [string](read-host "ingresa la contraseña correcta")
    if ($pass -ceq $pass2) {write-host "contraseña correcta"}
    else {write-host "contraseña incorrecta"}
}

until ($pass -ceq $pass2)

write-host "lo lograse"