# Creacion de NN teams en Office365
# Jorge Fernández
# 26/02/2022
cls

# Instalar módulo teams.
# Install-module MicrosoftTeams -force

# Conectar a microsoft teams.
Connect-MicrosoftTeams # -accountid alumno11@javiteran20.onmicrosoft.com 

# Crear equipo team
$miteam= new-team -mailnickname "Tortura11" -displayname "Tortura 11" -visibility private

# Añadir usuarios
#Add-TeamUser -GroupId $miteam.groupid -user alumno11@javiteran20.onmicrosoft.com -role owner
#Add-TeamUser -GroupId $miteam.groupid -user alumno02@javiteran20.onmicrosoft.com
#Add-TeamUser -GroupId $miteam.groupid -user alumno05@javiteran20.onmicrosoft.com

# Añadir equipos nuevos al team
#New-TeamChannel -DisplayName "Tema 01" -GroupId $miteam.groupid
#New-TeamChannel -DisplayName "Tema 02" -GroupId $miteam.groupid
#New-TeamChannel -DisplayName "Tema 02" -GroupId $miteam.groupid

# Lo mismo con bucle

[int]$nequipos=Read-Host "¿Cuántos equipos quieres?"
$conf=Read-Host "¿Quieres que los equipos sean consecutivos? Ej. Tema1, Tema2, etc. [S|N]"

for($i=1;$i -le $nequipos;$i++){
    if(($i-eq 1) -and ($conf="S")){
        $equipo=Read-Host "Nombre del equipo 0"
    }   
    if($conf-eq"N"){
        $equipo=Read-Host "Nombre del equipo"
        New-TeamChannel -DisplayName $equipo -GroupId $miteam.groupid
        Write-Host "Equipo $equipo creado"
    }elseif($conf-eq"S"){
        if($i-lt "10"){
            New-TeamChannel -DisplayName "$equipo 0$i" -GroupId $miteam.groupid
            Write-Host "Equipo $equipo"0"$i creado"
        }else{
            New-TeamChannel -DisplayName "$equipo $i" -GroupId $miteam.groupid
            Write-Host "Equipo $equipo $i creado"
        }
    }
}