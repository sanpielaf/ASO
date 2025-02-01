#Ejercicio 1 . Ejecuta Windows PowerShell en Windows 2019 Server el cmdlet 
#adecuado para visualizar la política de ejecución de scripts actual y cambia 
#las políticas de ejecución de scripts (execution policy) para que se pueda 
#ejecutar cualquier script en PowerShell. 
#Ejecuta el cmdlet correspondiente para mostrar la versión instalada en el sistema.

Get-ExecutionPolicy 
Set-ExecutionPolicy Unrestricted
$PSVersionTable

