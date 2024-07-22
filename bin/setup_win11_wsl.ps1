# How to use
## PS:> powershell -ExecutionPolicy Unrestricted ./setup_win11_wsl.ps1

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
wsl ln -s /mnt/c/Users/$(/mnt/c/Windows/System32/cmd.exe /c "<nul set /p=%UserName%" 2>/dev/null)/.gitconfig ~/.gitconfig

wsl touch /mnt/c/Users/$(/mnt/c/Windows/System32/cmd.exe /c "<nul set /p=%UserName%" 2>/dev/null)/.git-credentials
wsl ln -s /mnt/c/Users/$(/mnt/c/Windows/System32/cmd.exe /c "<nul set /p=%UserName%" 2>/dev/null)/.git-credentials ~/.git-credentials

# wslvar
wsl sudo apt install wslu