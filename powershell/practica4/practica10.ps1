do 
{
    Clear-Host # esto elimina todo el texto y comandos previos de la pantalla
    write-host "El menú es el siguiente. Para salir, deberás pulsar la x "
    write-host "a) Crear una carpeta "
    write-host "b) Crear un fichero nuevo "
    write-host "c) Cambiar el nombre de un fichero o carpeta"
    write-host "d) Borrar un archivo o carpeta"
    write-host "e) Verificar si existe un fichero o carpeta"
    Write-Host "f) Mostrar el contenido de un directorio."
    write-host "g) Mostar la fecha y hora actuales"
    write-host "x) Salir"

    $option = read-host "selecciona una opción"

    switch ($option) {
        "a" {
           $nombrecarpeta = read-host "a) Crear una carpeta. Introduce el nombre" 
           New-Item $nombrecarpeta -ItemType directory
           Write-Host "creaste la carpeta $nombrecarpeta"
           }
        "b" {
           $nombrefichero = read-host "b) Crear un fichero nuevo. Introduce el nombre"
            New-Item C:\WINDOWS\system32\ASO\powershell\practica4\$nombrefichero -ItemType file
           Write-Host "creaste el fichero $nombrefichero"
           }
        "c" { 
            $nombreviejo = read-host "c) Cambiar el nombre de un fichero o carpeta. Pon el nombre actual"
            $nombrenuevo = read-host "Pon el nombre nuevo"
            Rename-Item $nombreviejo -Path $nombrenuevo -newname
            write-host "Se cambió el nombre de un fichero o carpeta de $nombreviejo a $nombrenuevo "
            }
        "d" {
           $borrarfichero = read-host "d) Borrar un archivo o carpeta. Introduce el nombre"
           Remove-Item -Path $borrarfichero
           Write-Host "borraste el fichero $borrarfichero"             
            }
        "e" {
            $verificarfichero = read-host "e) Verificar si existe un fichero o carpeta. INtrodiuce el nombre del fichero"
                if (Test-Path $verificarfichero) {
                    Write-Host "El fichero o carpeta existe"
                 } else {
                    Write-Host "El fichero o carpeta no existe"
                 }
            }
        "f" {
             $contenidodirectorio = read-host "f) Mostrar el contenido de un directorio."
             Get-Content -Path $contenidodirectorio
            }
        "g" {
            $fechaActual = Get-Date
            Write-Host "g) Mostar la fecha y hora actuales"
            }
        "x" {
            Write-Host "Saliendo del programa..."
            }
        
        default {
            Write-Host "Opción no válida. Por favor, seleccione una opción correcta."
        }
    }
    if ($option -ne "x") {
        Read-Host "Presione Enter para continuar"
    }
} until ($option -eq "x")