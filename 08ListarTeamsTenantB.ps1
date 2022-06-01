# Listar teams con AzureAD
# Jorge Fernández - 01/02/2022
cls

# CONSEGUIR CREDENCIALES
$credencialteams=Get-Credential

# CONECTAR A MICROSOFT TEAMS
Connect-Azaccount -Credential $credencialteams