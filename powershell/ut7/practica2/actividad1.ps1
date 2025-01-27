#1-Visualiza las carpetas compartidas, excluyendo los especiales de sistema.Get-SmbShare | Where-Object { $_.Special -eq $false }
#2-Crea una carpeta con el nombre ASO en el path C:\ASO utilizando el comando New-Item
New-Item -Path "C:\carpetaASO" -ItemType Directory
#3-Comparte la carpeta C:\ASO con el nombre aso utilizando el comando New-SmbShareNew-SmbShare -Name "aso" -Path "C:\carpetaASO" -FullAccess "Todos"

#4. Visualiza desde el Administrador de Servidor->Servicios de Archivo y de
#Almacenamiento->Recursos compartidos la carpeta recién compartida.
#A continuación, accede a las propiedades de esa carpeta, los permisos y haz clic en 
#Personalizar permisos.
#Accede a la pestaña Compartir y explica qué permisos por defecto se han asignado al 
#compartir la carpeta aso.


#RESPONDIDO EN LA TAREA DE TEORIA.

#5. Cambia los permisos del recurso compartido para que los usuarios del
#grupo profesores tengan acceso Total a la carpeta aso y los usuarios del
#grupo alumnos solo tengan acceso de lectura. El resto de Usuarios no
#deben tener acceso. Para ello debes utilizar los comandos
#Grant-SmbShareAccess y Revoke-SmbShareAccess

Revoke-SmbShareAccess -Name "aso" -AccountName "Todos" -Force

Grant-SmbShareAccess -Name "aso" -AccountName "profesores" -AccessRight Full -Force

Grant-SmbShareAccess -Name "aso" -AccountName "alumnos" -AccessRight Read -Force

Get-SmbShareAccess -Name "aso"
