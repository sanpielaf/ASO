New-Item -Path "C:\Empresa_users" -ItemType Directory -Force

New-SmbShare -Name "Empresa_users$" -Path "C:\Empresa_users" -FullAccess "Administradores"

$usuarios = Get-ADUser -Filter *

foreach ($usuario in $usuarios) {
    $cuenta = $usuario.SamAccountName
    
    $carpetaUsuario = "C:\Empresa_users\$cuenta"
    New-Item -Path $carpetaUsuario -ItemType Directory -Force
    
    $acl = Get-Acl $carpetaUsuario
    $acl.SetAccessRuleProtection($true, $false)
    $regla = New-Object System.Security.AccessControl.FileSystemAccessRule($cuenta, "FullControl", "ContainerInherit,ObjectInherit", "None", "Allow")
    $acl.AddAccessRule($regla)
    Set-Acl $carpetaUsuario $acl
    
    Set-ADUser -Identity $cuenta -ScriptPath "carpetas.bat" -HomeDrive "Z:" -HomeDirectory "\\Empresa-dc1\Empresa_users$\$cuenta"
}
