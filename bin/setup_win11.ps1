# How to use
## PS:> powershell -ExecutionPolicy Unrestricted ./setup_win11.ps1

# Setting
## "登録されている拡張子は表示しない" チェックOFF
Set-ItemProperty HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -name "HideFileExt" -Value 0

## "隠しファイル、隠しフォルダ、および隠しドライブを表示する" チェックON
Set-ItemProperty HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -name "Hidden" -Value 1

Stop-Process -ProcessName explorer

# Input Setting
Write-Output ">> WindowsのキーボードをMac風にする方法 : https://ringo-hack.com/mac/windows-mac-keyboard-style/"
Pause
