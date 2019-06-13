@echo off

for /f "skip=3 tokens=4" %%i in ('sc query "OracleServiceORCL"') do set "zt=%%i" &goto :next 
:next 
if /i "%zt%"=="RUNNING" ( 
echo ����'OracleServiceORCL'�������� 
) else ( 
echo ����'OracleServiceORCL'��ֹͣ 
)

for /f "skip=3 tokens=4" %%i in ('sc query "OracleOraDb11g_home1TNSListener"') do set "zt=%%i" &goto :next 
:next 
if /i "%zt%"=="RUNNING" ( 
echo ����'OracleOraDb11g_home1TNSListener'�������� 
) else ( 
echo ����'OracleOraDb11g_home1TNSListener'��ֹͣ 
)

for /f "skip=3 tokens=4" %%i in ('sc query "OracleVssWriterORCL"') do set "zt=%%i" &goto :next 
:next 
if /i "%zt%"=="RUNNING" ( 
echo ����'OracleVssWriterORCL'�������� 
) else ( 
echo ����'OracleVssWriterORCL'��ֹͣ 
)

for /f "skip=3 tokens=4" %%i in ('sc query "OracleDBConsoleorcl"') do set "zt=%%i" &goto :next 
:next 
if /i "%zt%"=="RUNNING" ( 
echo ����'OracleDBConsoleorcl'�������� 
) else ( 
echo ����'OracleDBConsoleorcl'��ֹͣ 
)

for /f "skip=3 tokens=4" %%i in ('sc query "OracleJobSchedulerORCL"') do set "zt=%%i" &goto :next 
:next 
if /i "%zt%"=="RUNNING" ( 
echo ����'OracleJobSchedulerORCL'�������� 
) else ( 
echo ����'OracleJobSchedulerORCL'��ֹͣ 
)

for /f "skip=3 tokens=4" %%i in ('sc query "OracleMTSRecoveryService"') do set "zt=%%i" &goto :next 
:next 
if /i "%zt%"=="RUNNING" ( 
echo ����'OracleMTSRecoveryService'�������� 
) else ( 
echo ����'OracleMTSRecoveryService'��ֹͣ 
)

for /f "skip=3 tokens=4" %%i in ('sc query "OracleOraDb11g_home1ClrAgent"') do set "zt=%%i" &goto :next 
:next 
if /i "%zt%"=="RUNNING" ( 
echo ����'OracleOraDb11g_home1ClrAgent'�������� 
) else ( 
echo ����'OracleOraDb11g_home1ClrAgent'��ֹͣ 
)

choice /c:yn /m "����/ֹͣORACLE����[Y����,Nֹͣ]" 
if errorlevel 2 goto stop
if errorlevel 1 goto start

:stop
echo ���ڽ���ȫ��ORACLE����... 
net stop oraclevsswriterorcl
net stop oracledbconsoleorcl
net stop oraclejobschedulerorcl
net stop oraclemtsrecoveryservice
net stop oracleoradb11g_home1clragent
net stop oracleoradb11g_home1tnslistener
net stop oracleserviceorcl
goto end

:start
choice /t 5 /c yn /d y /m ��ѡ���Ƿ�ֻ���ñ�ҪORACLE����,5����Զ�ѡ��Y
if errorlevel 2 goto start_all
if errorlevel 1 goto start_indispensable
goto end

:start_all
echo ��������ȫ��ORACLE����...
net start oracleserviceorcl
net start oracleoradb11g_home1tnslistener
net start oraclevsswriterorcl
net start oracledbconsoleorcl
net start oraclejobschedulerorcl
net start oraclemtsrecoveryservice
net start oracleoradb11g_home1clragent
goto end

:start_indispensable
echo �������ñ�ҪORACLE����...
net start oracleserviceorcl
net start oracledbconsoleorcl
net start oracleoradb11g_home1tnslistener
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