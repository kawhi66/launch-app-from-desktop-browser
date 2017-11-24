@echo off
rem if exist metro.bat exit

cd /d %~dp0
setlocal enabledelayedexpansion
set "metroPath=%~dp0"
set "sydqs=%metroPath%\SYDQS.txt"
set "data=%metroPath%\js\data.js"
set "pre=SYDQSplus"
set /a count=0
set /a delCount=0

rem ��ʼ��
if exist "SYDQS.txt" (
	FOR /F "delims=" %%i IN (%sydqs%) DO (
		REG DELETE HKCR\%pre%!delCount! /f
		set /a delCount+=1
	)

	DEL %sydqs%
	DEL %data%
	echo ע����������
	pause
)

set /p "targetPath=������һ������·��="
@dir /s /b "%targetPath%\*.exe" > %sydqs%
echo �������
pause

for /f "tokens=2 delims=:" %%a in ('find /c /v "" SYDQS.txt') do set /a lineLength=%%a+0
set /a lineLength-=1
echo localSet={ > %data%

rem ���򵽹���ԱĿ¼
cd /d C:\Windows\System32

FOR /F "delims=" %%i IN (%sydqs%) DO (
	set "file=%%~ni"
	if !lineLength!==!count! (
		echo "!file!": "%pre%!count!" >> %data%
	)else echo "!file!": "%pre%!count!", >> %data%

	reg add HKCR\%pre%!count! /v "URL Protocol" /f
	REG ADD HKCR\%pre%!count!\DefaultIcon /d "%%i" /f
	REG ADD HKCR\%pre%!count!\shell\open\command /d "%%i" /f
	set /a count+=1

	rem pause
)

echo } >> %data%