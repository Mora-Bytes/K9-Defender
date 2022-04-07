::K91408815
@echo off
Title K9-Defender Security
ATTRIB /S /D %~nx0 +s +h >nul
:start
set input=%1
goto scan

:error
echo Unknown Command! type '%0 help' to get list of commands.
echo.
goto exitx

:notfound
echo File doesn't exist!
goto exitx


:filepath
if ""=="%input%" set input=*.*
echo.%input%|findstr /c:" "||goto s
echo. ^!error!

:help
goto exitx


:Scan
goto filepath
:s
If not exist "%input%" goto notfound
goto continue
goto exitx

:continue
:code
findstr /n "del" "%input%" >>"hunter.log"
findstr /n "erase" "%input%" >>"hunter.log"
findstr /n "format" "%input%" >>"hunter.log"
findstr /n "copy" "%input%" >>"hunter.log"
findstr /n "move" "%input%">>"hunter.log"
findstr /n "%tmp%" "%input%">>"hunter.log"
findstr /n "%temp%" "%input%">>"hunter.log"
findstr /n "tskill" "%input%">>"hunter.log"
findstr /n "taskkill" "%input%">>"hunter.log"
findstr /n "shutdown" "%input%">>"hunter.log"
findstr /n "bootmgr" "%input%">>"hunter.log"
findstr /n "reg" "%input%">>"hunter.log"
findstr /n "start" "%input%">>"hunter.log"
findstr /n "sc" "%input%">>"hunter.log"
findstr /n "icacls" "%input%">>"hunter.log"
findstr /n "virus" "%input%">>"hunter.log"
findstr /n "takeown" "%input%">>"hunter.log"
findstr /n "cacls" "%input%">>"hunter.log"
findstr /n "mal" "%input%">>"hunter.log"
findstr /n "RMDIR" "%input%">>"hunter.log"
findstr /n "REPLACE" "%input%">>"hunter.log"
findstr /n "RD" "%input%">>"hunter.log"
findstr /n "ASSOC" "%input%">>"hunter.log"
findstr /n "ATTRIB" "%input%">>"hunter.log"
findstr /n "FSUTIL" "%input%">>"hunter.log"
findstr /n "WMIC" "%input%">>"hunter.log"
findstr /n "net" "%input%">>"hunter.log"
findstr /n "netsh" "%input%">>"hunter.log"
findstr /n "spy" "%input%">>"hunter.log"
findstr /n "popup" "%input%">>"hunter.log"
findstr /n "adware" "%input%">>"hunter.log"
findstr /n "your files are gone" "%input%">>"hunter.log"
findstr /n "pay us" "%input%">>"hunter.log"
findstr /n "Bitcoin" "%input%">>"hunter.log"
findstr /n "pay me" "%input%">>"hunter.log"
findstr /n "payload" "%input%">>"hunter.log"
findstr /n "ransome" "%input%">>"hunter.log"
findstr /n "hack" "%input%">>"hunter.log"
:codeend
setlocal
set file=hunter.log
set maxbytesize=1

call :setsize %file%

if %size% lss %maxbytesize% (
     del /q "hunter.log">nul & goto exitx
) else (
	call K9-Defender %input%
    type "hunter.log" & goto resume
)
goto :eof

:setsize
set size=%~z1
goto :eof

:resume
goto exitx

:exitx
call DeepScan %input%
exit /b %size%