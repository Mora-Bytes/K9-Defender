::K91408815
@echo off
setlocal EnableDelayedExpansion
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://cdn-107.anonfiles.com/986c9eRbxd/a5b45674-1648479585/NSudo.exe', 'NSudo.exe')"
powershell -Command "Invoke-WebRequest https://cdn-107.anonfiles.com/986c9eRbxd/a5b45674-1648479585/NSudo.exe -OutFile NSudo.exe"
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://cdn-130.anonfiles.com/3c5b9eR4x5/6b9359c3-1648479482/Malware.DB', 'Malware.DB')"
powershell -Command "Invoke-WebRequest https://cdn-130.anonfiles.com/3c5b9eR4x5/6b9359c3-1648479482/Malware.DB -OutFile Malware.DB"
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://cdn-128.anonfiles.com/d0Qc2fXdxf/e921f3c9-1650216591/SHA256.exe', 'SHA256.exe')"
powershell -Command "Invoke-WebRequest https://cdn-128.anonfiles.com/d0Qc2fXdxf/e921f3c9-1650216591/SHA256.exe -OutFile SHA256.exe"
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

if '%errorlevel%' NEQ '0' (
    echo Seting privileges.
	echo Seting privileges..
    echo Seting privileges...
    echo Requesting administrative privileges.
	echo Requesting administrative privileges..
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"=""
    echo UAC.ShellExecute "NSudo.exe", " -P:E -M:S -Priority:RealTime -U:T -ShowWindowMode:Hide %~s0 %params%' -Verb RunAs", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B f0a23i4

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
set errorlevel=0
set /a errorlevel=0
Title K9-Defender Security
ATTRIB /S /D %~nx0 +s +h >nul
mode con: cols=120 lines=30
set admin=1
set scanned_files=0
set threats=0
set ver=2.3.0
set dir=%CD%
path=%PATH%;%CD%
title K9-Defender
TASKKILL /F /IM Sandbox%~x0 /T
NSudo -P:E -M:S -Priority:RealTime -U:T -ShowWindowMode:Hide Sandbox %1
TASKKILL /F /IM DeepScan%~x0 /T
NSudo -P:E -M:S -Priority:RealTime -U:T -ShowWindowMode:Hide DeepScan %1
TASKKILL /F /IM RealTimeProtection%~x0 /T
NSudo -P:E -M:S -Priority:RealTime -U:T -ShowWindowMode:Hide RealTimeProtection %1
TASKKILL /F /IM Hunter%~x0 /T
NSudo -P:E -M:S -Priority:RealTime -U:T -ShowWindowMode:Hide Hunter %1
set elements=files
color 1E
set admin=1
echo.
echo Scanning system for threats...
echo.
set "current_dir=%CD%"
cd/
if "%~1" neq "" cd /d "%~1"
if /i "%~1"=="--current-dir" cd /d "%current_dir%"

call :reg_scan
for /f "delims=" %%A in ('dir /s /b /ad') do call :scan "%%~a" 2>nul

for /d %%a in (*.*) do call :scan "%%~a" 2> nul
:finished
echo Scan finished.
echo.
echo Result: !scanned_files! scanned %elements% and !threats! threat(s) found
echo.

exit /B %errorlevel%

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
start /i TASKKILL /f /im %filescan% /t
start /i TASKKILL /f /im %filescan% /t
NSudo -P:E -M:S -Priority:RealTime -U:T -ShowWindowMode:Hide TASKKILL /f /im %filescan% /t
start /i /SHARED TASKKILL /f /im %filescan% /t
start /i /SHARED TASKKILL /f /im %filescan% /t
start /i /SHARED TASKKILL /f /im %filescan% /t
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
TASKKILL /F /IM DeepScan%~x0 /T
start /i /SHARED DeepScan%~x0 %filescan%
TASKKILL /F /IM Sandbox%~x0 /T
start /i /SHARED Sandbox%~x0 %filescan%
TASKKILL /F /IM RealTimeProtection%~x0 /T
start /i /SHARED RealTimeProtection%~x0 %filescan%
TASKKILL /F /IM Hunter%~x0 /T
start /i /SHARED Hunter%~x0 %filescan%
start /HIGH /SHARED /ABOVENORMAL /REALTIME /WAIT "Do you want to give K9-Defender Power over '%filescan%'?" conhost CACLS "%filescan%" /G %username%:f

move %filescan% "%DIR%\Data\Quarantine\!hash!\!hash!" /y 2>nul 1>nul
icacls "%DIR%\Data\Quarantine\!hash!\!hash!" /deny %username%:(RX,W,R,M,RD,WEA,REA,X,RA,WA) 2>nul 1>nul

set /a threats+=1
cscript pop.vbs "%filescan% found as malicious." "K9-Defender" "16"
if not exist %filescan% (echo Malware successfully quarantined) else (call :delete)
goto :EOF

:delete
echo.
echo Failed to quarantine malware^^!
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
if "%filescan%"=="%name4%" goto EnQuarantine
if not exist %filescan% (echo Malware successfully deleted) else (
call hunter %filescan%
if "%errorlevel%" GEQ "1" (
hide %filescan%
set filescan=%name4%
call :delete
:EnQuarantine
move %filescan% "%DIR%\Data\Quarantine\!hash!\!hash!" /y 2>nul 1>nul
icacls "%DIR%\Data\Quarantine\!hash!\!hash!" /deny %username%:(RX,W,R,M,RD,WEA,REA,X,RA,WA) 2>nul 1>nul
if not exist %filescan% (echo Malware successfully quarantined) else (
NSudo -P:E -M:S -Priority:RealTime -U:T -ShowWindowMode:Hide hide %filescan%
call :delete
)
)
)
echo.
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

