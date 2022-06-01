# Crear 6 teams
# Jorge Fernández - 01/02/2022
cls

# INSTALAR MODULO DE TEAMS
# Install-Module microsoftteams

# CONSEGUIR CREDENCIALES
$credencialteams=Get-Credential

# CONECTAR A MICROSOFT TEAMS
Connect-MicrosoftTeams -Credential $credencialteams

$datos = "office365/04NNMicrosoftTeams.csv"
$datosteams = Import-Csv -Path $datos -Delimiter ";"
foreach($datos in $datosteams){
    $grupoid = new-team -mailnickname $datos.EquipoNombre -displayname $datos.EquipoDescripcion -visibility private
    Add-TeamUser -GroupId $grupoid.GroupId -User $datos.Profesor -Role Owner
    Write-Host "Creando equipo "$datos.equiponombre
}