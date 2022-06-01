# Borrar 6 teams
# Jorge Fernández - 01/02/2022
cls

# CONSEGUIR CREDENCIALES
$credencialteams=Get-Credential

# CONECTAR A MICROSOFT TEAMS
Connect-MicrosoftTeams -Credential $credencialteams

$datos = "office365/04NNMicrosoftTeams.csv"
$datosteams = Import-Csv -Path $datos -Delimiter ";"
foreach($datos in $datosteams){
    $groupid = Get-Team -MailNickName $datos.EquipoNombre
    Remove-Team -GroupId $groupid.GroupId
    Write-Host "Borrando equipo "$datos.equiponombre
}