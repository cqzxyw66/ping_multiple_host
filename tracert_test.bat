@echo off
@echo ----------------------------------------------------
@echo.
@echo Author yangwei(279066310@qq.com) at 20200817
@echo.
@echo If wana stop, press ctrl+c 
@echo.   
@echo �����������˼·:https://www.cnblogs.com/s
@echo u-root/p/11135458.html
@echo ----------------------------------------------------
setlocal ENABLEDELAYEDEXPANSION

set log_tracert=log_tracert.log
echo ������ 10.208.1.104,www.sina.com һ���ĸ�ʽ, �ö��Ų��ո�����������, ���������֧��10������
set /p host=������Ҫ���Ե�IP��ַ������:
echo target host = %host% >%log_tracert%
echo Network test is now starting

FOR /F "tokens=1-10 delims= " %%i IN ('echo %host%') DO (
    set host[0].ippa=%%i 
    set host[1].ippa=%%j 
    set host[2].ippa=%%k 
    set host[3].ippa=%%l 
    set host[4].ippa=%%m 
    set host[5].ippa=%%n 
    set host[6].ippa=%%o 
    set host[7].ippa=%%p 
    set host[8].ippa=%%q 
    set host[9].ippa=%%r 
)

:setset
set index=0

:tracerttracert
FOR /F "delims== tokens=1-3 " %%a IN ('set host[%index%]') DO (
    set host_qq=%%b
)

IF "%host_qq%"==" " (
    GOTO setset 
)

echo %date% %time:~0,8% 
echo %date% %time:~0,8% >>%log_tracert%
FOR /F "tokens=* " %%A IN ('tracert /d /w 1000 %host_qq%') DO (
    echo %%A 
    echo %%A >>%log_tracert%
)
set /a index+=1
echo.
echo ---------------------------------------------------- >>%log_tracert%
GOTO tracerttracert

endlocal