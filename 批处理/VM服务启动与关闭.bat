@echo off

 for /f "skip=3 tokens=4" %%i in ('sc query "VMAuthdService"') do set "zt=%%i" &goto :next 

 :next 

 if /i "%zt%"=="RUNNING" ( 

 echo 服务VMware Authorization Service正在运行 

 ) else ( 

 echo 服务VMware Authorization Service已停止 

 ) 

 for /f "skip=3 tokens=4" %%i in ('sc query "VMnetDHCP"') do set "zt=%%i" &goto :next 

 :next 

 if /i "%zt%"=="RUNNING" ( 

 echo 服务VMware DHCP Service正在运行 

 ) else ( 

 echo 服务VMware DHCP Service已停止 

 ) 

 for /f "skip=3 tokens=4" %%i in ('sc query "VMware NAT Service"') do set "zt=%%i" &goto :next 

 :next 

 if /i "%zt%"=="RUNNING" ( 

 echo 服务VMware NAT Service正在运行 

 ) else ( 

 echo 服务VMware NAT Service已停止 

 ) 

 for /f "skip=3 tokens=4" %%i in ('sc query "VMUSBArbService"') do set "zt=%%i" &goto :next 

 :next 

 if /i "%zt%"=="RUNNING" ( 

 echo 服务VMware USB Arbitration Service正在运行 

 ) else ( 

 echo 服务VMware USB Arbitration Service已停止 

 ) 

 for /f "skip=3 tokens=4" %%i in ('sc query "VMwareHostd"') do set "zt=%%i" &goto :next 

 :next 

 if /i "%zt%"=="RUNNING" ( 

 echo 服务VMware Workstation Server正在运行 

 ) else ( 

 echo 服务VMware Workstation Server已停止 

 ) 

 choice /c:12 /m "启动/停止VM虚拟机服务及网络连接[1启动,2停止]" 

 if errorlevel 2 goto two 

 if errorlevel 1 goto one 

 :one 

 echo 正在启用服务... 

 net start "VMnetDHCP" 

 net start "VMware NAT Service" 

 net start "VMUSBArbService" 

 net start "VMAuthdService" 

 net start "VMwareHostd" 

 echo 正在启用网络连接... 

 netsh interface set interface "VMware Network Adapter VMnet1" enable 

 netsh interface set interface "VMware Network Adapter VMnet8" enable 

 echo 网络连接VMware Network Adapter VMnet1、VMware Network Adapter VMnet8启动成功 

 choice /c:12 /m " 是否启动VMware Workstations...[1是,2否]" 

 if errorlevel 2 exit 

 if errorlevel 1 start "" "D:\Program Files\VMware\VMware Workstation\vmware.exe"

 >nul

 :two 

 echo 正在禁用服务... 

 net stop "VMwareHostd" 

 net stop "VMnetDHCP" 

 net stop "VMware NAT Service" 

 net stop "VMUSBArbService" 

 net stop "VMAuthdService" 

 echo 正在禁用网络连接... 

 netsh interface set interface "VMware Network Adapter VMnet1" disable 

 netsh interface set interface "VMware Network Adapter VMnet8" disable 

 echo 网络连接VMware Network Adapter VMnet1、VMware Network Adapter VMnet8禁用成功 

 ::echo 按任意键退出... 
 
 ::pause>nul 
 
 ::exit 
 echo 谢谢使用，3秒后将自动关闭
 ping -n 1 127.1>nul
 echo 3...
 ping -n 2 127.1>nul
 echo 2...
 ping -n 3 127.1>nul
 echo 1...