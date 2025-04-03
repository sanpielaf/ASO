  # Verificar si el recurso compartido existe
if (Get-SmbShare -Name "IESELCAMINAS" -ErrorAction SilentlyContinue) {
    # Eliminarlo
    Remove-SmbShare -Name "IESELCAMINAS" -Force
    Write-Host "Recurso IESELCAMINAS_USERS$ eliminado."
}

  # Verificar si el recurso compartido existe
if (Get-SmbShare -Name "IESELCAMINAS_USERS$" -ErrorAction SilentlyContinue) {
    # Eliminarlo
    Remove-SmbShare -Name "IESELCAMINAS_USERS$" -Force
    Write-Host "Recurso IESELCAMINAS_USERS$ eliminado."
}