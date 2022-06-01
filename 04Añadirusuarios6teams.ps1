# Añadir usuarios en 6 teams
# Jorge Fernández - 01/02/2022
cls

# CONSEGUIR CREDENCIALES
$credencialteams=Get-Credential

# CONECTAR A MICROSOFT TEAMS
Connect-MicrosoftTeams -Credential $credencialteams

$datos = "office365/04NNMicrosoftTeams.csv"
$datosteams = Import-Csv -Path $datos -Delimiter ";"
$n=1
foreach($datos in $datosteams){

    # ARCHIVOS CSV CON USUARIOS
    $pathusuarios="office365/05SRINNEQUIPO0$n.csv"
    $usuarios= Import-Csv -Path $pathusuarios -delimiter ";"

    # RECOGER GROUPID EN VARIABLE
    $groupid = Get-Team -MailNickName $datos.EquipoNombre

    # BUCLE PARA AÑADIR USUARIOS
    foreach($usuario in $usuarios){
        Add-TeamUser -GroupId $groupid.GroupId -User $usuario.alumno
        Write-Host "Usuario : "$usuario.alumno" introducido"
    }
    Write-Host "Usuarios introducidos en equipo: " $n 
    $n++
}