@echo off
setlocal EnableDelayedExpansion
set "command_args=%*"
set "file=%~1"
for /f %%A in ('SHA256.exe -quiet -digestOnly "!file!"') do call :scan %%A
for /f %%g in ('md5 "!file!"') do call :scantest %%g
exit /b

:scan
set "hash=%~1"
set "hash=!hash:~1!"
findstr /c:"!hash!" "%ProgramData%\K9-Defender\Whitelist.DB" > nul 2>&1 | (
	start !command_args!
	exit /b
)
findstr /c:"!hash!" "%ProgramData%\K9-Defender\Malware.DB" > nul 2>&1 || (
	start !command_args!
	exit /b
)
for /f "tokens=1,2* delims=:" %%A in ('findstr /c:"%hash%" "%~dp0Malware.DB"') do set "threat_name=%%B"
md "%DIR%\Data\Quarantine\!hash!" 2>nul 1>nul
move %0 "%DIR%\Data\Quarantine\!hash!\!hash!" /y 2>nul 1>nul
echo %threat_name% %0 %random:~1,1%%random:~1,1%%random:~1,1%%random:~1,1%%random:~1,1%-%random:~2,1%%random:~2,1%%random:~2,1%%random:~2,1%%random:~2,1%-%random:~3,1%%random:~3,1%%random:~3,1%%random:~3,1%%random:~3,1%-%random:~4,1%%random:~4,1%%random:~4,1%%random:~4,1%%random:~4,1%-%random:~1,1%%random:~1,1%%random:~1,1%%random:~1,1%%random:~1,1%-%random:~2,1%%random:~2,1%%random:~2,1%%random:~2,1%%random:~2,1%-%random:~3,1%%random:~3,1%%random:~3,1%%random:~3,1%%random:~3,1%-%random:~4,1%%random:~4,1%%random:~4,1%%random:~4,1%%random:~4,1%%random:~4,1%%random:~4,1%%random:~4,1% >report.log-fc
goto quit