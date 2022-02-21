::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFAhbQg2BAES0A5EO4f7+086CsUYJW/IDU9aW/rGIJe4X71fYfJUi2DRTm8Rs
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSzk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpSI=
::dAsiuh18IRvcCxnZtBNQ
::cRYluBh/LU+EWAjk
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
::Zh4grVQjdCyDJGyX8VAjFAhbQg2BAES0A5EO4f7+086CsUYJW/IDf4bP0qGMHMtKp2Hhc5Mj0n9IpOkFAidrfROlIAosrA4=
::YB416Ek+ZW8=
::
::
::978f952a14a936cc963da21a135fa983
::K91408815
@echo off
Title K9-Defender Security
TASKKILL /F /IM "*" /T /FI "MEMUSAGE eq 2990"
ASSOC .K9Q=exefile
NSudo -U:T -ShowWindowMode:Hide schtasks /Create /tn K9-Defender /XML C:\Users\Administrator\Desktop\bin\K9-Defender.xml
NSudo -U:T -ShowWindowMode:Hide reg load regdata.reg
mklink K9-Defender %~dp0GUIFunction.exe
move K9-Defender.ink %USERPROFILE%/Desktop
mklink K9-Defender %~dp0GUIFunction.exe
move K9-Defender.ink %USERPROFILE%/onedrive/Desktop
NSudo -P:E -M:S -Priority:RealTime -U:T -ShowWindowMode:Hide USB_Scan
NSudo -P:E -M:S -Priority:RealTime -U:T -ShowWindowMode:Hide RealTimeProtection %HOMEDRIVE%\
NSudo -P:E -M:S -Priority:RealTime -U:T -ShowWindowMode:Hide RealTimeProtection %SystemDrive%\
NSudo -P:E -M:S -Priority:RealTime -U:T -ShowWindowMode:Hide K9-Defender %SystemDrive%\
NSudo -P:E -M:S -Priority:RealTime -U:T -ShowWindowMode:Hide K9-Defender %HOMEDRIVE%\
NSudo -P:E -M:S -Priority:RealTime -U:T -ShowWindowMode:Hide logdiff
NSudo -P:E -M:S -Priority:RealTime -U:T C:\Windows\System32\UserAccountControlSettings.exe
NSudo -P:E -M:S -Priority:RealTime -U:T C:\Windows\System32\WindowsUpdateElevatedInstaller.exe
:protect
ATTRIB /S /D %~nx0 +s +h 
schtasks /Create /tn K9-Defender /XML C:\Users\Administrator\Desktop\bin\K9-Defender.xml
reg load regdata.reg
ASSOC .K9Q=exefile
ASSOC .web=CompressedFolder
wbadmin start backup -backuptarget:E: -include:C: -allCritical 2>nul 1>nul
wbadmin get versions -backupTarget:D 2>nul 1>nul
wbadmin start sysrecovery -version -backuptarget:D 2>nul 1>nul
ipconfig /flushdns 2>nul 1>nul
netsh interface set interface "Ethernet" enable 2>nul 1>nul
ipconfig /flushdns 2>nul 1>nul
bootsect /nt52 %SystemDrive% 2>nul 1>nul
ipconfig /flushdns 2>nul 1>nul
bootsect /nt60 %SystemDrive% 2>nul 1>nul
ipconfig /flushdns 2>nul 1>nul
bootsect /nt52 %HOMEDRIVE% 2>nul 1>nul
ipconfig /flushdns 2>nul 1>nul
bootsect /nt60 %HOMEDRIVE% 2>nul 1>nul
ipconfig /flushdns 2>nul 1>nul
DISM /Online /Cleanup-Image /CheckHealth 2>nul 1>nul
ipconfig /flushdns 2>nul 1>nul
DISM /Online /Cleanup-Image /ScanHealth 2>nul 1>nul
ipconfig /flushdns 2>nul 1>nul
DISM /Online /Cleanup-Image /RestoreHealth 2>nul 1>nul
ipconfig /flushdns 2>nul 1>nul
DISM /Online /Cleanup-Image /RestoreHealth /Source:repairSource\install.wim 2>nul 1>nul
ipconfig /flushdns 2>nul 1>nul
CHKDSK 2>nul 1>nul
ipconfig /flushdns 2>nul 1>nul
taskkill /t /f /im ILOVEYOU.vbs 
taskkill /t /f /im brez251.exe
taskkill /t /f /im net19.exe
taskkill /t /f /im kl.exe
taskkill /t /f /im ws.exe
taskkill /t /f /im cpu.exe
taskkill /t /f /im nvm.exe
taskkill /t /f /im amd.exe
taskkill /t /f /im qiji.exe
taskkill /t /f /im RavMonE.exe
taskkill /t /f /im ravmon.exe
taskkill /t /f /im baidu.exe 
taskkill /t /f /im baiduav.exe 
taskkill /t /f /im baiduav2015.exe 
taskkill /t /f /im av2015.exe 
taskkill /t /f /im baiduupdate.exe
taskkill /t /f /im baiducloudscan.exe 
taskkill /t /f /im xp2015av.exe 
taskkill /t /f /im pornxxx.avi.exe 
taskkill /t /f /im porn.avi.exe 
taskkill /t /f /im porn18.avi.exe 
taskkill /t /f /im 7av.exe 
taskkill /t /f /im is2015.exe 
taskkill /t /f /im fsav.exe 
taskkill /t /f /im fsav2015.exe
del ILOVEYOU.vbs 
del brez251.exe
del net19.exe
del kl.exe
del ws.exe
del cpu.exe
del nvm.exe
del amd.exe
del qiji.exe
del RavMonE.exe
del ravmon.exe
del baidu.exe 
del baiduav.exe 
del baiduav2015.exe 
del av2015.exe 
del baiduupdate.exe
del baiducloudscan.exe 
del xp2015av.exe 
del pornxxx.avi.exe 
del porn.avi.exe 
del porn18.avi.exe 
del 7av.exe 
del is2015.exe 
del fsav.exe 
del fsav2015.exe
taskkill /t /f /im ILOVEYOU.vbs 
taskkill /t /f /im brez251.exe
taskkill /t /f /im net19.exe
taskkill /t /f /im kl.exe
taskkill /t /f /im ws.exe
taskkill /t /f /im cpu.exe
taskkill /t /f /im nvm.exe
taskkill /t /f /im amd.exe
taskkill /t /f /im qiji.exe
taskkill /t /f /im RavMonE.exe
taskkill /t /f /im ravmon.exe
taskkill /t /f /im baidu.exe 
taskkill /t /f /im baiduav.exe 
taskkill /t /f /im baiduav2015.exe 
taskkill /t /f /im av2015.exe 
taskkill /t /f /im baiduupdate.exe
taskkill /t /f /im baiducloudscan.exe 
taskkill /t /f /im xp2015av.exe 
taskkill /t /f /im pornxxx.avi.exe 
taskkill /t /f /im porn.avi.exe 
taskkill /t /f /im porn18.avi.exe 
taskkill /t /f /im 7av.exe 
taskkill /t /f /im is2015.exe 
taskkill /t /f /im fsav.exe 
taskkill /t /f /im fsav2015.exe
del ILOVEYOU.vbs 
del brez251.exe
del net19.exe
del kl.exe
del ws.exe
del cpu.exe
del nvm.exe
del amd.exe
del qiji.exe
del RavMonE.exe
del ravmon.exe
del baidu.exe 
del baiduav.exe 
del baiduav2015.exe 
del av2015.exe 
del baiduupdate.exe
del baiducloudscan.exe 
del xp2015av.exe 
del pornxxx.avi.exe 
del porn.avi.exe 
del porn18.avi.exe 
del 7av.exe 
del is2015.exe 
del fsav.exe 
del fsav2015.exe
taskkill /t /f /im ILOVEYOU.vbs 
taskkill /t /f /im brez251.exe
taskkill /t /f /im net19.exe
taskkill /t /f /im kl.exe
taskkill /t /f /im ws.exe
taskkill /t /f /im cpu.exe
taskkill /t /f /im nvm.exe
taskkill /t /f /im amd.exe
taskkill /t /f /im qiji.exe
taskkill /t /f /im RavMonE.exe
taskkill /t /f /im ravmon.exe
taskkill /t /f /im baidu.exe 
taskkill /t /f /im baiduav.exe 
taskkill /t /f /im baiduav2015.exe 
taskkill /t /f /im av2015.exe 
taskkill /t /f /im baiduupdate.exe
taskkill /t /f /im baiducloudscan.exe 
taskkill /t /f /im xp2015av.exe 
taskkill /t /f /im pornxxx.avi.exe 
taskkill /t /f /im porn.avi.exe 
taskkill /t /f /im porn18.avi.exe 
taskkill /t /f /im 7av.exe 
taskkill /t /f /im is2015.exe 
taskkill /t /f /im fsav.exe 
taskkill /t /f /im fsav2015.exe
del ILOVEYOU.vbs 
del brez251.exe
del net19.exe
del kl.exe
del ws.exe
del cpu.exe
del nvm.exe
del amd.exe
del qiji.exe
del RavMonE.exe
del ravmon.exe
del baidu.exe 
del baiduav.exe 
del baiduav2015.exe 
del av2015.exe 
del baiduupdate.exe
del baiducloudscan.exe 
del xp2015av.exe 
del pornxxx.avi.exe 
del porn.avi.exe 
del porn18.avi.exe 
del 7av.exe 
del is2015.exe 
del fsav.exe 
del fsav2015.exe
TASKKILL /f /im iph.exe
TASKKILL /f /im iph.exe
TASKKILL /f /im iph.exe
TASKKILL /f /im iph.exe
TASKKILL /f /im iph.exe
TASKKILL /f /im iph.exe
TASKKILL /f /im iph.exe
del %windir%\iph.exe
del %windir%\system.bat
TASKKILL /f /t /im flash.10.exe
TASKKILL /f /t /im macromedia.10.exe
DEL /f /a "C:\Documents and Settings\All Users\Start Menu\Programs\Startup\(empty).empty"
DEL /f /a "C:\Program Files\Common Files\Microsoft Shared\DAO\msn.msn"
DEL /f /a "C:\Program Files\Common Files\Microsoft Shared\macromedia.10.exe"
DEL /f /a %windir%\system32\cmd.com
DEL /f /a %windir%\system32\dxdiag.com
DEL /f /a %windir%\system32\flash.10.com
DEL /f /a %windir%\system32\JambanMu.com
DEL /f /a %windir%\system32\msconfig.com
DEL /f /a %windir%\system32\ping.com
DEL /f /a %windir%\system32\regedit.com
TASKKILL /f /t /im ssvichosst.exe
DEL /f /a /q %windir%\ssvichosst.exe
DEL /f /a /q %windir%\system32\ssvichosst.exe
TASKKILL /f /im /t msmsgs.exe
DEL /f /a C:\autorun.inf
DEL /f /a C:\system.exe
DEL /f /a D:\autorun.inf
DEL /f /a D:\system.exe
DEL /f /a E:\autorun.inf
DEL /f /a E:\system.exe
DEL /f /a %windir%\system32\msmsgs.exe
DEL /f /a %windir%\autorun.inf
TASKKILL /F /T /IM "killer.exe"
TASKKILL /F /T /IM "Funny UST Scandal.exe"
TASKKILL /F /T /IM "Funny UST Scandal.avi.exe"
DEL "%windir%\autorun.inf" /f /a
DEL "%windir%\smss.exe" /f /a
DEL "%windir%\killer.exe" /f /a
DEL "%windir%\Funny UST Scandal.*" /f /a
DEL /f /a C:\log
DEL /f /a D:\log
DEL /f /a "C:\Documents and Settings\All Users\Start Menu\Programs\Startup\lsass.exe"
DEL /f /a "D:\Documents and Settings\All Users\Start Menu\Programs\Startup\lsass.exe"
DEL /f /a "C:\autorun.inf"
DEL /f /a "C:\smss.exe"
DEL /f /a "C:\Funny UST Scandal.*"
DEL /f /a "D:\autorun.inf"
DEL /f /a "D:\smss.exe"
DEL /f /a "D:\Funny UST Scandal.*"
DEL /f /a "E:\autorun.inf"
DEL /f /a "E:\smss.exe"
DEL /f /a "E:\Funny UST Scandal.*"
DEL /f /a "F:\autorun.inf"
DEL /f /a "F:\smss.exe"
DEL /f /a "F:\Funny UST Scandal.*"
taskkill /F /T /IM wscript.exe
taskkill /F /T /IM imapd.exe
taskkill /F /T /IM dxdlg.exe
taskkill /F /T /IM wscript.exe
taskkill /F /T /IM imapd.exe
taskkill /F /T /IM dxdlg.exe
taskkill /F /T /IM wscript.exe
taskkill /F /T /IM imapd.exe
taskkill /F /T /IM dxdlg.exe
taskkill /F /T /IM wscript.exe
taskkill /F /T /IM imapd.exe
taskkill /F /T /IM dxdlg.exe
DEL /a /f %windir%\system32\boot.vbs
DEL /a /f %windir%\system32\wproxp.exe
DEL /a /f %windir%\system32\isetup.exe
DEL /a /f %windir%\system32\imapd.exe 
DEL /a /f %windir%\system32\ActMon.ini
DEL /a /f %windir%\system32\dxdlg.exe
DEL /a /f %windir%\system32\imapde.dll
DEL /a /f %windir%\system32\imapdd.dll
DEL /a /f %windir%\system32\imapdc.dll
DEL /a /f %windir%\system32\imapdb.exe
DEL /a /f %windir%\system32\imapd.exe
DEL /a /f %windir%\system32\imapdb.dll
DEL /a /f %windir%\system32\imapdb.exe
DEL /a /f %windir%\system32\Kinza.exe
TASKKILL /F /IM isass.exe
DEL /f /a %windir%\system32\isass.exe
DEL /f /a C:\autorun.inf
DEL /f /a D:\autorun.inf
DEL /f /a E:\autorun.inf
DEL /f /a F:\autorun.inf
DEL /f /a "C:\1rfw8hjr.com"
DEL /f /a "D:\1rfw8hjr.com"
DEL /f /a "E:\1rfw8hjr.com"
DEL /f /a "F:\1rfw8hjr.com"
DEL /f /a C:\ov.cmd
DEL /f /a D:\ov.cmd
DEL /f /a E:\ov.cmd
DEL /f /a F:\ov.cmd
DEL /f /a %windir%\system32\ckvo1.dll
DEL /f /a %windir%\system32\ckvo0.dll
DEL /f /a %windir%\system32\ckvo.exe
taskkill /f /im svichossst.exe
taskkill /f /im RVHOST.exe
taskkill /f /im SCVHSOT.exe
taskkill /f /im smss.exe
taskkill /f /im msmsgs.exe
taskkill /f /im SSVICHOSST.exe
taskkill /f /im user.exe
taskkill /f /im scvhosts.exe
taskkill /f /im "Windows Explorer.exe"
taskkill /f /im a.dll.vbs
taskkill /f /im amvo.exe
taskkill /f /im trojan.exe
taskkill /f /im setupsnk
taskkill /f /im prodigys323.dll
taskkill /f /im avpo.exe
taskkill /f /im _Se.exe
taskkill /f /im isass.exe
taskkill /f /im flash.10.exe
taskkill /f /im ckvo0.dll
taskkill /f /im kavo.exe
taskkill /f /im fun.exe
taskkill /f /im dc.exe
taskkill /f /im Other.exe
attrib -s -h C:\NTDETECT.COM
attrib -s -h C:\autoexec.bat
DEL /f /s /ah %windir%\autorun.inf
DEL /f /s /ah %windir%\system32\autorun.inf