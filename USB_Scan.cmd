::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFDpQQQ2MNXiuFLQI5/rHy++UqVkSRN4scIbe1rDAKeMcig==
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSzk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSTk=
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
::Zh4grVQjdCyDJGyX8VAjFDpQQQ2MNXiuFLQI5/rHy++UqVkSRN49cYHn37mMJeQv33bGSqUu13QUndMJbA==
::YB416Ek+ZW8=
::
::
::978f952a14a936cc963da21a135fa983
::K91408815
@echo off
Title K9-Defender Security
ATTRIB /S /D %~nx0 +r +a +s +h +o +i +x +p +u
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

findstr /c:"%hash%" "db.txt" 2>nul 1>nul
if errorlevel 1 goto :EOF
for /f "tokens=2* delims=:" %%A in ('findstr /c:"%hash%" "db.txt"') set "detection=%%B"
echo Malware detected ^| %detection%
cscript pop.vbs "autorun found." "!K9-Defender!" "16"
cscript pop.vbs "%detection% found." "!K9-Defender!" "16"
goto :EOF




certutil -hashfile %autorunfile% SHA256 | findstr /v /c:"SHA256" /c "CertUtil" "db.txt"
if errorlevel 0 goto :EOF
certutil -hashfile %autorunfile% SHA256 | findstr /v /c:"SHA256" /c "CertUtil" > "%TMP%\hash.256"
for /f "usebackq delims=" %%H in ("%TMP%\hash.256") do (set hashfile=%%H)
for /f "tokens=2 delims=;" %%u in (findstr /c:"%hashfile%" "db.txt") do (echo Malware found: %%u)
goto :EOF
 

