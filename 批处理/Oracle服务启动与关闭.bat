@echo off

for /f "skip=3 tokens=4" %%i in ('sc query "OracleServiceORCL"') do set "zt=%%i" &goto :next 
:next 
if /i "%zt%"=="RUNNING" ( 
echo 服务'OracleServiceORCL'正在运行 
) else ( 
echo 服务'OracleServiceORCL'已停止 
)

for /f "skip=3 tokens=4" %%i in ('sc query "OracleOraDb11g_home1TNSListener"') do set "zt=%%i" &goto :next 
:next 
if /i "%zt%"=="RUNNING" ( 
echo 服务'OracleOraDb11g_home1TNSListener'正在运行 
) else ( 
echo 服务'OracleOraDb11g_home1TNSListener'已停止 
)

for /f "skip=3 tokens=4" %%i in ('sc query "OracleVssWriterORCL"') do set "zt=%%i" &goto :next 
:next 
if /i "%zt%"=="RUNNING" ( 
echo 服务'OracleVssWriterORCL'正在运行 
) else ( 
echo 服务'OracleVssWriterORCL'已停止 
)

for /f "skip=3 tokens=4" %%i in ('sc query "OracleDBConsoleorcl"') do set "zt=%%i" &goto :next 
:next 
if /i "%zt%"=="RUNNING" ( 
echo 服务'OracleDBConsoleorcl'正在运行 
) else ( 
echo 服务'OracleDBConsoleorcl'已停止 
)

for /f "skip=3 tokens=4" %%i in ('sc query "OracleJobSchedulerORCL"') do set "zt=%%i" &goto :next 
:next 
if /i "%zt%"=="RUNNING" ( 
echo 服务'OracleJobSchedulerORCL'正在运行 
) else ( 
echo 服务'OracleJobSchedulerORCL'已停止 
)

for /f "skip=3 tokens=4" %%i in ('sc query "OracleMTSRecoveryService"') do set "zt=%%i" &goto :next 
:next 
if /i "%zt%"=="RUNNING" ( 
echo 服务'OracleMTSRecoveryService'正在运行 
) else ( 
echo 服务'OracleMTSRecoveryService'已停止 
)

for /f "skip=3 tokens=4" %%i in ('sc query "OracleOraDb11g_home1ClrAgent"') do set "zt=%%i" &goto :next 
:next 
if /i "%zt%"=="RUNNING" ( 
echo 服务'OracleOraDb11g_home1ClrAgent'正在运行 
) else ( 
echo 服务'OracleOraDb11g_home1ClrAgent'已停止 
)

choice /c:yn /m "启动/停止ORACLE服务[Y启动,N停止]" 
if errorlevel 2 goto stop
if errorlevel 1 goto start

:stop
echo 正在禁用全部ORACLE服务... 
net stop oraclevsswriterorcl
net stop oracledbconsoleorcl
net stop oraclejobschedulerorcl
net stop oraclemtsrecoveryservice
net stop oracleoradb11g_home1clragent
net stop oracleoradb11g_home1tnslistener
net stop oracleserviceorcl
goto end

:start
choice /t 5 /c yn /d y /m 请选择是否只启用必要ORACLE服务,5秒后自动选择Y
if errorlevel 2 goto start_all
if errorlevel 1 goto start_indispensable
goto end

:start_all
echo 正在启用全部ORACLE服务...
net start oracleserviceorcl
net start oracleoradb11g_home1tnslistener
net start oraclevsswriterorcl
net start oracledbconsoleorcl
net start oraclejobschedulerorcl
net start oraclemtsrecoveryservice
net start oracleoradb11g_home1clragent
goto end

:start_indispensable
echo 正在启用必要ORACLE服务...
net start oracleserviceorcl
net start oracledbconsoleorcl
net start oracleoradb11g_home1tnslistener
goto end

:end
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