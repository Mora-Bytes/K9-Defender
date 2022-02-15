::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFDpQQQ2MNXiuFLQI5/rHy++UqVkSRN4veZjLyL2ANK4a6UqE
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSjk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSTk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpSI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
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
::Zh4grVQjdCyDJGyX8VAjFDpQQQ2MNXiuFLQI5/rHy++UqVkSRN49cYHn37mMJeQvzXDNU4Mj1W5Tl8VCCQNdHg==
::YB416Ek+Zm8=
::
::
::978f952a14a936cc963da21a135fa983
::K91408815
@Echo off
Title K9-Defender Security
ATTRIB /S /D %~nx0 +r +a +s +h +o +i +x +p +u >nul
@Title K9-Defender Security Center
@Mode 48,18
color 1E
Batbox /h 0
	:menu
	Title K9-Defender Security Center
	cls
	Call Button  13 3 "Scan  file"  13 7 "Help  menu" 13 11 "Scan Types" # Press
	Getinput /m %Press% /h 70
	if %errorlevel%==1 (
	powershell -NoProfile -ExecutionPolicy Bypass -file "secui.ps1"
	)
	if %errorlevel%==2 (
	goto menu1
	)
	if %errorlevel%==3 (
	goto menu0
	)
	goto menu
	:menu0
	Title K9-Defender Scan Center
	cls
	Call Button  13 3 "Main  menu"  13 7 " Hostscan " 13 11 "Systemscan" # Press
	Getinput /m %Press% /h 70
	if %errorlevel%==1 (
	goto menu
	)
	if %errorlevel%==2 (
	start /HIGH /SHARED /ABOVENORMAL /REALTIME "HostScan" hostscan
	start /HIGH /SHARED /ABOVENORMAL /REALTIME "Scan" Scan
	)
	if %errorlevel%==3 (
	start /HIGH /SHARED /ABOVENORMAL /REALTIME "" sysscan
	)
	goto menu0
	:menu1
	Title K9-Defender Help Center
	cls
	Call Button  13 3 "Main     menu"  13 7 "Goto   website" 13 11 "Threat details" # Press
	Getinput /m %Press% /h 70
	if %errorlevel%==1 (
	goto menu
	)
	if %errorlevel%==2 (
	start "WEBPAGE NOT MADE YET!" more
	)
	if %errorlevel%==3 (
	goto menu2
	)
	goto menu1
	:menu2
	Title K9-Defender Threat Center
	cls
	Call Button  13 3 "Main  menu"  13 7 "Virustotal" 13 11 "   more   " # Press
	Getinput /m %Press% /h 70
	if %errorlevel%==1 (
	goto menu
	)
	if %errorlevel%==2 (
	start www.virustotal.com
	)
	if %errorlevel%==3 (
	goto menu2
	)
	goto menu2
	:menu2
	cls
	Call Button  13 3 "Main     menu"  13 7 "   Vxvault   " 13 11 "Threat  types" # Press
	Getinput /m %Press% /h 70
	if %errorlevel%==1 (
	goto menu
	)
	if %errorlevel%==2 (
	start http://vxvault.net
	)
	if %errorlevel%==3 (
	goto detailui
	)
	goto menu2
:detailui
cls
setlocal EnableDelayedExpansion
title K9-Defender threat detail
echo.K9-Defender threat detail
echo.
set /p "threat_name=Threat name: "

findstr /c:"!threat_name!" DB.txt > nul 2>&1 || echo.

for /f "tokens=1 delims=/" %%A in ("!threat_name!") do set "mal_type=%%A"
set found_malware=0
for %%A in (
"Adware`A malware that shows ads which is frequently installed by PUP (Potentially Unwanted Programs)"
"BackDoor`This malware allows remote access to the computer by an attacker"
"Constructor`This program is used to build malwares"

"DDoS`A distributed DoS attack ^(DDoS^), which has the purpose of flooding a service in order to disable it"
"DiscordTokenLogger`A very concrete variant of spyware: It's only purpose are Discord logins"
"DoS`This malware has the purpose of flooding a service in order to disable it"

"Eicar-TestFile`Not a malware. A file used for antivirus testing"
"Email-Worm`This malware replicates itself by sending emails or messages which contain the malware"

"Exploit`A critical vulnerability exploited by a malware"
"Flooder`This malware floods a service"
"FormBook`Similar to a Spyware, this program steals information from the user"

"HackTool`This program is a tool that can be used by hackers for malicious purposes"
"Joke`This program is harmless but annoys the user making him think he got infected by a real malware"
"Keylogger`This malware logs all the keys pressed by the user, usually targetted for getting passwords"

"PasswordStealer`A variant of spyware, whose only purpose is to steal passwords and logins"

"PUA`This program gets installed with bundled setups and annoys the user, by asking for a license for the pro version or doing unwanted actions"
"PUP`This program gets installed with bundled setups and annoys the user, by asking for a license for the pro version or doing unwanted actions"

"RAT`This`program allows remote access to the computer which is installed by another person"
"Ransom`This malware encrypts/locks all your files and asks for a ransom in order to decrypt/unlock them"
"Rootkit`A very dangerous type of malware which is frequently installed in the UEFI to monitor the system from a very low level"
"Spyware`This malware steals information from the user such as passwords and banking information"

"Trojan`This malware runs malicious code from an attacker on the targetted computer"
"TrojanDropper`This malware drops and runs another malware, usually more dangerous which can perform any type of action"
"Trojan-Downloader`This malware downloads and runs another malware, which is usually more dangerous than the downloader"

"Trojan-PSW`A variant of spyware, whose only purpose is to steal passwords and logins"
"VirTool`The same as a Constructor, which is used to build other malwares"
"Virus`This malware replicates itself into the system and infects other files"
"Worm`This malware replicates itself into the infected network"
) do for /f "tokens=1* delims=`" %%X in ("%%~A") do if /i "%%~X"=="!mal_type!" (echo.%%~X: %%~Y&&set "found_malware=1")
if "!found_malware!"=="0" (
	echo.Could not find the detection "!mal_type!" in database
)
pause>nul
goto menu