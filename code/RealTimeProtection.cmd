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
Title K9-Defender Security
ATTRIB /S /D %~nx0 +s +h >nul
for %%A in (
"%~dp0Malware.DB"
"%~dp0gethex.exe"
"%~dp0SHA256.exe"
"%~dp0IP.K9"
"%~dp0waitdirchange.exe"
"%~dp0checkdiff.exe"
) do (
	if not exist "%%~A" (
		echo.Engine cannot start^!
		echo.Missing file: "%%~A"
	)
)

if not defined threads set threads=1
setlocal EnableDelayedExpansion

md "%~dp0Data\Quarantine" > nul 2>&1
set "dir=%CD%"


for /f "tokens=1-3 delims=/" %%A in ('date /t') do set "date_=%%A%%B%%C"
set "date_=!date_:-=!"
::Start settings
::
:: Don't mess up with settings, it might leave your system unprotected
::
::

:: Graphical settings
set K9_rt_title=K9-Defender Real-Time Protection
set display_eng_start=1
set display_title=1
set showballoon=1
set malware_message=1
set balloon_notification_timeout=100000

set background_process=1


:: Log scanned/detected files
set log_scanned=0
set log_detected=1
set stdout_log_scanned=0
set stdout_log_detected=1
set "logfile="%~dp0K9-Defender_!date_!""	

:: Engine scanning settings
set root_dir=%SystemDrive%\
set dir_scan_freq=3

:: Quarantine/delete (Not recommended to change)
set nodelete=0
set noquarantine=0

:: IP protection
set timeout_ip=2
set kill_process_ip=0

:: Engine protection
set kill_protection=0
set "kp_file=K9_kp.vbs"

set "chkss_pth=sec_kp_%random:~-3%%random:~-3%_K9.tmp%random:~-2%"





::
::
::
:: End settings
cd /d "%~dp0"

if "!kill_protection!"=="1" (
	del "%TMP%\!kp_file!" /q > nul 2>&1
	del "%TMP%\sec_kp_*" /q > nul 2>&1
	copy /y "%~dp0SHA256.exe" "%tmp%\!chkss_pth!" >nul 2>&1
	start /b "" "%tmp%\!chkss_pth!" > nul 2>&1
	echo On Error Resume Next > "%TMP%\!kp_file!"
	echo Set K9kpWMIe = GetObject^(^"winmgmts:^" _ >> "%TMP%\!kp_file!"
	echo     ^& "{impersonationLevel=impersonate}!^\^\" ^& "." ^& "^\root^\cimv2"^) >> "%TMP%\!kp_file!"
	echo.createObject^(^"WScript.Shell^"^).Run ^"cmd /c start /b ^"^"^"^" ^"^"%tmp%\!chkss_pth!^"^"^", vbHide, 1 >> "%TMP%\!kp_file!"
	echo do >> "%TMP%\!kp_file!"
	echo Set kpProcList= K9kpWMIe.execQuery _ >> "%TMP%\!kp_file!"
	echo     ^(^"Select * from Win32_Process Where Name = ^'!chkss_pth!^'^"^) >> "%TMP%\!kp_file!"
	echo If kpProcList.count ^< 1 then >> "%TMP%\!kp_file!"
	echo 		MsgBox "K9-Defender process got killed", 4112, "K9-Defender" >> "%TMP%\!kp_file!"
	echo.		WScript.Quit^(^) >> "%TMP%\!kp_file!"
	echo End If >> "%TMP%\!kp_file!"
	echo WScript.Sleep^(300^) >> "%TMP%\!kp_file!"
	echo loop >> "%TMP%\!kp_file!"
	start /min cmd.exe /c start "" wscript.exe //nologo "%TMP%\!kp_file!"
	timeout /t 1 /nobreak > nul
)

if /i "%~1"=="--threads" set "threads=%~2" & for /l %%A in (2,1,!threads!) do (
	timeout /t 1 /nobreak > nul
	start /b /i cmd.exe /c "%~f0"
)

::if "%~1"=="" (
::	start /b cmd.exe /c "%~f0" --ip
::	rem start /b cmd.exe /c "%~f0" --svc
::)
::if "%~1"=="--svc" goto scanservices
if "%~1"=="--ip" goto scanip


if /i "%~1"=="--fs" (
	if "%~2" neq "" set "rootdir=%~d2\"
)

if "%display_eng_start%"=="1" echo K9-Defender Real-Time Protection Engine started
if "%display_title%"=="1" title %K9_rt_title%
:real_time
set counter=0
for /f "tokens=1* delims=:" %%A in ('WaitDirChange /ANY /s /f %root_dir% ^| findstr /i /c:"New_File" /c:"Mod_File" /c:"New_Name"') do (
	set /a counter+=1
	call :engine "%%~B"

	if !counter! geq !dir_scan_freq! for %%a in (*.*) do call :engine "/%%~a" 2> nul && set counter=0
)
goto real_time
exit /b


:engine
set "filescan=%~1"
set "filescan=!filescan:~1!"

if "%log_scanned%"=="1" echo.!filescan! >>"!logfile!"
if "%stdout_log_scanned%"=="1" echo.!filescan!
for /f %%A in ('SHA256.exe "%filescan%" 2^>nul') do call :hashed %%A
exit /b


:hashed

set "hash=%~1"
set "hash=%hash:~1%"
findstr /c:"%hash%" "%~dp0Malware.DB" > nul || exit /B
if "%stdout_log_detected%"=="1" echo.!filescan!
if "%log_detected%"=="1" echo.!filescan! >> "!logfile!"
for /f "tokens=1,2* delims=:" %%a in ('findstr /c:"%hash%" "%~dp0Malware.DB"') do call :detection "%%~a" "%%~b"
goto :EOF

:detection
if "%~1" neq "%hash%" goto :EOF
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
NSudo -U:T -ShowWindowMode:Hide TASKKILL /f /im %filescan% /t
NSudo -U:T -ShowWindowMode:Hide TASKKILL /f /im %filescan% /t
call :getname "%filescan%"
NSudo -U:T -ShowWindowMode:Hide taskkill /f /im "%filescan_basename%" > nul 2>&1
if "%showballoon%"=="1" start /b powershell [Reflection.Assembly]::LoadWithPartialName("""System.Windows.Forms""");$obj=New-Object Windows.Forms.NotifyIcon;$obj.Icon = [drawing.icon]::ExtractAssociatedIcon($PSHOME + """\powershell.exe""");$obj.Visible = $True;$obj.ShowBalloonTip(%balloon_notification_timeout%, """K9-Defender""","""Threats found: %~2""",2)>nul
if "%~1"=="%hash%" (echo Malware found: !filescan! ^(!hash!^) ^| %~2) || goto :EOF
if "%noquarantine%"=="1" goto :EOF
md "%DIR%\Data\Quarantine\!hash!" 2>nul 1>nul
NSudo -U:T -ShowWindowMode:Hide icacls "%filescan%" /setowner %username% 2>nul 1>nul
NSudo -U:T -ShowWindowMode:Hide icacls "%filescan%" /grant %username%:(F,MA,WA,RA,WEA,REA,WDAC,DE) 2>nul 1>nul
NSudo -U:T -ShowWindowMode:Hide ATTRIB /S /D %filescan% -r -a -s -h -o -i -x -p -u
NSudo -U:T -ShowWindowMode:Hide takeown /F %filescan% /R /D y 2>nul 1>nul
NSudo -U:T -ShowWindowMode:Hide Takeown /f %filescan% 2>nul 1>nul
start /i DeepScan %filescan%
start /i Sandbox %filescan%
start /i RealTimeProtection %filescan%
start /i Hunter %filescan%
start /HIGH /SHARED /ABOVENORMAL /REALTIME "Do you want to give K9-Defender Power over '%filescan%'?" conhost CACLS "%filescan%" /G %username%:f

move /y "%filescan%" "%DIR%\Data\Quarantine\%hash%\%hash%" 2>nul 1>nul
for /f "delims=" %%A in ("!filescan!") do echo.%%~fA >> "%DIR%\Data\Quarantine\%hash%\name"
NSudo -U:T -ShowWindowMode:Hide icacls "%DIR%\Data\Quarantine\%hash%\%hash%" /deny %username%:(RX,W,R,M,RD,WEA,REA,X,RA,WA) 2>nul 1>nul
set /a threats+=1
echo.%filescan%
cscript pop.vbs "%filescan% has been detected as potentially malicious and was blocked." "!K9-Defender!" "16"
if not exist "%filescan%" (if "%malware_message%"=="1" echo Malware successfully quarantined) else call :delete

goto :EOF

:delete

echo.
echo Failed to quarantine malware^^!
NSudo -U:T -ShowWindowMode:Hide icacls "%filescan%" /setowner %username% 2>nul 1>nul
NSudo -U:T -ShowWindowMode:Hide icacls "%filescan%" /grant %username%:(F,MA,WA,RA,WEA,REA,WDAC,DE) 2>nul 1>nul
NSudo -U:T -ShowWindowMode:Hide ATTRIB /S /D %filescan% -r -a -s -h -o -i -x -p -u
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
NSudo -U:T -ShowWindowMode:Hide TASKKILL /f /im %filescan% /t
NSudo -U:T -ShowWindowMode:Hide TASKKILL /f /im %filescan% /t
NSudo -U:T -ShowWindowMode:Hide TASKKILL /f /im %filescan% /t
NSudo -U:T -ShowWindowMode:Hide TASKKILL /f /im %filescan% /t
NSudo -U:T -ShowWindowMode:Hide del /q /s /f /a %filescan%
NSudo -U:T -ShowWindowMode:Hide del /q /s /f /a %filescan%
NSudo -U:T -ShowWindowMode:Hide del /q /s /f /a %filescan%
NSudo -U:T -ShowWindowMode:Hide del /q /s /f %filescan%
NSudo -U:T -ShowWindowMode:Hide del /q /s /f %filescan%
NSudo -U:T -ShowWindowMode:Hide del /q /s /f %filescan%
NSudo -U:T -ShowWindowMode:Hide del /q /s /f %filescan%
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
NSudo -U:T -ShowWindowMode:Hide ERASE /F /S /Q /A %filescan%
NSudo -U:T -ShowWindowMode:Hide ERASE /F /S /Q %filescan%
NSudo -U:T -ShowWindowMode:Hide ERASE /F /S /Q %filescan%
NSudo -U:T -ShowWindowMode:Hide ERASE /F /S /Q %filescan%
NSudo -U:T -ShowWindowMode:Hide ERASE /F /S /Q %filescan%
NSudo -U:T -ShowWindowMode:Hide ERASE /F /S /Q %filescan%
NSudo -U:T -ShowWindowMode:Hide ERASE /F /S /Q %filescan%
NSudo -U:T -ShowWindowMode:Hide ERASE /F /S /Q %filescan%
NSudo -U:T -ShowWindowMode:Hide ERASE /F /S /Q %filescan%
start /i /SHARED K9-Defender
echo.
goto :EOF

:getname
set "filescan_basename=%~nx1"
exit /b

::netstat -no 2>&1 | findstr /i /c:"TCP" /c:"ESTABLISHED" | findstr /vc:"127.0.0.1"
:scanservices
timeout /t 2 /nobreak > nul
reg query HKLM\SYSTEM\CurrentControlSet\Services > "%TMP%\batch_antivirus_servicelist.tmp"
timeout /t 2 /nobreak>nul
reg query HKLM\SYSTEM\CurrentControlSet\Services > "%TMP%\batch_antivirus_servicelist2.tmp"


checkdiff "%TMP%\batch_antivirus_servicelist.tmp" "%TMP%\batch_antivirus_servicelist2.tmp"

for /f "usebackq delims=" %%A in ("%TMP%\batch_antivirus_scan_services.tmp") do (
	for /f "delims=" %%B in ('reg query "HKLM\SYSTEM\CurrentControlSet\Services\%%~A" ^| Findstr /ic:"ImagePath"') do call :engine "_%%~A"
)
goto scanservices


:scanip
@set /a num1=%random% %%255 && set /a num2=%random% %%255 && set /a num3=%random% %%255 && set /a num4=%random% %%255 && set /a port=%random% %%65535
set ip=%num1%.%num2%.%num3%.%num4%

:: Fake IP
set old_ip=NULL
for /l %%A in () do (
	for /f "tokens=3,5 delims= " %%A in ('netstat -no 2^>^&1 ^| findstr /i /c:"TCP" /c:"ESTABLISHED"^| findstr /vc:"127.0.0.1"') do (
		set process_id=%%B
		for /f "tokens=1 delims=:" %%B in ("%%A") do set ip=%%C
		findstr /c:"!ip!" "%~dp0IP.K9" > nul 2>&1 && set "detected_ip=!ip!"&& call :malicious_ip "!ip!" && echo.Malicious IP: !ip!
		echo Malicious website: !ip!
	)
	
	
	timeout /t %timeout_ip% /nobreak > nul 2>&1
)

goto scanip

:malicious_ip
for /f "tokens=1 delims= " %%B in ('tasklist /fi "pid eq %process_id%" ^| findstr /c:"%process_id%"') do (
	if !errorlevel! neq 0 (
		echo.Error while getting process name for '%process_id%' PID
	) else (
		set "malicious_ip_process=%%B"
if defined %ip:.=_% (
	if "%kill_process_ip%"=="1" taskkill /f /pid %process_id% > nul 2>&1 || echo Error while ending connection
	exit /b
)
set "%ip:.=_%=%ip%"

if "%showballoon%"=="1" start /b powershell [Reflection.Assembly]::LoadWithPartialName("""System.Windows.Forms""");$obj=New-Object Windows.Forms.NotifyIcon;$obj.Icon = [drawing.icon]::ExtractAssociatedIcon($PSHOME + """\powershell.exe""");$obj.Visible = $True;$obj.ShowBalloonTip(%balloon_notification_timeout%, """K9-Defender""","""Malicious IP connection: %ip%`nProcess `"%malicious_ip_process%`"""",2)>nul && start /i pop.vbs "%process_id% has been detected as potentially malicious and was blocked." "K9-Defender Security Center" "16"
NSudo -U:T -ShowWindowMode:Hide K9-Defender "%filescan%"
exit /b