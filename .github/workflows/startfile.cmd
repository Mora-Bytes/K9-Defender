@echo off
setlocal EnableDelayedExpansion
set balloon_notification_timeout=100000
set "command_args=%*"
set "file=%~1"
for /f %%A in ('sha256 "!file!"') do call :scan %%A
exit /b

:scan
set "hash=%~1"
set "hash=!hash:~1!"
findstr /c:"!hash!" "%~dp0DB.txt" > nul 2>&1 || (
	start !command_args!
	exit /b
)
for /f "tokens=1,2* delims=:" %%A in ('findstr /c:"%hash%" "%~dp0DB.txt"') do set "threat_name=%%B"
cscript pop.vbs "%threat_name% found in %file%" "K9-Defender" "16"
hunter %file%
if "%errorlevel%"=="1" cscript pop.vbs "Bad Text found in %file%" "K9-Defender" "16"
K9-Defender %file%
cscript pop.vbs "Done." "K9-Defender" "16"
goto quit