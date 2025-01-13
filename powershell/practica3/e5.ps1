$ruta = Read-Host "Ingresa la ruta de un fichero o carpeta por teclado"

if (Test-Path $ruta) { Write-Host "el fichero si existe"
} else {
    Write-Host "el fichero no existe"
    }