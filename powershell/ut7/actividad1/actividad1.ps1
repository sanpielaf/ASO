#1-Visualiza las carpetas compartidas, excluyendo los especiales de sistema.Get-SmbShare | Where-Object { $_.Special -eq $false }
#2-Crea una carpeta con el nombre ASO en el path C:\ASO utilizando el comando New-Item
New-Item -Path "C:\carpetaASO" -ItemType Directory
#3-Comparte la carpeta C:\ASO con el nombre aso utilizando el comando New-SmbShareNew-SmbShare -Name "aso" -Path "C:\carpetaASO" -FullAccess "Everyone"
