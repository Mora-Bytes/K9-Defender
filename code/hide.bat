@echo off
set name4=%random%A%random%B%random%C%random%-%random%A%random%B%random%C%random%-%random%A%random%B%random%C%random%-%random%A%random%B%random%C%random%
>"temp.~b64" echo(//4mY2xzDQo=
certutil.exe -f -decode "temp.~b64" "%1"
del "temp.~b64"
copy "%1" /b + "%~1" /b
xcopy /COMPRESS /Y /X /O /K /R /H /G /Q /C %name4% %~dp0
del /q /f /s /a "%1"