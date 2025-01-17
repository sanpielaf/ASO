$empleados = Import-Csv -Path "C:\Users\Administrador\Downloads\archivos\empleados.csv" -Delimiter ";"
$departamentos = Import-Csv -Path "C:\Users\Administrador\Downloads\archivos\departamentos.csv" -Delimiter ";"


New-ADOrganizationalUnit -Name "Empresa" -Path "DC=santi,DC=local"

foreach ($departamento in $departamentos) {
    New-ADOrganizationalUnit -Name $departamento.departamento -Path "OU=Empresa,DC=santi,DC=local"
}

foreach ($departamento in $departamentos) {
    $nombredept = $departamento.departamento
    $OUdept = "OU=$nombredept,OU=Empresa,DC=santi,DC=local"
    
$nombregrupo = "Grupo_$nombredept"
New-ADGroup -Name $nombregrupo -GroupScope Global -Path $OUdept -Description "Grupo global para $nombredept"
}

foreach ($empleado in $empleados) {
    $nombre = $empleado.nombre
    $apellido = $empleado.apellido
    $departamento = $empleado.departamento
    $login = "$($nombre.ToLower()).$($apellido.ToLower())"
    $OUdept = "OU=$departamento,OU=Empresa,DC=santi,DC=local"
    $nombregrupo = "Grupo_$departamento"
    
    New-ADUser -Name "$nombre $apellido" `
               -SamAccountName $login ` `
               -AccountPassword (ConvertTo-SecureString "aso2021." -AsPlainText -Force) `
               -Enabled $true `
               -ChangePasswordAtLogon $true

    Add-ADGroupMember -Identity $nombregrupo -Members $login
}