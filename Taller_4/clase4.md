## EJERCICIOS
1. Mostrar una tabla de procesos que incluya únicamente los nombres de los
   procesos, sus IDs, y si están respondiendo a Windows (la propiedad
   ``Responding`` muestra eso). Haga que la tabla tome el mínimo de espacio
   horizontal, pero no permita que la información se trunque.

	Get-Process | Select Name, Id, Responding | ft -Wrap

Name                          Id Responding
----                          -- ----------
AdobeARM                    1492       True
AgentSvc                    9800       True
ApplicationFrameHost        9000       True
armsvc                      3488       True
AsusSmartGestureDetector64 17688       True
AsusTPCenter               18596       True
AsusTPHelper               16204       True
AsusTPLoader               22096       True
audiodg                    11272       True


2. Muestre una tabla de procesos que incluya los nombres de los procesos y sus
   IDs. También incluya columnas para uso de memoria virtual y física;
   exprese dichos valores en megabytes (MB).

Name                          Id           VM(MB)       PM(MB)
----                          --           ------       ------
AdobeARM                    1492      86,44140625      2,15625
AgentSvc                    9800         80,71875       9,5625
ApplicationFrameHost        9000 4095,99999904633  13,95703125
armsvc                      3488      43,28515625   1,37890625
AsusSmartGestureDetector64 17688 4095,99999904633    3,1640625
AsusTPCenter               18596 4095,99999904633    3,9453125
AsusTPHelper               16204 4095,99999904633   1,40234375
AsusTPLoader               22096 4095,99999904633        2,625
audiodg                    11272 4095,99999904633   20,3359375
conhost                     4708 4095,99999904633     6,578125
csrss                        584 4095,99999904633   2,05859375
csrss                      23128 4095,99999904633   2,73828125
ctfmon                     15304 4095,99999904633   3,83203125

3. Emplee ``Get-EventLog`` para mostrar una lista de los logs de eventos
   disponibles (revise la ayuda para encontrar el parámetro que le permitirá
   obtener dicha información). Formatee la salida como una tabla que incluya
   el nombre de despliegue del log y el período de retención. Los encabezados
   de columna deben ser NombreLog y Per-Retencion.

Get-EventLog -List | ft @{n='NombreLog';e={$_.LogDisplayName}},@{n='Per-Retencion';e={$_.minimumRetentionDays}}

NombreLog                            Per-Retencion
---------                            -------------
Aplicación                                       0
Eventos de hardware                              0
Internet Explorer                                7
Kaspersky Event Log                              7
Servicio de administración de claves             0
Nano                                             0
Microsoft Office Alerts                          0
                                                  
Sistema                                          0
Windows Azure                                    7
Windows PowerShell                               0

4. Muestre una lista de servicios, de tal manera que aparezcan agrupados los
   servicios que están iniciados y los que están detenidos. Los que están
   iniciados deben aparecer primero.

Get-Service | sort status -Descending | ft -GroupBy status

Status   Name               DisplayName                           
------   ----               -----------                           
Running  IKEEXT             Módulos de creación de claves de IP...
Running  TermService        Servicios de Escritorio remoto        
Running  netprofm           Servicio de lista de redes            
Running  Themes             Temas                                 
Running  TimeBrokerSvc      Agente de eventos de tiempo           
Running  NcbService         Agente de conexión de red             
Running  TokenBroker        Administrador de cuentas web          
Running  TrkWks             Cliente de seguimiento de vínculos ...
Running  NanoServiceMain    Panda Protection Service              
Running  UmRdpService       Redirector de puerto en modo usuari...
Running  mpssvc             Firewall de Windows Defender          
Running  LxssManagerUser... LxssManagerUser_10134dfc              
Running  UserManager        Administrador de usuarios

tatus   Name               DisplayName                           
------   ----               -----------                           
Stopped  wmiApSrv           Adaptador de rendimiento de WMI       
Stopped  workfolderssvc     Work Folders                          
Stopped  vmicvmsession      Servicio PowerShell Direct de Hyper-V 
Stopped  vmicshutdown       Servicio de cierre de invitado de H...
Stopped  spectrum           Servicio de percepción de Windows     
Stopped  sppsvc             Protección de software                
Stopped  vmicrdv            Servicio de virtualización de Escri...
Stopped  SNMPTRAP           Captura de SNMP                      

5. Mostrar una lista a cuatro columnas de todos los directorios que están en
   el raíz de la unidad ``C:``

dir -Path 'C:' | fw -Column 4


.3T                               .anaconda                        .android                         .aws                            
.conda                            .config                          .cordova                         .dotnet                         
.eclipse                          .Icecream Screen Recorder        .ipynb_checkpoints               .ipython                        
.jupyter                          .m2                              .matplotlib                      .node-gyp                       
.nuget                            .p2                              .PyCharmCE2018.3                 .serverless                     
.ssh                              .sts4                            .templateengine                  .tooling                        
.vim                              .VirtualBox                      .vscode                          .webgoat-8.0.0.M21              
.WebStorm2019.1                   3D Objects                       app                              app2                            
Application Data                  CmapToolsLogs                    Contacts                         cursoGit                        
CUsersS                          Desktop                          Documents                        Downloads                       
eclipse                           eclipse-workspace                Favorites                        git                             
Links                             Music                            NDesktop                         node_modules                    
OneDrive                          OWASP ZAP                        Pictures                         Postman                         
pseint                            Saved Games                      Searches                         source                          
Videos                            VirtualBox VMs                   .bash_history                    .condarc                        
.gitconfig                        .node_repl_history               .octave_hist                     .pgAdmin4.1590372639.addr       
.pgAdmin4.1590372639.log          .pgAdmin4.2123502176.addr        .pgAdmin4.2123502176.log         .pgAdmin4.startup.log           
.serverlessrc                     .viminfo                         .vuerc                           .yarnrc                         
Biblio.mdf                        Biblioteca.mdf                   Biblioteca_log.ldf               Biblio_log.ldf                  
data1.csv                         data2.csv                        data3.csv                        eventLog.txt                    
jnp4e.keys                        log.txt                          openstego.ini                    package-lock.json               
procesos.csv                      Process.txt                      servicios.csv                    source - Acceso directo.lnk     
Sti_Trace.log                     _netrc                                                                                            


6. Cree una lista formateada de todos los archivos ``.exe`` del directorio
   ``C:\Windows``. Debe mostrarse el nombre, la información de versión, y el
   tamaño del archivo. La propiedad de tamaño se llama ``length`` en Powershell,
   pero para mayor claridad, la columna se debe llamar **Tamaño** en su listado.

dir -Path C:\Windows | where -Filter {$_.Name  -like ".exe"} | fl Name, @{n="Tamaño"; e={$_.Length}}, VersionInfo


7. Importe el módulo ``NetAdapter`` (empleando el comando ``Import-Module
   NetAdapter``).
   Empleando el cmdlet ``Get-NetAdapter``, muestre una lista de adaptadores no
   virtuales (adaptadores cuya propiedad Virtual sea falsa. El valor lógico
   falso es representado por Powershell como ``$False``).

Get-NetAdapter | where -filter {$_.virtual -eq $False}

Name                      InterfaceDescription                    ifIndex Status       MacAddress             LinkSpeed
----                      --------------------                    ------- ------       ----------             ---------
Ethernet                  Realtek PCIe FE Family Controller            24 Disconnected 14-DD-A9-BE-78-31          0 bps
Wi-Fi                     Qualcomm Atheros AR956x Wireless Net...      21 Disconnected AC-E0-10-9D-6F-F1        65 Mbps
Ethernet 3                TAP-Windows Adapter V9                       13 Disconnected 00-FF-5C-F2-F6-14       100 Mbps


8. Importe el módulo ``DnsClient``. Empleando el cmdlet ``Get-DnsClientCache``,
   muestre una lista de los registros ``A`` y ``AAAA`` que estén en el caché.
   Sugerencia: Si el caché está vacío, visite algunos sitios web para poblarlo.

Get-DnsClient | where -filter {$_.Type -eq (28) -or $_.Type -eq 1} | fl

9. Genere una lista de todos los archivos ``.exe`` del directorio
   ``C:\Windows\System32`` que tengan más de 5 MB.

dir -Path C:\Windows\System32 | where -filter {$_.Extension -eq '.exe' -and $_.Length/1MB -gt 5} | ft Name, @{n='Length (MB)';e={$_.Length /1MB -as [int]}}

Name              Length (MB)
----              -----------
OneDriveSetup.exe          27

10. Muestre una lista de parches que sean actualizaciones de seguridad.

Get-HotFix | where -filter {$_.Description -eq 'Security Update'}

Source        Description      HotFixID      InstalledBy          InstalledOn              
------        -----------      --------      -----------          -----------              
DESKTOP-7F... Security Update  KB4515383     NT AUTHORITY\SYSTEM  27/09/2019 12:00:00 a. m.
DESKTOP-7F... Security Update  KB4516115     NT AUTHORITY\SYSTEM  29/09/2019 12:00:00 a. m.
DESKTOP-7F... Security Update  KB4521863     NT AUTHORITY\SYSTEM  13/10/2019 12:00:00 a. m.
DESKTOP-7F... Security Update  KB4524244     NT AUTHORITY\SYSTEM  14/02/2020 12:00:00 a. m.
DESKTOP-7F... Security Update  KB4524569     NT AUTHORITY\SYSTEM  15/11/2019 12:00:00 a. m.
DESKTOP-7F... Security Update  KB4528759     NT AUTHORITY\SYSTEM  4/02/2020 12:00:00 a. m. 
DESKTOP-7F... Security Update  KB4537759     NT AUTHORITY\SYSTEM  13/02/2020 12:00:00 a. m.
DESKTOP-7F... Security Update  KB4538674     NT AUTHORITY\SYSTEM  12/02/2020 12:00:00 a. m.
DESKTOP-7F... Security Update  KB4541338     NT AUTHORITY\SYSTEM  11/03/2020 12:00:00 a. m.

11. Muestre una lista de parches que hayan sido instalados por el
    usuario ``Administrador``, que sean actualizaciones. Si no tiene ninguno,
    busque parches instalados por el usuario ``System``. Note que algunos parches
    no tienen valor en el campo ``Installed By``.

Get-HotFix | where -filter {$_.InstalleBy -like "System"} | fl

12. Genere una lista de todos los procesos que estén corriendo con el nombre
    **Conhost** o **Svchost**.
 Get-Process | where -filter {$_.Name -eq "Conhost" -or $_.Name -eq "Svchost"} | fl

Id      : 4708
Handles : 153
CPU     : 
SI      : 0
Name    : conhost

Id      : 336
Handles : 1257
CPU     : 
SI      : 0
Name    : svchost

Id      : 496
Handles : 485
CPU     : 
SI      : 0
Name    : svchost

Id      : 596
Handles : 344
CPU     : 
SI      : 0
Name    : svchost