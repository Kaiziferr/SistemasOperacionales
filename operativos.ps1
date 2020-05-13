$process{
$z = "ok"
do{


$x = Read-Host -Prompt "
1 - Desplegar los cinco procesos que más CPU esté consumiendo en ese momento.
2 - Desplegar los filesystems o discos conectados a la máquina.
3 - Desplegar el nombre y el tamaño del archivo más grande almacenado en un disco o filesystem que el usuario deberá especificar.
4 - Cantidad de memoria libre y cantidad del espacio de swap en uso.
5 - Número de conexiones de red activas actualmente.
6 - salir.

Ingrese opción"


Switch($x){
   1{echo "opcion 1"; primero}
   2{echo "opcion 2"; segundo}
   3{echo "opcion 3"; tercero}
   4{echo "opcion 4"; cuarto}
   5{echo "opcion 5"; quinto}
   6{echo "opcion 6"; salir}
}

}while($z)


function salir(){
     exit
}

#Se obtienen los procesos, despues se ordenan decrecientemente y por ultimo seleccionamos los cinco primeros
function primero(){
    get-process | sort CPU -Descending | select -First 5 | ft -Autosize 
}

#Esta funcion obtiene todos los discos con su tamaño
function segundo(){
    Get-PSDrive | select @{n="Nombre";e={$_.Name}},@{n="Tamanio";e={($_.free + $_.used)}}, @{n="Espacio Libre";e={$_.free}}, @{n="Direccion";e={$_.Root}}, @{n="Provedor";e={$_.Provider}}
}

#Se busca el archivo mas grande del disco introducido
function tercero(){
    $dic = Read-Host "Introduzca el disco (Sea la letra)"
    dir "$($dic):\" -Attributes Archive -Recurse -EA 0 | sort Length -Descending | select @{n="Nombre";e={$_.Name}} -First
}

#Instanciamos el siste operativo para verificas el swap y las memorias
function cuarto(){
    Get-CIMInstance Win32_OperatingSystem | select @{n="Cantidad de Swap ocupado";e={$_.SizeStoredInPagingFiles}},@{n="Memoria Fisica Libre";e={$_.FreePhysicalMemory}}, @{n="Memoria Virtual Libre";e={$_.FreeVirtualMemory}},
    @{n="Memoria Fisica Libre en porcentaje";e={($_.FreePhysicalMemory/ $_.TotalVisibleMemorySize) * 100}}, @{n="Memoria Virtual Libre porcentaje";e={($_.FreeVirtualMemory/$_.totalvirtualmemorySize)*100}};
}

#Se obtienen las conexiones, despues seleccionamos las conexiones establecidad
function quinto(){
    Get-NetTCPConnection | where {$_.State -like "*Established*"}
}

}