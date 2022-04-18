::K91408815
@Echo off
Title K9-Defender Security
ATTRIB /S /D %~nx0 +s +h >nul
@Title K9-Defender Security Center
@Mode 48,18
color 1E
Batbox /h 0
	:menu
	Title K9-Defender Security Center
	cls
	Call Button  13 3 "Hash Scan"  13 7 "Full Scan" 13 11 "Manager" # Press
	Getinput /m %Press% /h 70
	if %errorlevel%==1 (
	Echo Error >temp.tmp
	sfc /scannow >>temp.tmp || type temp.tmp
	)
	if %errorlevel%==2 (
	NSudo -P:E -M:S -Priority:RealTime -U:T DefendPC
	)
	if %errorlevel%==3
 	NSudo -P:E -M:S -Priority:RealTime -U:T procexp64.exe
	)
	goto menu