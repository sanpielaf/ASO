$scriptContent = @"
powershell New-SmbMapping -LocalPath 'Y:' -RemotePath '\\Empresa-dc1\Empresa'
"@
$scriptPath = "C:\Windows\SYSVOL\sysvol\EMPRESA.LOCAL\scripts\carpetas.bat"
Set-Content -Path $scriptPath -Value $scriptContent