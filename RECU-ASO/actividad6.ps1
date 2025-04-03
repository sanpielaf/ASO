$alumnos = Import-Csv -Path "C:\Users\Administrador\Desktop\alumnos.csv"

foreach($alumno in $alumnos){

    ##Cuando un alumno inicie sesión, conectará de forma automática la carpeta 
    ##personal en la unidad X:
    Set-ADUser -Identity "$($alumno.nombre).$($alumno.apellidos)" -ScriptPath "carpetas.bat" -HomeDrive "X:" -HomeDirectory "\\WINDOWS-SERVER-SANTI\IESELCAMINAS_USERS$\$($alumno.nombre).$($alumno.apellidos)"
}


###y la carpeta del grupo en la unidad Y:

#Set-ADUser -Identity "$($grupo.nombre)" -ScriptPath "carpetas.bat" -HomeDrive "Y:" -HomeDirectory "\\RECUSANTI.LOCAL\IESELCAMINAS\"$($grupo.nombre)"