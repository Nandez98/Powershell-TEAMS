# Listar usuarios usuarios AzureAD
# Jorge Fernández - 03/02/2022
cls

# CONSEGUIR CREDENCIALES
$credencialteams=Get-Credential

# CONECTAR AZUREAD
Connect-AzureAD -Credential $credencialteams

Get-AzureADUser | export-csv -Path documents/usuarios.csv