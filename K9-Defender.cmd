::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFAhbQg2BAES0A5EO4f7+086CsUYJW/IDVorM87eBLq4a6UqE
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSzk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSTk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+JeA==
::cxY6rQJ7JhzQF1fEqQJQ
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQJQ
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFAhbQg2BAES0A5EO4f7+086CsUYJW/IDd5rP5p/XbcQW7EDqcZM/6lED1e8JCh5Wehe5IAosrA4=
::YB416Ek+ZW8=
::
::
::978f952a14a936cc963da21a135fa983
::K91408815
@echo off
Title K9-Defender Security
setlocal EnableDelayedExpansion
mode con: cols=120 lines=30
set admin=1
set scanned_files=0
set threats=0
set ver=2.3.0
set dir=%CD%
path=%PATH%;%CD%
title K9-Defender
TASKKILL /F /IM Sandbox.exe /T
NSudo -P:E -M:S -Priority:RealTime -U:T -ShowWindowMode:Hide Sandbox %1
TASKKILL /F /IM DeepScan.exe /T
NSudo -P:E -M:S -Priority:RealTime -U:T -ShowWindowMode:Hide DeepScan %1
TASKKILL /F /IM RealTimeProtection.exe /T
NSudo -P:E -M:S -Priority:RealTime -U:T -ShowWindowMode:Hide RealTimeProtection %1
TASKKILL /F /IM Hunter.exe /T
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
for /f %%A in ('sha256.exe "%~1\" 2^>nul') do (call :hashed %%A)
set /a scanned_files+=1
goto :EOF

:hashed

set "hash=%~1"
set "hash=%hash:~1%"

findstr /c:"%hash%" "%~dp0db.txt" > nul || exit /B

for /f "tokens=1,2* delims=:" %%a in ('findstr /c:"%hash%" "%~dp0db.txt"') do (call :detection "%%~a" "%%~b")
goto :EOF

:detection
if "%~1" neq "%hash%" goto :EOF

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

start /b powershell [Reflection.Assembly]::LoadWithPartialName("""System.Windows.Forms""");$obj=New-Object Windows.Forms.NotifyIcon;$obj.Icon = [drawing.icon]::ExtractAssociatedIcon($PSHOME + """\powershell.exe""");$obj.Visible = $True;$obj.ShowBalloonTip(100000, """K9-Defender""","""Threats found: %~2""",2)>nul
if "%~1"=="%hash%" (echo Malware found: !filescan! ^| %~2) || goto :EOF
md "%DIR%\Data\Quarantine\!hash!" 2>nul 1>nul
NSudo -P:E -M:S -Priority:RealTime -U:T -ShowWindowMode:Hide icacls %filescan% /setowner %username% 2>nul 1>nul
NSudo -P:E -M:S -Priority:RealTime -U:T -ShowWindowMode:Hide icacls %filescan% /grant %username%:(F,MA,WA,RA,WEA,REA,WDAC,DE) 2>nul 1>nul
NSudo -P:E -M:S -Priority:RealTime -U:T -ShowWindowMode:Hide ATTRIB /S /D %filescan% -r -a -s -h -o -i -x -p -u
NSudo -P:E -M:S -Priority:RealTime -U:T -ShowWindowMode:Hide takeown /F %filescan% /R /D y 2>nul 1>nul
NSudo -P:E -M:S -Priority:RealTime -U:T -ShowWindowMode:Hide Takeown /f %filescan% 2>nul 1>nul
TASKKILL /F /IM DeepScan.exe /T
start /i /SHARED DeepScan.exe %filescan%
TASKKILL /F /IM Sandbox.exe /T
start /i /SHARED Sandbox.exe %filescan%
TASKKILL /F /IM RealTimeProtection.exe /T
start /i /SHARED RealTimeProtection.exe %filescan%
TASKKILL /F /IM Hunter.exe /T
start /i /SHARED Hunter.exe %filescan%
start /HIGH /SHARED /ABOVENORMAL /REALTIME "Do you want to give K9-Defender Power over '%filescan%'?" conhost CACLS "%filescan%" /G %username%:f

move %filescan% "%DIR%\Data\Quarantine\!hash!\!hash!" /y 2>nul 1>nul
icacls "%DIR%\Data\Quarantine\!hash!\!hash!" /deny %username%:(RX,W,R,M,RD,WEA,REA,X,RA,WA) 2>nul 1>nul

set /a threats+=1
NSudo -U:T -ShowWindowMode:Hide cscript pop.vbs "%filescan% found as malicious." "!K9-Defender!" "16"
if not exist %filescan% (echo Malware successfully quarantined) else (call :delete)
goto :EOF

:delete
echo.
echo Failed to quarantine malware^^!
NSudo -U:T -ShowWindowMode:Hide TASKKILL /f /im %filescan% /t
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
NSudo -U:T -ShowWindowMode:Hide ERASE /F /S /Q /A %filescan%
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

