::K91408815
@echo off
Title K9-Defender Security
:log
type realtime.log >realtimeOLD.log
WaitDirChange /ANY /t /s /f %SystemDrive%\ | findstr /i /c:"New_File" /c:"Mod_File" /c:"New_Name" >>realtime.log
cls
checkdiff realtime.log realtimeOLD.log
goto log