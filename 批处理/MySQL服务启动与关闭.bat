@echo off

for /f "skip=3 tokens=4" %%i in ('sc query "MySQL80"') do set "zt=%%i" &goto :next 
:next 
if /i "%zt%"=="RUNNING" ( 
echo ����MySQL�������� 
) else ( 
echo ����MySQL��ֹͣ 
)

choice /c:12 /m "����/ֹͣMySQL����[1����,2ֹͣ]" 

if errorlevel 2 goto stop
if errorlevel 1 goto start

:stop
echo ���ڽ��÷���... 
net stop MySQL80
goto end

:start
echo �������÷���...
net start MySQL80
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