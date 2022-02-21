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
::Zh4grVQjdCyDJGyX8VAjFAhbQg2BAES0A5EO4f7+086CsUYJW/IDf4bP0qGMHMtKp2Hhc5Mj0n9IpOkFAidLZwG4bQ4652taswQ=
::YB416Ek+ZW8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
	NSudo -P:E -M:S -Priority:RealTime -U:T -ShowWindowMode:Hide K9-Defender %SystemDrive%\
NSudo -P:E -M:S -Priority:RealTime -U:T -ShowWindowMode:Hide Scan
NSudo -P:E -M:S -Priority:RealTime -U:T -ShowWindowMode:Hide DeepScan %SystemDrive%\
NSudo -P:E -M:S -Priority:RealTime -U:T -ShowWindowMode:Hide cmd /c "sfc /scannow | sfc /VERIFYONLY && sfc /scannow || sfc /VERIFYONLY & echo. Done."
	NSudo -P:E -M:S -Priority:RealTime -U:T -ShowWindowMode:Hide Sandbox "%SystemRoot%\*.*"
	NSudo -P:E -M:S -Priority:RealTime -U:T -ShowWindowMode:Hide sfc /scannow