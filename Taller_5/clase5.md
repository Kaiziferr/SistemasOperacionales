## EJERCICIOS
1. ¿Cuál clase puede emplearse para consultar la dirección IP de un adaptador
   de red? ¿Posee dicha clase algún método para liberar un préstamo de
   dirección (lease) DHCP

La clase para emplearse para consultar la direcciòn IP es win32_NetworkadapterConfiguration 

Get-CimInstance -ClassName win32_NetworkadapterConfiguration | ft ServiceName, IPAddress

ServiceName  IPAddress                                   
-----------  ---------                                   
kdnic                                                    
vwifimp                                                  
VBoxNetAdp   {192.168.56.1, fe80::b5d9:a7fe:3ccb:9842}   
VBoxNetAdp   {169.254.253.111, fe80::55c4:1d21:504b:fd6f}
tap0901                                                  
athr                                                     
rt640x64                                                 
vwifimp                                                  
vwifimp                                                  
RasSstp                                                  
RasAgileVpn                                              
Rasl2tp                                                  
PptpMiniport                                             
RasPppoe                                                 
NdisWan                                                  
NdisWan                                                  
NdisWan                                                  
kltap                                                    
aftap0901   


2. Despliegue una lista de parches empleando WMI (Microsoft se refiere a los
   parches con el nombre **quick-fix engineering**). Es diferente el listado al
   que produce el cmdlet ``Get-Hotfix``?

Get-WmiObject win32_quickfixengineering

Source        Description      HotFixID      InstalledBy          InstalledOn              
------        -----------      --------      -----------          -----------              
DESKTOP-7F... Update           KB4534132     NT AUTHORITY\SYSTEM  8/02/2020 12:00:00 a. m. 
DESKTOP-7F... Security Update  KB4515383     NT AUTHORITY\SYSTEM  27/09/2019 12:00:00 a. m.
DESKTOP-7F... Security Update  KB4516115     NT AUTHORITY\SYSTEM  29/09/2019 12:00:00 a. m.
DESKTOP-7F... Security Update  KB4521863     NT AUTHORITY\SYSTEM  13/10/2019 12:00:00 a. m.
DESKTOP-7F... Security Update  KB4524244     NT AUTHORITY\SYSTEM  14/02/2020 12:00:00 a. m.
DESKTOP-7F... Security Update  KB4524569     NT AUTHORITY\SYSTEM  15/11/2019 12:00:00 a. m.
DESKTOP-7F... Security Update  KB4528759     NT AUTHORITY\SYSTEM  4/02/2020 12:00:00 a. m. 
DESKTOP-7F... Update           KB4532441     NT AUTHORITY\SYSTEM  10/12/2019 12:00:00 a. m.
DESKTOP-7F... Security Update  KB4537759     NT AUTHORITY\SYSTEM  13/02/2020 12:00:00 a. m.
DESKTOP-7F... Security Update  KB4538674     NT AUTHORITY\SYSTEM  12/02/2020 12:00:00 a. m.
DESKTOP-7F... Security Update  KB4541338     NT AUTHORITY\SYSTEM  11/03/2020 12:00:00 a. m.
DESKTOP-7F... Update           KB4551762     NT AUTHORITY\SYSTEM  14/03/2020 12:00:00 a. m.


3. Empleando WMI, muestre una lista de servicios, que incluya su status actual,
   su modalidad de inicio, y las cuentas que emplean para hacer login.
Get-WmiObject -Class Win32_service | ft status, startMode, name
status startMode name                    
------ --------- ----                    
OK     Auto      AdobeARMservice         
OK     Manual    AJRouter                
OK     Manual    ALG                     
OK     Manual    AppIDSvc                
OK     Manual    Appinfo                 
OK     Manual    AppMgmt                 
OK     Manual    AppReadiness            
OK     Disabled  AppVClient              
OK     Manual    AppXSvc               
4. Empleando cmdlets de CIM, liste todas las clases del namespace
   ``SecurityCenter2``, que tengan **product** como parte del nombre.
 Get-CimClass -Namespace root\CIMv2 | where cimclassname -like *product*

NameSpace: ROOT/CIMv2

CimClassName                        CimClassMethods      CimClassProperties                                          
------------                        ---------------      ------------------                                          
CIM_Product                         {}                   {Caption, Description, IdentifyingNumber, Name...}          
Win32_ComputerSystemProduct         {}                   {Caption, Description, IdentifyingNumber, Name...}          
Win32_Product                       {Install, Admin, ... {Caption, Description, IdentifyingNumber, Name...}          
SoftwareLicensingProduct            {UninstallProduct... {ADActivationCsvlkPid, ADActivationCsvlkSkuId, ADActivati...
Win32_ProductResource               {}                   {Product, Resource}                                         
CIM_ProductSoftwareFeatures         {}                   {Component, Product}                                        
Win32_ProductSoftwareFeatures       {}                   {Component, Product}                                        
CIM_ProductFRU                      {}                   {FRU, Product}                                              
CIM_FRUIncludesProduct              {}                   {Component, FRU}                                            
CIM_ProductPhysicalElements         {}                   {Component, Product}                                        
CIM_ProductSupport                  {}                   {Product, Support}                                          
Win32_ProductCheck                  {}                   {Check, Product}                                            
CIM_ProductParentChild              {}                   {Child, Parent}                                             
CIM_ProductProductDependency        {}                   {DependentProduct, RequiredProduct, TypeOfDependency}       
CIM_CompatibleProduct               {}                   {CompatibilityDescription, CompatibleProduct, Product}      


5. Empleando cmdlets de CIM, y los resultados del ejercicio anterior, muestre
   los nombres de las aplicaciones antispyware instaladas en el sistema.
   También puede consultar si hay productos antivirus instalados en el sistema.

No tengo antispyware instalados en el sistema
Get-CimClass -Namespace root\CIMv2 | where cimclassname -like *AntiSpyware*