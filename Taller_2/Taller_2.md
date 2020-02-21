#Tercer Taller


**1.Cree dos archivos de texto similares (con una o dos líneas diferentes). Compárelos empleando diff.**


Get-Process -Name WmiPrvSE | Select-Object -Property BasePriority,Id,SessionId,WorkingSet |
  Export-Csv -Path .\data1.csv -NoTypeInformation

PS C:\Users\S T E V E N> Get-Process -Name WmiPrvSE | Select-Object -Property BasePriority,Id |
  Export-Csv -Path .\data2.csv -NoTypeInformation

PS C:\Users\S T E V E N> diff -Ref (cat .\data1.csv) -Diff (cat .\data2.csv)



InputObject                                  SideIndicator
-----------                                  -------------
"BasePriority","Id"                          =>           
"8","1712"                                   =>           
"8","5828"                                   =>           
"8","9848"                                   =>           
"BasePriority","Id","SessionId","WorkingSet" <=           
"8","1712","0","10563584"                    <=           
"8","5828","0","8806400"                     <=           
"8","9848","0","4476928"                     <=           




2

PS C:\Users\S T E V E N> get-service | export-csv data3.csv | out-file
out-file : No se puede procesar el argumento porque el valor del argumento "path" es NULL. Cambie el valor del argumento "path" a un 
valor no nulo.
En línea: 1 Carácter: 38
+ get-service | export-csv data3.csv | out-file
+                                      ~~~~~~~~
    + CategoryInfo          : InvalidArgument: (:) [Out-File], PSArgumentNullException
    + FullyQualifiedErrorId : ArgumentNull,Microsoft.PowerShell.Commands.OutFileCommand


3.
 get-service | export-csv data3.csv -Delimiter ";"


4.
WhatIf


5.
Windows emplea configuraciones regionales, lo que incluye el separador de listas. En Windows en inglés, el separador de listas es la coma (,). Cómo se le dice a Export-CSV que emplee el separador del sistema en lugar de la coma?

Get-Process |Export-Csv servicios.csv -Delimiter ((Get-Culture).TextInfo.ListSeparator)


6
random
506112939

Get-Random
1781921954

7

date

viernes, 21 de febrero de 2020 2:22:35 p. m.


8

DateTime

date | Select-Object DayOfWeek


9
DayOfWeek
---------
   Friday



10
Get-HotFix

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
DESKTOP-7F... Update           KB4532693     NT AUTHORITY\SYSTEM  13/02/2020 12:00:00 a. m.


11
Get-HotFix | Select-Object InstalledOn,InstalledBy,HotFixID | Sort-Object -Property InstalledOn


InstalledOn               InstalledBy         HotFixID 
-----------               -----------         -------- 
27/09/2019 12:00:00 a. m. NT AUTHORITY\SYSTEM KB4515383
29/09/2019 12:00:00 a. m. NT AUTHORITY\SYSTEM KB4516115
13/10/2019 12:00:00 a. m. NT AUTHORITY\SYSTEM KB4521863
15/11/2019 12:00:00 a. m. NT AUTHORITY\SYSTEM KB4524569
10/12/2019 12:00:00 a. m. NT AUTHORITY\SYSTEM KB4532441
4/02/2020 12:00:00 a. m.  NT AUTHORITY\SYSTEM KB4528759
8/02/2020 12:00:00 a. m.  NT AUTHORITY\SYSTEM KB4534132
12/02/2020 12:00:00 a. m. NT AUTHORITY\SYSTEM KB4538674
13/02/2020 12:00:00 a. m. NT AUTHORITY\SYSTEM KB4537759
13/02/2020 12:00:00 a. m. NT AUTHORITY\SYSTEM KB4532693
14/02/2020 12:00:00 a. m. NT AUTHORITY\SYSTEM KB4524244



12.
Get-HotFix | Select-Object -Property InstalledOn, InstalledBy, HotfixID | Sort-Object -Property InstalledOn


InstalledOn               InstalledBy         HotfixID 
-----------               -----------         -------- 
27/09/2019 12:00:00 a. m. NT AUTHORITY\SYSTEM KB4515383
29/09/2019 12:00:00 a. m. NT AUTHORITY\SYSTEM KB4516115
13/10/2019 12:00:00 a. m. NT AUTHORITY\SYSTEM KB4521863
15/11/2019 12:00:00 a. m. NT AUTHORITY\SYSTEM KB4524569
10/12/2019 12:00:00 a. m. NT AUTHORITY\SYSTEM KB4532441
4/02/2020 12:00:00 a. m.  NT AUTHORITY\SYSTEM KB4528759
8/02/2020 12:00:00 a. m.  NT AUTHORITY\SYSTEM KB4534132
12/02/2020 12:00:00 a. m. NT AUTHORITY\SYSTEM KB4538674
13/02/2020 12:00:00 a. m. NT AUTHORITY\SYSTEM KB4537759
13/02/2020 12:00:00 a. m. NT AUTHORITY\SYSTEM KB4532693
14/02/2020 12:00:00 a. m. NT AUTHORITY\SYSTEM KB4524244



13.

Get-EventLog -LogName System -Newest 50 | Select-Object -Property Index, TimeGenerated, Source | Sort-Object -Property TimeGenerated, Index > log.txt


cat log.txt

Index TimeGenerated             Source                                
----- -------------             ------                                
16909 20/02/2020 11:03:21 p. m. Microsoft-Windows-Winlogon            
16910 20/02/2020 11:03:22 p. m. Microsoft-Windows-Kernel-Power        
16911 20/02/2020 11:03:25 p. m. Microsoft-Windows-Kernel-Power        
16912 20/02/2020 11:03:31 p. m. Microsoft-Windows-Kernel-Power        
16913 21/02/2020 7:11:34 a. m.  Microsoft-Windows-Kernel-General      
16914 21/02/2020 7:11:35 a. m.  VBoxNetLwf                            
16915 21/02/2020 7:11:35 a. m.  VBoxNetLwf                            
16916 21/02/2020 7:11:36 a. m.  VBoxNetLwf                            
16917 21/02/2020 7:11:36 a. m.  Microsoft-Windows-Kernel-Boot         
16918 21/02/2020 7:11:36 a. m.  Microsoft-Windows-Kernel-Boot         
16919 21/02/2020 7:11:36 a. m.  Microsoft-Windows-Kernel-Boot         
16920 21/02/2020 7:11:36 a. m.  Microsoft-Windows-Kernel-Boot         
16921 21/02/2020 7:11:36 a. m.  Microsoft-Windows-Kernel-Boot         
16922 21/02/2020 7:11:37 a. m.  Microsoft-Windows-Winlogon            
16923 21/02/2020 7:11:40 a. m.  Microsoft-Windows-Power-Troubleshooter
16924 21/02/2020 7:14:44 a. m.  DCOM                                  
16925 21/02/2020 7:14:57 a. m.  Service Control Manager               
16926 21/02/2020 7:25:12 a. m.  Service Control Manager               
16927 21/02/2020 7:32:36 a. m.  Microsoft-Windows-Kernel-Power        
16928 21/02/2020 7:44:40 a. m.  Service Control Manager               
16929 21/02/2020 8:04:58 a. m.  Microsoft-Windows-Kernel-Power        
16930 21/02/2020 8:13:52 a. m.  DCOM                                  
16931 21/02/2020 8:16:56 a. m.  DCOM                                  
16932 21/02/2020 8:17:21 a. m.  DCOM                                  
16933 21/02/2020 8:18:39 a. m.  Microsoft-Windows-Kernel-Power        
16934 21/02/2020 8:18:43 a. m.  Microsoft-Windows-Kernel-Power        
16935 21/02/2020 8:18:43 a. m.  Microsoft-Windows-Kernel-Power        
16936 21/02/2020 11:18:40 a. m. Microsoft-Windows-Kernel-General      
16937 21/02/2020 11:18:40 a. m. Microsoft-Windows-Kernel-Power        
16938 21/02/2020 11:18:41 a. m. VBoxNetLwf                            
16939 21/02/2020 11:18:41 a. m. VBoxNetLwf                            
16940 21/02/2020 11:18:42 a. m. VBoxNetLwf                            
16941 21/02/2020 11:18:45 a. m. Microsoft-Windows-Power-Troubleshooter
16942 21/02/2020 11:18:51 a. m. Microsoft-Windows-Kernel-Power        
16943 21/02/2020 11:19:03 a. m. Microsoft-Windows-Kernel-Power        
16944 21/02/2020 1:21:12 p. m.  Microsoft-Windows-Kernel-General      
16945 21/02/2020 1:21:13 p. m.  EventLog                              
16946 21/02/2020 1:21:14 p. m.  VBoxNetLwf                            
16947 21/02/2020 1:21:14 p. m.  VBoxNetLwf                            
16948 21/02/2020 1:21:14 p. m.  VBoxNetLwf                            
16949 21/02/2020 1:21:15 p. m.  Microsoft-Windows-Kernel-Boot         
16950 21/02/2020 1:21:15 p. m.  Microsoft-Windows-Kernel-Boot         
16951 21/02/2020 1:21:15 p. m.  Microsoft-Windows-Kernel-Boot         
16952 21/02/2020 1:21:15 p. m.  Microsoft-Windows-Kernel-Boot         
16953 21/02/2020 1:21:15 p. m.  Microsoft-Windows-Kernel-Boot         
16954 21/02/2020 1:21:17 p. m.  Microsoft-Windows-Power-Troubleshooter
16955 21/02/2020 1:21:51 p. m.  Microsoft-Windows-Kernel-Power        
16956 21/02/2020 1:25:48 p. m.  DCOM                                  
16957 21/02/2020 1:25:49 p. m.  DCOM                                  
16958 21/02/2020 1:44:56 p. m.  Service Control Manager               



 
