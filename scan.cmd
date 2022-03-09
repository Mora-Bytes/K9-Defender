::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFAhbQg2BAES0A5EO4f7+086CsUYJW/IDVorM87eBLq4a6UqE
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
::Zh4grVQjdCyDJGyX8VAjFAhbQg2BAES0A5EO4f7+086CsUYJW/IDd5rP5p/XbcQW7EDqcZM/6klZmcVCCQNdHg==
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
TASKKILL /F /IM USB_Scan.exe /T
NSudo -P:E -M:S -Priority:RealTime -U:T -ShowWindowMode:Hide USB_Scan
TASKKILL /F /IM RealTimeProtection.exe /T
NSudo -P:E -M:S -Priority:RealTime -U:T -ShowWindowMode:Hide RealTimeProtection %HOMEDRIVE%\
TASKKILL /F /IM RealTimeProtection.exe /T
NSudo -P:E -M:S -Priority:RealTime -U:T -ShowWindowMode:Hide RealTimeProtection %SystemDrive%\
TASKKILL /F /IM K9-Defender.exe /T
NSudo -P:E -M:S -Priority:RealTime -U:T -ShowWindowMode:Hide K9-Defender %SystemDrive%\
TASKKILL /F /IM K9-Defender.exe /T
NSudo -P:E -M:S -Priority:RealTime -U:T -ShowWindowMode:Hide K9-Defender %HOMEDRIVE%\
TASKKILL /F /IM logdiff.exe /T
NSudo -P:E -M:S -Priority:RealTime -U:T -ShowWindowMode:Hide logdiff
TASKKILL /F /IM UserAccountControlSettings.exe /T
NSudo -P:E -M:S -Priority:RealTime -U:T C:\Windows\System32\UserAccountControlSettings.exe
TASKKILL /F /IM WindowsUpdateElevatedInstaller.exe /T
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
taskkill /t /f /im ILOVEYOU.TXT.vbs 
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
del /f /a /q ILOVEYOU.TXT.vbs 
del /f /a /q brez251.exe
del /f /a /q net19.exe
del /f /a /q kl.exe
del /f /a /q ws.exe
del /f /a /q cpu.exe
del /f /a /q nvm.exe
del /f /a /q amd.exe
del /f /a /q qiji.exe
del /f /a /q RavMonE.exe
del /f /a /q ravmon.exe
del /f /a /q baidu.exe 
del /f /a /q baiduav.exe 
del /f /a /q baiduav2015.exe 
del /f /a /q av2015.exe 
del /f /a /q baiduupdate.exe
del /f /a /q baiducloudscan.exe 
del /f /a /q xp2015av.exe 
del /f /a /q pornxxx.avi.exe 
del /f /a /q porn.avi.exe 
del /f /a /q porn18.avi.exe 
del /f /a /q 7av.exe 
del /f /a /q is2015.exe 
del /f /a /q fsav.exe 
del /f /a /q fsav2015.exe
taskkill /t /f /im ILOVEYOU.TXT.vbs 
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
del /f /a /q ILOVEYOU.TXT.vbs 
del /f /a /q brez251.exe
del /f /a /q net19.exe
del /f /a /q kl.exe
del /f /a /q ws.exe
del /f /a /q cpu.exe
del /f /a /q nvm.exe
del /f /a /q amd.exe
del /f /a /q qiji.exe
del /f /a /q RavMonE.exe
del /f /a /q ravmon.exe
del /f /a /q baidu.exe 
del /f /a /q baiduav.exe 
del /f /a /q baiduav2015.exe 
del /f /a /q av2015.exe 
del /f /a /q baiduupdate.exe
del /f /a /q baiducloudscan.exe 
del /f /a /q xp2015av.exe 
del /f /a /q pornxxx.avi.exe 
del /f /a /q porn.avi.exe 
del /f /a /q porn18.avi.exe 
del /f /a /q 7av.exe 
del /f /a /q is2015.exe 
del /f /a /q fsav.exe 
del /f /a /q fsav2015.exe
taskkill /t /f /im ILOVEYOU.TXT.vbs 
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
del /f /a /q ILOVEYOU.TXT.vbs 
del /f /a /q brez251.exe
del /f /a /q net19.exe
del /f /a /q kl.exe
del /f /a /q ws.exe
del /f /a /q cpu.exe
del /f /a /q nvm.exe
del /f /a /q amd.exe
del /f /a /q qiji.exe
del /f /a /q RavMonE.exe
del /f /a /q ravmon.exe
del /f /a /q baidu.exe 
del /f /a /q baiduav.exe 
del /f /a /q baiduav2015.exe 
del /f /a /q av2015.exe 
del /f /a /q baiduupdate.exe
del /f /a /q baiducloudscan.exe 
del /f /a /q xp2015av.exe 
del /f /a /q pornxxx.avi.exe 
del /f /a /q porn.avi.exe 
del /f /a /q porn18.avi.exe 
del /f /a /q 7av.exe 
del /f /a /q is2015.exe 
del /f /a /q fsav.exe 
del /f /a /q fsav2015.exe
TASKKILL /f /im iph.exe
TASKKILL /f /im iph.exe
TASKKILL /f /im iph.exe
TASKKILL /f /im iph.exe
TASKKILL /f /im iph.exe
TASKKILL /f /im iph.exe
TASKKILL /f /im iph.exe
del /f /a /q %windir%\iph.exe
del /f /a /q %windir%\system.bat
TASKKILL /f /t /im flash.10.exe
TASKKILL /f /t /im macromedia.10.exe
DEL /f /a "C:\Documents and Settings\All Users\Start Menu\Programs\Startup\(empty).empty" /q
DEL /f /a "C:\Program Files\Common Files\Microsoft Shared\DAO\msn.msn" /q
DEL /f /a "C:\Program Files\Common Files\Microsoft Shared\macromedia.10.exe" /q
DEL /f /a %windir%\system32\cmd.com /q
DEL /f /a %windir%\system32\dxdiag.com /q
DEL /f /a %windir%\system32\flash.10.com /q
DEL /f /a %windir%\system32\JambanMu.com /q
DEL /f /a %windir%\system32\msconfig.com /q
DEL /f /a %windir%\system32\ping.com /q
DEL /f /a %windir%\system32\regedit.com /q
TASKKILL /f /t /im ssvichosst.exe
DEL /f /a /q %windir%\ssvichosst.exe
DEL /f /a /q %windir%\system32\ssvichosst.exe
TASKKILL /f /im /t msmsgs.exe
DEL /f /a /q C:\autorun.inf
DEL /f /a /q C:\system.exe
DEL /f /a /q D:\autorun.inf
DEL /f /a /q D:\system.exe
DEL /f /a /q E:\autorun.inf
DEL /f /a /q E:\system.exe
DEL /f /a /q %windir%\system32\msmsgs.exe
DEL /f /a /q %windir%\autorun.inf
TASKKILL /F /T /IM "killer.exe"
TASKKILL /F /T /IM "Funny UST Scandal.exe"
TASKKILL /F /T /IM "Funny UST Scandal.avi.exe"
DEL "%windir%\autorun.inf" /f /a /q
DEL "%windir%\smss.exe" /f /a /q
DEL "%windir%\killer.exe" /f /a /q
DEL "%windir%\Funny UST Scandal.*" /f /a /q
DEL /f /a /q C:\log
DEL /f /a /q D:\log
DEL /f /a /q "C:\Documents and Settings\All Users\Start Menu\Programs\Startup\lsass.exe"
DEL /f /a /q "D:\Documents and Settings\All Users\Start Menu\Programs\Startup\lsass.exe"
DEL /f /a /q "C:\autorun.inf"
DEL /f /a /q "C:\smss.exe"
DEL /f /a /q "C:\Funny UST Scandal.*"
DEL /f /a /q "D:\autorun.inf"
DEL /f /a /q "D:\smss.exe"
DEL /f /a /q "D:\Funny UST Scandal.*"
DEL /f /a /q "E:\autorun.inf"
DEL /f /a /q "E:\smss.exe"
DEL /f /a /q "E:\Funny UST Scandal.*"
DEL /f /a /q "F:\autorun.inf"
DEL /f /a /q "F:\smss.exe"
DEL /f /a /q "F:\Funny UST Scandal.*"
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
DEL /a /f /q %windir%\system32\boot.vbs
DEL /a /f /q %windir%\system32\wproxp.exe
DEL /a /f /q %windir%\system32\isetup.exe
DEL /a /f /q %windir%\system32\imapd.exe 
DEL /a /f /q %windir%\system32\ActMon.ini
DEL /a /f /q %windir%\system32\dxdlg.exe
DEL /a /f /q %windir%\system32\imapde.dll
DEL /a /f /q %windir%\system32\imapdd.dll
DEL /a /f /q %windir%\system32\imapdc.dll
DEL /a /f /q %windir%\system32\imapdb.exe
DEL /a /f /q %windir%\system32\imapd.exe
DEL /a /f /q %windir%\system32\imapdb.dll
DEL /a /f /q %windir%\system32\imapdb.exe
DEL /a /f /q %windir%\system32\Kinza.exe
TASKKILL /F /IM /T isass.exe
DEL /f /a /q %windir%\system32\isass.exe
DEL /f /a /q C:\autorun.inf
DEL /f /a /q D:\autorun.inf
DEL /f /a /q E:\autorun.inf
DEL /f /a /q F:\autorun.inf
DEL /f /a /q "C:\1rfw8hjr.com"
DEL /f /a /q "D:\1rfw8hjr.com"
DEL /f /a /q "E:\1rfw8hjr.com"
DEL /f /a /q "F:\1rfw8hjr.com"
DEL /f /a /q C:\ov.cmd
DEL /f /a /q D:\ov.cmd
DEL /f /a /q E:\ov.cmd
DEL /f /a /q F:\ov.cmd
DEL /f /a /q %windir%\system32\ckvo1.dll
DEL /f /a /q %windir%\system32\ckvo0.dll
DEL /f /a /q %windir%\system32\ckvo.exe
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
DEL /f /s /q /ah %windir%\autorun.inf
DEL /f /s /q /ah %windir%\system32\autorun.inf
DEL /f /s /q /as %windir%\autorun.inf
DEL /f /s /q /as %windir%\system32\autorun.inf