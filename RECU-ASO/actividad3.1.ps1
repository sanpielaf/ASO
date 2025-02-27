#CREAMOS LA ESTRUCTURA DE LA OU IESELCAMINAS
New-ADOrganizationalUnit -Name "IESELCAMINAS" -Path "DC=RECUSANTI,DC=LOCAL"
New-ADOrganizationalUnit -Name "1ASIR" -Path "OU=IESELCAMINAS,DC=RECUSANTI,DC=LOCAL"
New-ADOrganizationalUnit -Name "2ASIR" -Path "OU=IESELCAMINAS,DC=RECUSANTI,DC=LOCAL"

#CREAMOS LOS GRUPOS GLOBALES
New-ADGroup -GroupScope Global -Name "grupo1ASIR" -Path "OU=1ASIR,OU=IESELCAMINAS,DC=RECUSANTI,DC=LOCAL"
New-ADGroup -GroupScope Global -Name "grupo2ASIR" -Path "OU=2ASIR,OU=IESELCAMINAS,DC=RECUSANTI,DC=LOCAL"

$alumnos = Import-Csv -Path "C:\Users\Administrador\Desktop\alumnos.csv" #grupo,nombre,apellidos
$grupos = Import-Csv -Path "C:\Users\Administrador\Desktop\grupos.csv" #nombre,descripcion


foreach ($al in $alumnos) {

    New-ADUser -Name "$($al.nombre)" -Path "OU=$($grupo.nombre),OU=IESELCAMINAS,DC=RECUSANTI,DC=LOCAL" -SamAccountName "$($al.nombre).$($al.apellidos)" -AccountPassword (ConvertTo-SecureString "hola01?" -AsPlainText -Force) -GivenName "$($al.nombre)" -Surname "$($al.apellidos)" -ChangePasswordAtLogon $true -Enabled $true
    Add-ADGroupMember -Identity "alumnos" -Members $($al.nombre)
}

foreach ($grupo in $grupos) {

    New-ADGroup -GroupScope Global -Name $($grupo.nombre) -Description $($grupo.descripcion) -Path "OU=$($grupo.nombre),OU=IESELCAMINAS,DC=RECUSANTI,DC=LOCAL"
}