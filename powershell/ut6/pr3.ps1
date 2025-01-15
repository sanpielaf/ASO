$empleados = Import-Csv -Path "C:\Users\Administrador\Downloads\archivos\empleados.csv" -Delimiter ";"
$departamentos = Import-Csv -Path "C:\Users\Administrador\Downloads\archivos\departamentos.csv" -Delimiter ";"


New-ADOrganizationalUnit -Name "Empresa" -Path "DC=santi,DC=local"

foreach ($departamento in $departamentos) {
    New-ADOrganizationalUnit -Name $departamento.departamento -Path "OU=Empresa,DC=santi,DC=local"
}