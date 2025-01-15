Set-ADOrganizationalUnit -ProtectedFromAccidentalDeletion $false -Path "OU=Empresa,DC=santi,DC=local"
Remove-ADOrganizationalUnit -Identity "OU=Empresa,DC=santi,DC=local" -Recursive -Confirm:$false