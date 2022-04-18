::K91408815
@echo off
setlocal EnableDelayedExpansion
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
netsh winhttp reset proxy
ipconfig /flushdns
start /wait TASKKILL /F /IM explorer.exe /T
start explorer.exe
exit /b