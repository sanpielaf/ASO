# Ruta de los ficheros CSV
$gruposFile = "C:\Scripts\grupos.csv"
$alumnosFile = "C:\Scripts\alumnos.csv"

# Nombre de la Unidad Organizativa raíz
$rootOU = "IESELCAMINAS"
$domainPath = "DC=RECUSANTI,DC=LOCAL"

# Crear la UO raíz
New-ADOrganizationalUnit -Name $rootOU -Path $domainPath -ErrorAction SilentlyContinue
Write-Host "Intento de creación de la UO raíz '$rootOU'."

# Leer datos de los archivos CSV
$grupos = Import-Csv -Path $gruposFile
$alumnos = Import-Csv -Path $alumnosFile

# Crear UO para cada grupo
ForEach ($grupo in $grupos) {
    $groupName = $grupo.nombre
    $ouPath = "OU=$rootOU,$domainPath"
    New-ADOrganizationalUnit -Name $groupName -Path $ouPath -ErrorAction SilentlyContinue
    Write-Host "Intento de creación de la UO '$groupName'."
}

# Crear grupos dentro de las UOs
ForEach ($grupo in $grupos) {
    $groupName = $grupo.nombre
    $description = $grupo.descripcion
    $groupPath = "OU=$groupName,OU=$rootOU,$domainPath"
    New-ADGroup -Name $groupName -GroupScope Global -GroupCategory Security -Path $groupPath -Description $description -ErrorAction SilentlyContinue
    Write-Host "Intento de creación del grupo '$groupName'."
}

# Crear usuario dentro de la UO correspondiente
ForEach ($alumno in $alumnos) {
    $groupName = $alumno.grupo
    $firstName = $alumno.nombre
    $lastName = $alumno.apellidos
    $samAccountName = "$firstName.$lastName".ToLower()
    $userPath = "OU=$groupName,OU=$rootOU,$domainPath"

    New-ADUser -SamAccountName $samAccountName `
               -UserPrincipalName "$samAccountName@RECUSANTI.LOCAL" `
               -Name "$firstName $lastName" `
               -GivenName $firstName `
               -Surname $lastName `
               -Path $userPath `
               -AccountPassword (ConvertTo-SecureString "P@ssw0rd123" -AsPlainText -Force) `
               -Enabled $true -ErrorAction SilentlyContinue
    Write-Host "Intento de creación del usuario '$samAccountName' en la UO '$groupName'."
}

# Añadir usuario al grupo correspondiente
ForEach ($alumno in $alumnos) {
    $groupName = $alumno.grupo
    $firstName = $alumno.nombre
    $lastName = $alumno.apellidos
    $samAccountName = "$firstName.$lastName".ToLower()
    $groupDN = "CN=$groupName,OU=$groupName,OU=$rootOU,$domainPath"

    Add-ADGroupMember -Identity $groupDN -Members $samAccountName -ErrorAction SilentlyContinue
    Write-Host "Intento de añadir el usuario '$samAccountName' al grupo '$groupName'."
}
