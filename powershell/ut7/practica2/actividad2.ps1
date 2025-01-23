New-Item -Path "C:\Empresa" -ItemType Directory
foreach ($departamento in $departamentos) {
    New-Item -Path "C:\Empresa\$($departamento.departamento)" -ItemType Directory
}

$acl = Get-Acl -Path "C:\Empresa"
$acl.SetAccessRuleProtection($true, $false)
$rule = New-Object System.Security.AccessControl.FileSystemAccessRule("Todos", "ReadAndExecute", "ContainerInherit,ObjectInherit", "None", "Allow")
$acl.AddAccessRule($rule)
Set-Acl -Path "C:\Empresa" -AclObject $acl

foreach ($departamento in $departamentos) {
    $deptPath = "C:\Empresa\$($departamento.departamento)"
    $acl = Get-Acl -Path $deptPath
    $acl.SetAccessRuleProtection($true, $false)
    
    $rule = New-Object System.Security.AccessControl.FileSystemAccessRule("Grupo_$($departamento.departamento)", "Modify", "ContainerInherit,ObjectInherit", "None", "Allow")
    $acl.AddAccessRule($rule)   

    $rule = New-Object System.Security.AccessControl.FileSystemAccessRule("Administradores", "FullControl", "ContainerInherit,ObjectInherit", "None", "Allow")
    $acl.AddAccessRule($rule)  

    foreach ($otroDept in $departamentos) {
        if ($otroDept.departamento -ne $departamento.departamento) {
            $rule = New-Object System.Security.AccessControl.FileSystemAccessRule("Grupo_$($otroDept.departamento)", "ReadAndExecute", "ContainerInherit,ObjectInherit", "None", "Allow")
            $acl.AddAccessRule($rule)
        }
    }
    
    Set-Acl -Path $deptPath -AclObject $acl
}

New-SmbShare -Name "Empresa" -Path "C:\Empresa" -FullAccess "Todos"
foreach ($departamento in $departamentos) {
    New-SmbShare -Name $departamento.departamento -Path "C:\Empresa\$($departamento.departamento)" -FullAccess "Administradores", "Grupo_$($departamento.departamento)" -ReadAccess "Todos"
}
