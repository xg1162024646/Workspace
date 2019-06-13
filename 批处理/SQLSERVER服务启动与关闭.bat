@echo off

for /f "skip=3 tokens=4" %%i in ('sc query "mssqlserver"') do set "zt=%%i" &goto :next 
:next 
if /i "%zt%"=="RUNNING" ( 
echo ����'MSSQLSERVER'�������� 
) else ( 
echo ����'MSSQLSERVER'��ֹͣ 
)

for /f "skip=3 tokens=4" %%i in ('sc query "sqlbrowser"') do set "zt=%%i" &goto :next 
:next 
if /i "%zt%"=="RUNNING" ( 
echo ����'SQLBROWSER'�������� 
) else ( 
echo ����'SQLBROWSER'��ֹͣ 
)

for /f "skip=3 tokens=4" %%i in ('sc query "sqlserveragent"') do set "zt=%%i" &goto :next 
:next 
if /i "%zt%"=="RUNNING" ( 
echo ����'SQLSERVERAGENT'�������� 
) else ( 
echo ����'SQLSERVERAGENT'��ֹͣ 
)

for /f "skip=3 tokens=4" %%i in ('sc query "mssqlserverolapservice"') do set "zt=%%i" &goto :next 
:next 
if /i "%zt%"=="RUNNING" ( 
echo ����'MSSQLSERVEROLAPSERVICE'�������� 
) else ( 
echo ����'MSSQLSERVEROLAPSERVICE'��ֹͣ 
)

for /f "skip=3 tokens=4" %%i in ('sc query "msdtsserver140"') do set "zt=%%i" &goto :next 
:next 
if /i "%zt%"=="RUNNING" ( 
echo ����'MSDTSSERVER140'�������� 
) else ( 
echo ����'MSDTSSERVER140'��ֹͣ 
)

for /f "skip=3 tokens=4" %%i in ('sc query "mssqlfdlauncher"') do set "zt=%%i" &goto :next 
:next 
if /i "%zt%"=="RUNNING" ( 
echo ����'MSSQLFDLAUNCHER'�������� 
) else ( 
echo ����'MSSQLFDLAUNCHER'��ֹͣ 
)

choice /c:yn /m "����/ֹͣSQLSERVER����[Y����,Nֹͣ]" 

if errorlevel 2 goto stop
if errorlevel 1 goto start

:stop
echo ���ڽ���ȫ��SQLSERVER����... 
net stop mssqlfdlauncher
net stop msdtsserver140
net stop mssqlserverolapservice
net stop sqlserveragent
net stop sqlbrowser
net stop mssqlserver
goto end

:start
choice /t 5 /c yn /d y /m ������1������ҪSQLSERVER����,2����ȫ��SQLSERVER���񣬷���5����Զ�ѡ��������Ҫ����
if errorlevel 2 goto start_all
if errorlevel 1 goto start_indispensable
goto end

:start_all
echo ��������ȫ��SQLSERVER����...
net start mssqlserver
net start sqlbrowser
net start sqlserveragent
net start mssqlserverolapservice
net start msdtsserver140
net start mssqlfdlauncher
goto end

:start_indispensable
echo �������ñ�ҪSQLSERVER����...
net start mssqlserver
goto end

:end
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