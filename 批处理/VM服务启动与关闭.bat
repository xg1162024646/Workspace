@echo off

 for /f "skip=3 tokens=4" %%i in ('sc query "VMAuthdService"') do set "zt=%%i" &goto :next 

 :next 

 if /i "%zt%"=="RUNNING" ( 

 echo ����VMware Authorization Service�������� 

 ) else ( 

 echo ����VMware Authorization Service��ֹͣ 

 ) 

 for /f "skip=3 tokens=4" %%i in ('sc query "VMnetDHCP"') do set "zt=%%i" &goto :next 

 :next 

 if /i "%zt%"=="RUNNING" ( 

 echo ����VMware DHCP Service�������� 

 ) else ( 

 echo ����VMware DHCP Service��ֹͣ 

 ) 

 for /f "skip=3 tokens=4" %%i in ('sc query "VMware NAT Service"') do set "zt=%%i" &goto :next 

 :next 

 if /i "%zt%"=="RUNNING" ( 

 echo ����VMware NAT Service�������� 

 ) else ( 

 echo ����VMware NAT Service��ֹͣ 

 ) 

 for /f "skip=3 tokens=4" %%i in ('sc query "VMUSBArbService"') do set "zt=%%i" &goto :next 

 :next 

 if /i "%zt%"=="RUNNING" ( 

 echo ����VMware USB Arbitration Service�������� 

 ) else ( 

 echo ����VMware USB Arbitration Service��ֹͣ 

 ) 

 for /f "skip=3 tokens=4" %%i in ('sc query "VMwareHostd"') do set "zt=%%i" &goto :next 

 :next 

 if /i "%zt%"=="RUNNING" ( 

 echo ����VMware Workstation Server�������� 

 ) else ( 

 echo ����VMware Workstation Server��ֹͣ 

 ) 

 choice /c:12 /m "����/ֹͣVM�����������������[1����,2ֹͣ]" 

 if errorlevel 2 goto two 

 if errorlevel 1 goto one 

 :one 

 echo �������÷���... 

 net start "VMnetDHCP" 

 net start "VMware NAT Service" 

 net start "VMUSBArbService" 

 net start "VMAuthdService" 

 net start "VMwareHostd" 

 echo ����������������... 

 netsh interface set interface "VMware Network Adapter VMnet1" enable 

 netsh interface set interface "VMware Network Adapter VMnet8" enable 

 echo ��������VMware Network Adapter VMnet1��VMware Network Adapter VMnet8�����ɹ� 

 choice /c:12 /m " �Ƿ�����VMware Workstations...[1��,2��]" 

 if errorlevel 2 exit 

 if errorlevel 1 start "" "D:\Program Files\VMware\VMware Workstation\vmware.exe"

 >nul

 :two 

 echo ���ڽ��÷���... 

 net stop "VMwareHostd" 

 net stop "VMnetDHCP" 

 net stop "VMware NAT Service" 

 net stop "VMUSBArbService" 

 net stop "VMAuthdService" 

 echo ���ڽ�����������... 

 netsh interface set interface "VMware Network Adapter VMnet1" disable 

 netsh interface set interface "VMware Network Adapter VMnet8" disable 

 echo ��������VMware Network Adapter VMnet1��VMware Network Adapter VMnet8���óɹ� 

 ::echo ��������˳�... 
 
 ::pause>nul 
 
 ::exit 
 echo ллʹ�ã�3����Զ��ر�
 ping -n 1 127.1>nul
 echo 3...
 ping -n 2 127.1>nul
 echo 2...
 ping -n 3 127.1>nul
 echo 1...