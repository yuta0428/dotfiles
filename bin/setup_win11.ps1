# How to use
## PS:> powershell -ExecutionPolicy Unrestricted ./setup_win11.ps1

# Setting
## "登録されている拡張子は表示しない" チェックOFF
Set-ItemProperty HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -name "HideFileExt" -Value 0

## "隠しファイル、隠しフォルダ、および隠しドライブを表示する" チェックON
Set-ItemProperty HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -name "Hidden" -Value 1

Stop-Process -ProcessName explorer

# Application
## Google JapaneseIME
## This has a bug that does not work. https://github.com/microsoft/winget-pkgs/issues/92434
## MicroSoft IME is good enough. https://ringo-hack.com/mac/windows-mac-keyboard-style/
# winget install Google.JapaneseIME

## Dev Home
winget install --id Microsoft.DevHome -e

## WindowsTerminal
winget install Microsoft.WindowsTerminal

## Git
winget install Git.Git

## Visual Studio Code
winget install Microsoft.VisualStudioCode

# WSL2
wsl --install
Write-Output ">> ubuntu user一覧 '$wsl compgen -u'"
wsl compgen -u
$confirmation = Read-Host -Prompt ">> デフォルトユーザーを追加しますか？ (Y/n)"
if ($confirmation -eq "Y" -or $confirmation -eq "y") {
    $username = Read-Host -Prompt ">> username: "
    wsl adduser $username
    wsl sudo passwd $username
    wsl sudo gpasswd -a $username sudo
    ubuntu config --default-user $username
}

# Change Editor Nano -> Vim
sudo update-alternatives --config editor

# Git
# https://zenn.dev/horatjp/articles/windows-dev-env#git
wsl touch /mnt/c/Users/$(/mnt/c/Windows/System32/cmd.exe /c "<nul set /p=%UserName%" 2>/dev/null)/.gitconfig
wls ln -s /mnt/c/Users/$(/mnt/c/Windows/System32/cmd.exe /c "<nul set /p=%UserName%" 2>/dev/null)/.gitconfig ~/.gitconfig

wsl touch /mnt/c/Users/$(/mnt/c/Windows/System32/cmd.exe /c "<nul set /p=%UserName%" 2>/dev/null)/.git-credentials
wsl ln -s /mnt/c/Users/$(/mnt/c/Windows/System32/cmd.exe /c "<nul set /p=%UserName%" 2>/dev/null)/.git-credentials ~/.git-credentials

# Input Setting
Write-Output ">> WindowsのキーボードをMac風にする方法 : https://ringo-hack.com/mac/windows-mac-keyboard-style/"
Pause

# Restart
Write-Output "再起動します"
Pause
Restart-Computer