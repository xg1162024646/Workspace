@echo off

for /f "skip=3 tokens=4" %%i in ('sc query "mssqlserver"') do set "zt=%%i" &goto :next 
:next 
if /i "%zt%"=="RUNNING" ( 
echo 服务'MSSQLSERVER'正在运行 
) else ( 
echo 服务'MSSQLSERVER'已停止 
)

for /f "skip=3 tokens=4" %%i in ('sc query "sqlbrowser"') do set "zt=%%i" &goto :next 
:next 
if /i "%zt%"=="RUNNING" ( 
echo 服务'SQLBROWSER'正在运行 
) else ( 
echo 服务'SQLBROWSER'已停止 
)

for /f "skip=3 tokens=4" %%i in ('sc query "sqlserveragent"') do set "zt=%%i" &goto :next 
:next 
if /i "%zt%"=="RUNNING" ( 
echo 服务'SQLSERVERAGENT'正在运行 
) else ( 
echo 服务'SQLSERVERAGENT'已停止 
)

for /f "skip=3 tokens=4" %%i in ('sc query "mssqlserverolapservice"') do set "zt=%%i" &goto :next 
:next 
if /i "%zt%"=="RUNNING" ( 
echo 服务'MSSQLSERVEROLAPSERVICE'正在运行 
) else ( 
echo 服务'MSSQLSERVEROLAPSERVICE'已停止 
)

for /f "skip=3 tokens=4" %%i in ('sc query "msdtsserver140"') do set "zt=%%i" &goto :next 
:next 
if /i "%zt%"=="RUNNING" ( 
echo 服务'MSDTSSERVER140'正在运行 
) else ( 
echo 服务'MSDTSSERVER140'已停止 
)

for /f "skip=3 tokens=4" %%i in ('sc query "mssqlfdlauncher"') do set "zt=%%i" &goto :next 
:next 
if /i "%zt%"=="RUNNING" ( 
echo 服务'MSSQLFDLAUNCHER'正在运行 
) else ( 
echo 服务'MSSQLFDLAUNCHER'已停止 
)

choice /c:yn /m "启动/停止SQLSERVER服务[Y启动,N停止]" 

if errorlevel 2 goto stop
if errorlevel 1 goto start

:stop
echo 正在禁用全部SQLSERVER服务... 
net stop mssqlfdlauncher
net stop msdtsserver140
net stop mssqlserverolapservice
net stop sqlserveragent
net stop sqlbrowser
net stop mssqlserver
goto end

:start
choice /t 5 /c yn /d y /m 请输入1启动必要SQLSERVER服务,2启动全部SQLSERVER服务，否则5秒后自动选择启动必要服务
if errorlevel 2 goto start_all
if errorlevel 1 goto start_indispensable
goto end

:start_all
echo 正在启用全部SQLSERVER服务...
net start mssqlserver
net start sqlbrowser
net start sqlserveragent
net start mssqlserverolapservice
net start msdtsserver140
net start mssqlfdlauncher
goto end

:start_indispensable
echo 正在启用必要SQLSERVER服务...
net start mssqlserver
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