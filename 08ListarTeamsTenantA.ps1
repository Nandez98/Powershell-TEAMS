# Listar teams con AzureAD
# Jorge Fernández - 01/02/2022
cls

# CONSEGUIR CREDENCIALES
$credencialteams=Get-Credential

# CONECTAR A MICROSOFT TEAMS
Connect-MicrosoftTeams -Credential $credencialteams

# SACAR RESULTADO A UN CSV
Get-Team | select groupid, mailnickname, mail | Export-Csv -Path office365/08ListarTeamsTenant.csv -Delimiter ";"