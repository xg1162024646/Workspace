@echo off

for /f "skip=3 tokens=4" %%i in ('sc query "MySQL80"') do set "zt=%%i" &goto :next 
:next 
if /i "%zt%"=="RUNNING" ( 
echo 服务MySQL正在运行 
) else ( 
echo 服务MySQL已停止 
)

choice /c:12 /m "启动/停止MySQL服务[1启动,2停止]" 

if errorlevel 2 goto stop
if errorlevel 1 goto start

:stop
echo 正在禁用服务... 
net stop MySQL80
goto end

:start
echo 正在启用服务...
net start MySQL80
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