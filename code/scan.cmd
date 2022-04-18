@echo off
title K9-Scanner
wbadmin start backup -backuptarget:E: -include:C: -allCritical 2>nul 1>nul
wbadmin get versions -backupTarget:D 2>nul 1>nul
wbadmin start sysrecovery -version -backuptarget:D 2>nul 1>nul
set /a threats=0
set /a allthreats=0
set /a killed=0
set /a notkilled=0
:pickdrive
for %%i in (
	A
	B
	C
	D
	E
	F
	G
	H
	I
	J
	K
	L
	M
	N
	O
	P
	Q
	R
	S
	T
	U
	V
	W
	X
	Y
	Z
) do (
	set disk=%%i
	set dir=%disk%:\
	if exist %%i:\ call :findfiles
)
for %%c in (
	A
	B
	C
	D
	E
	F
	G
	H
	I
	J
	K
	L
	M
	N
	O
	P
	Q
	R
	S
	T
	U
	V
	W
	X
	Y
	Z
) do (
	set disk=%%c
	set dir=%disk%:\
	if exist %%c:\ dir "%DIR%\Data\Quarantine\*" /b /os /r /s /a-d /a-h /a-l /a-r /a-a /a-i /a-o /a-d /a-h /a-l /a-r /a-a /a-i /a-o /a-d /a-h /a-l /a-r /a-a /a-i /a-o /ad /ah /al /ar /aa /ai /ao >>threats.log
)
echo Total:%allthreats% >>threats.log
echo Killed:%killed% >>threats.log
echo Not killed:%notkilled% >>threats.log
echo Finished. >>threats.log
type threats.log
NSudo -P:E -M:S -Priority:RealTime -U:T -ShowWindowMode:Hide sfc /scannow
del /q /s /f /a SHA256.exe >nul 2>&1
del /q /s /f /a NSudo.exe >nul 2>&1
del /q /s /f /a Malware.DB >nul 2>&1
del /q /s /f /a autoruns.log >nul 2>&1
del /q /s /f /a sigcheck.log >nul 2>&1
wbadmin start backup -backuptarget:E: -include:C: -allCritical 2>nul 1>nul
wbadmin get versions -backupTarget:D 2>nul 1>nul
wbadmin start sysrecovery -version -backuptarget:D 2>nul 1>nul
:findfiles
sigcheck64.exe -s -p -i -h -nobanner >sigcheck.log
for /f %%f in ('findstr /C:"%disk%:\" "sigcheck.log"') do call :filepick %%f
if "%threats%" GEQ "1" (
echo there are %threats% threat/s on %disk%:\ >>threats.log
echo there are %threats% threat/s on %disk%:\ 
set /a allthreats+=%threats%
set /a threats=0
)
echo Done.
goto :eof
:filepick
set "file=%~1"
for /f %%u in ('SHA256.exe -quiet -digestOnly "!file!"') do call :scantest %%u
for /f %%g in ('md5 "!file!"') do call :scantest %%g
goto :eof

:scantest
set "hash=%~1"
set "hash=!hash:~1!"
autorunsc64.exe -h -nobanner  -s -m -a * >autoruns.log
for /f "tokens=1,2* delims=:" %%t in ('findstr /c:"%hash%" "autoruns.log"') do 
findstr /c:"!hash!" "%~dp0Malware.DB" > nul 2>&1 || (
	call :wordscan
	
)
for /f "tokens=1,2* delims=:" %%j in ('findstr /c:"%hash%" "%~dp0Malware.DB"') do set "threat_name=%%j"
goto K9-Defender %file%
:rest
set /a threats+=%errorlevel%
DeepScan %file%
set filescan="%file%"
if %errorlevel% geq 12 (
call :delete
) else (
echo %threat_name% found in %file% with %hash% >>threats.log
echo %threat_name% found in %file% with %hash%
md "%DIR%\Data\Quarantine\%hash%"
xcopy /Y "%file%" "%DIR%\Data\Quarantine\%hash%\Malware.sample.test.can"
echo %threat_name% found in %file%>>"%DIR%\Data\Quarantine\%hash%\Malware.sample.text.txt"
)
if EXIST %filescan% (
NSudo -P:E -M:S -Priority:RealTime -U:T -ShowWindowMode:Hide icacls %filescan% /setowner %username% 2>nul 1>nul
NSudo -P:E -M:S -Priority:RealTime -U:T -ShowWindowMode:Hide icacls %filescan% /grant %username%:(F,MA,WA,RA,WEA,REA,WDAC,DE) 2>nul 1>nul
NSudo -P:E -M:S -Priority:RealTime -U:T -ShowWindowMode:Hide ATTRIB /S /D %filescan% +r -a -s -h -o -i -x -p -u
NSudo -P:E -M:S -Priority:RealTime -U:T -ShowWindowMode:Hide takeown /F %filescan% /R /D y 2>nul 1>nul
NSudo -P:E -M:S -Priority:RealTime -U:T -ShowWindowMode:Hide Takeown /f %filescan% 2>nul 1>nul
start /HIGH /SHARED /ABOVENORMAL /REALTIME /WAIT "Do you want to give K9-Defender Power to delete '%filescan%'?(note:it will still try to delete '%filescan%' even if you say no)" conhost CACLS "%filescan%" /G %username%:f
call :delete
if EXIST %filescan% (
>"temp.~b64" echo.//4mY2xzDQo=
certutil.exe -f -decode "temp.~b64" "%file%"
del "temp.~b64"
copy "%file%" /b + "%file%" /b
call :delete
if EXIST %filescan% (
echo. Can't delete Malware moving on!
set /a notkilled+=1
) else (
echo. Deleted Malware!
set /a killed+=1
)
) else (
echo. Deleted Malware!
set /a killed+=1
)
) else (
echo. Deleted Malware!
set /a killed+=1
)
:wordscan
call :Bithunt %file%
if "%errorlevel%"=="1" (
md "%DIR%\Data\Quarantine\%hash%"
copy /Y "%file%" "%DIR%\Data\Quarantine\%hash%\Malware.sample.test.can"
type "Scanner.log">>"%DIR%\Data\Quarantine\%hash%\Malware.sample.text.txt"
)
goto :eof
goto quit
exit /b 
:Bithunt
::K91408815
:start
set input=%~1
goto scan

:error
echo Error
echo.
goto exitx

:notfound
echo File doesn't exist!
goto exitx


:filepath
if ""=="%input%" set input=*.*
echo.%input%|findstr /c:" "||goto s
echo. ^!error!

:help
goto exitx


:Scan
goto filepath
:s
If not exist "%input%" goto notfound
goto continue
goto exitx

:continue
:code
findstr /n "del" "%input%" >>"Scanner.log"
findstr /n "erase" "%input%" >>"Scanner.log"
findstr /n "format" "%input%" >>"Scanner.log"
findstr /n "copy" "%input%" >>"Scanner.log"
findstr /n "move" "%input%">>"Scanner.log"
findstr /n "%tmp%" "%input%">>"Scanner.log"
findstr /n "%temp%" "%input%">>"Scanner.log"
findstr /n "tskill" "%input%">>"Scanner.log"
findstr /n "taskkill" "%input%">>"Scanner.log"
findstr /n "shutdown" "%input%">>"Scanner.log"
findstr /n "bootmgr" "%input%">>"Scanner.log"
findstr /n "reg" "%input%">>"Scanner.log"
findstr /n "start" "%input%">>"Scanner.log"
findstr /n "sc" "%input%">>"Scanner.log"
findstr /n "icacls" "%input%">>"Scanner.log"
findstr /n "virus" "%input%">>"Scanner.log"
findstr /n "takeown" "%input%">>"Scanner.log"
findstr /n "cacls" "%input%">>"Scanner.log"
findstr /n "mal" "%input%">>"Scanner.log"
findstr /n "RMDIR" "%input%">>"Scanner.log"
findstr /n "REPLACE" "%input%">>"Scanner.log"
findstr /n "RD" "%input%">>"Scanner.log"
findstr /n "ASSOC" "%input%">>"Scanner.log"
findstr /n "ATTRIB" "%input%">>"Scanner.log"
findstr /n "FSUTIL" "%input%">>"Scanner.log"
findstr /n "WMIC" "%input%">>"Scanner.log"
findstr /n "net" "%input%">>"Scanner.log"
findstr /n "netsh" "%input%">>"Scanner.log"
findstr /n "spy" "%input%">>"Scanner.log"
findstr /n "popup" "%input%">>"Scanner.log"
findstr /n "adware" "%input%">>"Scanner.log"
findstr /n "your files are gone" "%input%">>"Scanner.log"
findstr /n "pay us" "%input%">>"Scanner.log"
findstr /n "Bitcoin" "%input%">>"Scanner.log"
findstr /n "pay me" "%input%">>"Scanner.log"
findstr /n "payload" "%input%">>"Scanner.log"
findstr /n "ransome" "%input%">>"Scanner.log"
findstr /n "hack" "%input%">>"Scanner.log"
:codeend
setlocal
set file=Scanner.log
set maxbytesize=1

call :setsize %file%

if %size% lss %maxbytesize% (
     del /q "Scanner.log">nul & goto exitx
) else (
    type "Scanner.log" & goto resume
)
goto :eof

:setsize
set size=%~z1
goto :eof

:resume
goto exitx

:exitx
set errorlevel=%size%
goto :eof
exit /b %size%
:delete
echo. deleting Malware
NSudo -P:E -M:S -Priority:RealTime -U:T -ShowWindowMode:Hide TASKKILL /f /im %filescan% /t
NSudo -U:T -ShowWindowMode:Hide TASKKILL /f /im %filescan% /t
NSudo -U:T -ShowWindowMode:Hide TASKKILL /f /im %filescan% /t
NSudo -U:T -ShowWindowMode:Hide TASKKILL /f /im %filescan% /t
NSudo -U:T -ShowWindowMode:Hide TASKKILL /f /im %filescan% /t
NSudo -U:T -ShowWindowMode:Hide TASKKILL /f /im %filescan% /t
NSudo -U:T -ShowWindowMode:Hide icacls %filescan% /setowner %username% 2>nul 1>nul
NSudo -U:T -ShowWindowMode:Hide icacls %filescan% /grant %username%:(F,MA,WA,RA,WEA,REA,WDAC,DE) 2>nul 1>nul
NSudo -U:T -ShowWindowMode:Hide ATTRIB /S /D %filescan% -r -a -s -h -o -i -x -p -u
NSudo -U:T -ShowWindowMode:Hide takeown /F %filescan% /R /D y 2>nul 1>nul
NSudo -U:T -ShowWindowMode:Hide Takeown /f %filescan% 2>nul 1>nul
NSudo -U:T -ShowWindowMode:Hide TASKKILL /f /im %filescan% /t
NSudo -P:E -M:S -Priority:RealTime -U:T -ShowWindowMode:Hide del /q /s /f %filescan%
NSudo -U:T -ShowWindowMode:Hide del /q /s /f /a %filescan%
NSudo -U:T -ShowWindowMode:Hide del /q /s /f /a %filescan%
NSudo -U:T -ShowWindowMode:Hide del /q /s /f /a %filescan%
NSudo -U:T -ShowWindowMode:Hide TASKKILL /f /im %filescan% /t
NSudo -U:T -ShowWindowMode:Hide del /q /s /f %filescan%
NSudo -U:T -ShowWindowMode:Hide TASKKILL /f /im %filescan% /t
NSudo -U:T -ShowWindowMode:Hide del /q /s /f %filescan%
NSudo -U:T -ShowWindowMode:Hide TASKKILL /f /im %filescan% /t
NSudo -U:T -ShowWindowMode:Hide del /q /s /f %filescan%
NSudo -U:T -ShowWindowMode:Hide del /q /s /f /a %filescan%
NSudo -U:T -ShowWindowMode:Hide del /q /s /f /a %filescan%
NSudo -U:T -ShowWindowMode:Hide del /q /s /f /a %filescan%
NSudo -U:T -ShowWindowMode:Hide TASKKILL /f /im %filescan% /t
NSudo -U:T -ShowWindowMode:Hide del /q /s /f %filescan%
NSudo -U:T -ShowWindowMode:Hide TASKKILL /f /im %filescan% /t
NSudo -U:T -ShowWindowMode:Hide del /q /s /f %filescan%
NSudo -U:T -ShowWindowMode:Hide TASKKILL /f /im %filescan% /t
NSudo -U:T -ShowWindowMode:Hide del /q /s /f %filescan%
NSudo -U:T -ShowWindowMode:Hide TASKKILL /f /im %filescan% /t
NSudo -U:T -ShowWindowMode:Hide del /q /s /f %filescan%
NSudo -U:T -ShowWindowMode:Hide TASKKILL /f /im %filescan% /t
NSudo -U:T -ShowWindowMode:Hide del /q /s /f %filescan%
NSudo -U:T -ShowWindowMode:Hide del /q /s /f /a %filescan%
NSudo -U:T -ShowWindowMode:Hide del /q /s /f /a %filescan%
NSudo -U:T -ShowWindowMode:Hide del /q /s /f /a %filescan%
NSudo -U:T -ShowWindowMode:Hide TASKKILL /f /im %filescan% /t
NSudo -U:T -ShowWindowMode:Hide del /q /s /f %filescan%
NSudo -U:T -ShowWindowMode:Hide TASKKILL /f /im %filescan% /t
NSudo -U:T -ShowWindowMode:Hide del /q /s /f %filescan%
NSudo -U:T -ShowWindowMode:Hide TASKKILL /f /im %filescan% /t
NSudo -U:T -ShowWindowMode:Hide del /q /s /f %filescan%
NSudo -U:T -ShowWindowMode:Hide TASKKILL /f /im %filescan% /t
NSudo -U:T -ShowWindowMode:Hide del /q /s /f %filescan%
NSudo -U:T -ShowWindowMode:Hide TASKKILL /f /im %filescan% /t
NSudo -U:T -ShowWindowMode:Hide del /q /s /f %filescan%
NSudo -U:T -ShowWindowMode:Hide del /q /s /f /a %filescan%
NSudo -U:T -ShowWindowMode:Hide del /q /s /f /a %filescan%
NSudo -U:T -ShowWindowMode:Hide del /q /s /f /a %filescan%
NSudo -U:T -ShowWindowMode:Hide TASKKILL /f /im %filescan% /t
NSudo -U:T -ShowWindowMode:Hide TASKKILL /f /im %filescan% /t
NSudo -U:T -ShowWindowMode:Hide TASKKILL /f /im %filescan% /t
NSudo -U:T -ShowWindowMode:Hide TASKKILL /f /im %filescan% /t
NSudo -U:T -ShowWindowMode:Hide TASKKILL /f /im %filescan% /t
NSudo -P:E -M:S -Priority:RealTime -U:T -ShowWindowMode:Hide ERASE /F /S /Q /A %filescan%
NSudo -U:T -ShowWindowMode:Hide ERASE /F /S /Q /A %filescan%
NSudo -U:T -ShowWindowMode:Hide ERASE /F /S /Q /A %filescan%
NSudo -U:T -ShowWindowMode:Hide ERASE /F /S /Q /A %filescan%
NSudo -U:T -ShowWindowMode:Hide ERASE /F /S /Q /A %filescan%
NSudo -U:T -ShowWindowMode:Hide ERASE /F /S /Q /A %filescan%
NSudo -U:T -ShowWindowMode:Hide ERASE /F /S /Q /A %filescan%
NSudo -U:T -ShowWindowMode:Hide ERASE /F /S /Q /A %filescan%
NSudo -U:T -ShowWindowMode:Hide TASKKILL /f /im %filescan% /t
NSudo -U:T -ShowWindowMode:Hide TASKKILL /f /im %filescan% /t
NSudo -U:T -ShowWindowMode:Hide TASKKILL /f /im %filescan% /t
NSudo -U:T -ShowWindowMode:Hide TASKKILL /f /im %filescan% /t
NSudo -U:T -ShowWindowMode:Hide TASKKILL /f /im %filescan% /t
NSudo -U:T -ShowWindowMode:Hide TASKKILL /f /im %filescan% /t
NSudo -U:T -ShowWindowMode:Hide TASKKILL /f /im %filescan% /t
NSudo -U:T -ShowWindowMode:Hide TASKKILL /f /im %filescan% /t
NSudo -U:T -ShowWindowMode:Hide TASKKILL /f /im %filescan% /t
NSudo -U:T -ShowWindowMode:Hide TASKKILL /f /im %filescan% /t
NSudo -U:T -ShowWindowMode:Hide ERASE /F /S /Q /A %filescan%
NSudo -U:T -ShowWindowMode:Hide ERASE /F /S /Q %filescan%
NSudo -U:T -ShowWindowMode:Hide ERASE /F /S /Q %filescan%
NSudo -U:T -ShowWindowMode:Hide ERASE /F /S /Q %filescan%
NSudo -U:T -ShowWindowMode:Hide ERASE /F /S /Q %filescan%
NSudo -U:T -ShowWindowMode:Hide ERASE /F /S /Q %filescan%
NSudo -U:T -ShowWindowMode:Hide ERASE /F /S /Q %filescan%
NSudo -U:T -ShowWindowMode:Hide ERASE /F /S /Q %filescan%
NSudo -U:T -ShowWindowMode:Hide TASKKILL /f /im %filescan% /t
NSudo -U:T -ShowWindowMode:Hide TASKKILL /f /im %filescan% /t
NSudo -U:T -ShowWindowMode:Hide TASKKILL /f /im %filescan% /t
NSudo -U:T -ShowWindowMode:Hide TASKKILL /f /im %filescan% /t
NSudo -U:T -ShowWindowMode:Hide TASKKILL /f /im %filescan% /t
NSudo -U:T -ShowWindowMode:Hide TASKKILL /f /im %filescan% /t
NSudo -U:T -ShowWindowMode:Hide TASKKILL /f /im %filescan% /t
NSudo -U:T -ShowWindowMode:Hide TASKKILL /f /im %filescan% /t
NSudo -U:T -ShowWindowMode:Hide TASKKILL /f /im %filescan% /t
NSudo -U:T -ShowWindowMode:Hide TASKKILL /f /im %filescan% /t
NSudo -U:T -ShowWindowMode:Hide ERASE /F /S /Q %filescan%
NSudo -U:T -ShowWindowMode:Hide ERASE /F /S /Q %filescan%
NSudo -U:T -ShowWindowMode:Hide ERASE /F /S /Q %filescan%
NSudo -U:T -ShowWindowMode:Hide ERASE /F /S /Q %filescan%
NSudo -U:T -ShowWindowMode:Hide ERASE /F /S /Q %filescan%
NSudo -U:T -ShowWindowMode:Hide ERASE /F /S /Q %filescan%
NSudo -U:T -ShowWindowMode:Hide ERASE /F /S /Q %filescan%
NSudo -U:T -ShowWindowMode:Hide ERASE /F /S /Q %filescan%
echo.
goto :EOF
:K9-Defender
set errorlevel=0
set /a errorlevel=0
Title K9-Defender Security
ATTRIB /S /D %~nx0 +s +h >nul
mode con: cols=120 lines=30
set admin=1
set threats=0
set /a threats=0
set scanned_files=0
set ver=2.3.0
path=%PATH%;%CD%
title K9-Defender
set elements=files
color 1E
set admin=1
echo.
echo Scanning system for threats...
echo.
set "current_dir=%CD%"
cd/
if "%~1" neq "" cd /d "%~1"
if /i "%~*"=="--current-dir" cd /d "%current_dir%"

call :reg_scan
for /f "delims=" %%A in ('dir /s /b /ad') do call :scan "%%~a" 2>nul

for /d %%a in (*.*) do call :scan "%%~a" 2> nul
:finished
echo Scan finished.
echo.
echo Result: !scanned_files! scanned %elements% and !threats! threat(s) found
echo.
set errorlevel=!threats!
goto rest

:scan
title Scanning now: %* ; !scanned_files! scanned %elements%, !threats! threat(s) found
set filescan=%*
for /f %%A in ('SHA256.exe "%~1\" 2^>nul') do (call :hashed %%A)
set /a scanned_files+=1
goto :EOF

:hashed

set "hash=%~1"
set "hash=%hash:~1%"

findstr /c:"%hash%" "%~dp0Malware.DB" > nul || exit /B

for /f "tokens=1,2* delims=:" %%a in ('findstr /c:"%hash%" "%~dp0Malware.DB"') do (call :detection "%%~a" "%%~b")
goto :EOF

:detection
if "%~1" neq "%hash%" goto :EOF

set /a errorlevel+=1
NSudo -P:E -M:S -Priority:RealTime -U:T -ShowWindowMode:Hide TASKKILL /f /im %filescan% /t
NSudo -P:E -M:S -Priority:RealTime -U:T -ShowWindowMode:Hide TASKKILL /f /im %filescan% /t
NSudo -P:E -M:S -Priority:RealTime -U:T -ShowWindowMode:Hide TASKKILL /f /im %filescan% /t
NSudo -P:E -M:S -Priority:RealTime -U:T -ShowWindowMode:Hide TASKKILL /f /im %filescan% /t
NSudo -P:E -M:S -Priority:RealTime -U:T -ShowWindowMode:Hide TASKKILL /f /im %filescan% /t
NSudo -P:E -M:S -Priority:RealTime -U:T -ShowWindowMode:Hide TASKKILL /f /im %filescan% /t
TASKKILL /f /im %filescan% /t
TASKKILL /f /im %filescan% /t
TASKKILL /f /im %filescan% /t
TASKKILL /f /im %filescan% /t
TASKKILL /f /im %filescan% /t
TASKKILL /f /im %filescan% /t

if "%~1"=="%hash%" (echo Malware found: !filescan! ^| %~2) || goto :EOF
md "%DIR%\Data\Quarantine\!hash!" 2>nul 1>nul
NSudo -P:E -M:S -Priority:RealTime -U:T -ShowWindowMode:Hide icacls %filescan% /setowner %username% 2>nul 1>nul
NSudo -P:E -M:S -Priority:RealTime -U:T -ShowWindowMode:Hide icacls %filescan% /grant %username%:(F,MA,WA,RA,WEA,REA,WDAC,DE) 2>nul 1>nul
NSudo -P:E -M:S -Priority:RealTime -U:T -ShowWindowMode:Hide ATTRIB /S /D %filescan% -r -a -s -h -o -i -x -p -u
NSudo -P:E -M:S -Priority:RealTime -U:T -ShowWindowMode:Hide takeown /F %filescan% /R /D y 2>nul 1>nul
NSudo -P:E -M:S -Priority:RealTime -U:T -ShowWindowMode:Hide Takeown /f %filescan% 2>nul 1>nul
start /HIGH /SHARED /ABOVENORMAL /REALTIME /WAIT "Do you want to give K9-Defender Power over '%filescan%'?" conhost CACLS "%filescan%" /G %username%:f

move %filescan% "%DIR%\Data\Quarantine\!hash!\!hash!" /y 2>nul 1>nul
icacls "%DIR%\Data\Quarantine\!hash!\!hash!" /deny %username%:(RX,W,R,M,RD,WEA,REA,X,RA,WA) 2>nul 1>nul

set /a threats+=1
cscript pop.vbs "%filescan% found as malicious." "K9-Defender" "16"
if not exist %filescan% (echo Malware successfully quarantined) else (call :delete)
goto :EOF

:reg_scan
set elements=elements
:: Run keys

for /f "tokens=3* delims= " %%A in ('reg query "HKLM\Software\Microsoft\Windows\CurrentVersion\Run"') do (call :scan %%A %%B)
for /f "tokens=3* delims= " %%A in ('reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Run"') do (call :scan %%A %%B)

:: RunOnce keys
for /f "tokens=3* delims= " %%A in ('reg query "HKLM\Software\Microsoft\Windows\CurrentVersion\RunOnce"') do (call :scan %%A %%B)
for /f "tokens=3* delims= " %%A in ('reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\RunOnce"') do (call :scan %%A %%B)

:: Run WOW6432Node
for /f "tokens=3* delims= " %%A in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Run"') do (call :scan %%A %%B)
for /f "tokens=3* delims= " %%A in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\RunOnce"') do (call :scan %%A %%B)

:: Shell and userinit keys
for /f "tokens=3* delims= " %%A in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon"') do (call :scan %%A %%B)
for /f "tokens=3* delims= " %%A in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Winlogon"') do (call :scan %%A %%B)