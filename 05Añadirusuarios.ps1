# Añadir usuarios
# Jorge Fernández - 01/02/2022
cls

# CONSEGUIR CREDENCIALES
$credencialteams=Get-Credential

# CONECTAR A MICROSOFT TEAMS
Connect-MicrosoftTeams -Credential $credencialteams

# ARCHIVOS CSV CON TEAMS
$datos = "office365/04NNMicrosoftTeams.csv"
$datosteams = Import-Csv -Path $datos -Delimiter ";"
$n=1
foreach($datos in $datosteams){

    # ARCHIVOS CSV CON USUARIOS
    $pathusuarios="office365/05SRINNEquipo0$n.csv"
    $usuarios= Import-Csv -Path $pathusuarios -delimiter ";"

    # RECOGER GROUPID EN VARIABLE
    $groupid = Get-Team -MailNickName $datos.EquipoNombre

    # BUCLE PARA AÑADIR USUARIOS
    foreach($usuario in $usuarios){
        Add-TeamUser -GroupId $groupid.GroupId -User $usuario.alumno
        
        # COMPROBAR SI EL USUARIO EXISTE EN EL GRUPO
        if(Get-Team -User $usuario.Alumno -GroupId $groupid.GroupId){
            Write-Host "Usuario: "$usuario.alumno" introducido en equipo: Equipo0$n"
        }else{
            Write-Host "Usuario: "$usuario.alumno" no existe."
        }



        # OTRA FORMA DE COMPROBAR SI EL USUARIO EXISTE EN EL GRUPO

        #$GroupMembers = (Get-AzureADGroupMember -ObjectId $groupid.GroupId | Select ObjectId)
        #If ($GroupMembers -Match $usuario.ObjectId) {
        #    Write-Host "Usuario: "$usuario.alumno" introducido en equipo: Equipo0$n"
        #}else{
        #    Write-Host "Usuario: "$usuario.alumno" no existe."
        #} 

    }
    Write-Host "Usuarios totales introducidos en"Equipo0$n":" $usuarios.Count
    $n++
}
