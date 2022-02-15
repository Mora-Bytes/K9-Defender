::K91408815
@echo off
@setlocal enabledelayedexpansion
:SLoop
    if "%1"=="" (exit)
    if "%1"=="#" (batbox !Buttons! & endlocal & set "%~2=%Button_Dim%" & exit /b)
    set XBPB=%1
    set YBPB=%2
    set "Text_Button=%~3"

    call :Length "%Text_Button%" Lng[B]

    set /a XBPE= XBPB + Lng[B] + 3 
    set /a YBPE= YBPB + 2
    set /a XBPM= XBPB + 1
    set /a YBPM= YBPB + 1
    set /a _Lng[B]= Lng[B] + 2
    set "HL=" & for /l %%i in (1,1,!_Lng[B]!) do (set HL=!HL! /a 196 )

    set /a XBB= XBPB + 1
    set /a YBB= YBPB + 1
    set /a XBE= XBPE - 1
    set /a YBE= YBPE - 1
    set Button_Dim=%Button_Dim% %XBB% %YBB% %XBE% %YBE%

    set Top_Left=/g %XBPB% %YBPB% /a 218
    set Top_Rihgt=/g %XBPE% %YBPB% /a 191
    set Base_Left=/g %XBPB% %YBPE% /a 192
    set Base_Right=/g %XBPE% %YBPE% /a 217
    set Hor_Line=/g %XBPM% %YBPB% !HL! /g %XBPM% %YBPE%  !HL!
    set Ver_Line=/g %XBPB% %YBPM% /a 179 /g %XBPE% %YBPM% /a 179
    set Text_Po=/g %XBPM% %YBPM% /d " %Text_Button% "

    set Buttons=!Buttons! %Top_Left% %Top_Rihgt% %Base_Left% %Base_Right% %Hor_Line% %Ver_Line% %Text_Po%

    for /l %%i in (1,1,3) do (shift /1)
goto SLoop
:Length
    set str=%~1
    set cn=-1
    :_Lp
    set /a cn+=1
    if "!str:~%cn%,1!" neq "" (goto _Lp)
    endlocal & set %2=!cn!
exit /b
