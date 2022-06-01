install-module azuread

# CONSEGUIR CREDENCIALES
$credencialteams=Get-Credential

# CONECTAR A MICROSOFT TEAMS
Connect-Azuread -Credential $credencialteams

#Get-AzureADGroup | Out-GridView
#Get-AzureADGroup | select objectid, mailnickname, mail | Out-GridView

#Get-AzureADGroup | Out-GridView
Get-AzureADGroup | select objectid, mailnickname, mail | Export-Csv -Path documents/jorge.csv -Delimiter ";"