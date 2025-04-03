# Configuración de carpetas y permisos

# Variables globales
$nombreServidor = "WINDOWS-SERVER"  # Reemplazar por el nombre real del servidor (ej: WINDOWS-SERVER-SANTI)
$alumnos = Import-Csv -Path "C:\Users\Administrador\Desktop\alumnos.csv"
$grupos = Import-Csv -Path "C:\Users\Administrador\Desktop\grupos.csv"

###-----CARPETA IESELCAMINAS---------------------------------------------------------------

# Eliminar recurso compartido si ya existe
if (Get-SmbShare -Name "IESELCAMINAS" -ErrorAction SilentlyContinue) {
    Remove-SmbShare -Name "IESELCAMINAS" -Force
}

# Crear carpeta raíz IESELCAMINAS
New-Item -Path C:\IESELCAMINAS -ItemType Directory -Force

# Crear subcarpetas para cada grupo
foreach ($grupo in $grupos) {
    New-Item -Path "C:\IESELCAMINAS\$($grupo.nombre)" -ItemType Directory -Force
}

# Compartir carpeta raíz
New-SmbShare -Name "IESELCAMINAS" -Path C:\IESELCAMINAS -FullAccess "Administradores" -ChangeAccess "Usuarios del dominio"

# Configurar permisos NTFS para IESELCAMINAS
$acl = Get-Acl -Path C:\IESELCAMINAS
$acl.SetAccessRuleProtection($true, $false)

# Permisos para Administradores (FullControl)
$aceAdmin = New-Object System.Security.AccessControl.FileSystemAccessRule(
    "Administradores", 
    "FullControl", 
    "ContainerInherit,ObjectInherit", 
    "None", 
    "Allow"
)
$acl.AddAccessRule($aceAdmin)

# Permisos para Usuarios del Dominio (Read)
$aceDomainUsers = New-Object System.Security.AccessControl.FileSystemAccessRule(
    "Usuarios del dominio", 
    "Read", 
    "ContainerInherit,ObjectInherit", 
    "None", 
    "Allow"
)
$acl.AddAccessRule($aceDomainUsers)

$acl | Set-Acl -Path C:\IESELCAMINAS

#----------SUBCARPETAS DE IESELCAMINAS-------------------------------------------------------------------

foreach ($grupo in $grupos) {
    $carpetaGrupo = "C:\IESELCAMINAS\$($grupo.nombre)"
    $acl = Get-Acl -Path $carpetaGrupo

    # Deshabilitar herencia
    $acl.SetAccessRuleProtection($true, $false)

    # Permisos para Administradores
    $aceAdminGrupo = New-Object System.Security.AccessControl.FileSystemAccessRule(
        "Administradores", 
        "FullControl", 
        "ContainerInherit,ObjectInherit", 
        "None", 
        "Allow"
    )
    $acl.AddAccessRule($aceAdminGrupo)

    # Permisos para el grupo de alumnos
    $aceGrupo = New-Object System.Security.AccessControl.FileSystemAccessRule(
        "$($grupo.nombre)", 
        "FullControl", 
        "ContainerInherit,ObjectInherit", 
        "None", 
        "Allow"
    )
    $acl.AddAccessRule($aceGrupo)

    $acl | Set-Acl -Path $carpetaGrupo
}

###------------------CARPETA IESELCAMINAS_USERS------------------------------------------------------

# Eliminar recurso compartido si ya existe
if (Get-SmbShare -Name "IESELCAMINAS_USERS$" -ErrorAction SilentlyContinue) {
    Remove-SmbShare -Name "IESELCAMINAS_USERS$" -Force
}

# Crear carpeta raíz IESELCAMINAS_USERS
New-Item -Path C:\IESELCAMINAS_USERS -ItemType Directory -Force

# Crear subcarpetas para cada alumno
foreach ($alumno in $alumnos) {
    New-Item -Path "C:\IESELCAMINAS_USERS\$($alumno.nombre).$($alumno.apellidos)" -ItemType Directory -Force
}

# Compartir carpeta raíz (oculta)
New-SmbShare -Name "IESELCAMINAS_USERS$" -Path C:\IESELCAMINAS_USERS -FullAccess "Administradores" -ChangeAccess "Usuarios del dominio"

# Configurar permisos NTFS para IESELCAMINAS_USERS
$acl = Get-Acl -Path C:\IESELCAMINAS_USERS
$acl.SetAccessRuleProtection($true, $false)

# Permisos para Administradores
$aceAdminUsers = New-Object System.Security.AccessControl.FileSystemAccessRule(
    "Administradores", 
    "FullControl", 
    "ContainerInherit,ObjectInherit", 
    "None", 
    "Allow"
)
$acl.AddAccessRule($aceAdminUsers)

$acl | Set-Acl -Path C:\IESELCAMINAS_USERS

###---------------SUBCARPETAS DE IESELCAMINAS_USERS--------------------------------------------------------------------

foreach ($alumno in $alumnos) {
    $carpetaAlumno = "C:\IESELCAMINAS_USERS\$($alumno.nombre).$($alumno.apellidos)"
    $acl = Get-Acl -Path $carpetaAlumno

    # Deshabilitar herencia
    $acl.SetAccessRuleProtection($true, $false)

    # Permisos para Administradores
    $aceAdminAlumno = New-Object System.Security.AccessControl.FileSystemAccessRule(
        "Administradores", 
        "FullControl", 
        "ContainerInherit,ObjectInherit", 
        "None", 
        "Allow"
    )
    $acl.AddAccessRule($aceAdminAlumno)

    # Permisos para el alumno
    $aceAlumno = New-Object System.Security.AccessControl.FileSystemAccessRule(
        "$($alumno.nombre).$($alumno.apellidos)", 
        "FullControl", 
        "ContainerInherit,ObjectInherit", 
        "None", 
        "Allow"
    )
    $acl.AddAccessRule($aceAlumno)

    $acl | Set-Acl -Path $carpetaAlumno
}

#----------------------ACTIVIDAD 6 ------------------------ Configuración de usuarios en Active Directory

# Variables globales
$nombreServidor = "WINDOWS-SERVER"  # Debe coincidir con el nombre en Script1
$alumnos = Import-Csv -Path "C:\Users\Administrador\Desktop\alumnos.csv"

# Crear/Actualizar usuarios en AD
foreach ($alumno in $alumnos) {
    $nombreUsuario = "$($alumno.nombre).$($alumno.apellidos)"
    
    # Configurar unidad X: (HomeDirectory)
    Set-ADUser -Identity $nombreUsuario `
        -HomeDrive "X:" `
        -HomeDirectory "\\$nombreServidor\IESELCAMINAS_USERS$\$nombreUsuario"

    # Asignar script de inicio de sesión para mapear Y:
    Set-ADUser -Identity $nombreUsuario `
        -ScriptPath "carpetas.bat"
}