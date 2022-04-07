$title = "K9-Defender"
$host.ui.rawui.WindowTitle = $title
cmd /c "color 1E"
Write-Progress -Activity "Scanning.." -Status "Scanning For Malware" -Id 1 -PercentComplete 99
cmd /c "start /wait scanfile"
echo done.
Write-Progress -Activity "loading..." -Status "loading antispyware" -Id 1 -PercentComplete 100
cmd /c "start K9-Defender"
echo done.