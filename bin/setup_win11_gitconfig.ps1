# How to use
## PS:> powershell -ExecutionPolicy Unrestricted ./setup_win11_gitconfig.ps1

# Global
git config --global user.name "yuta0428"
git config --global user.email "yuta_okamoto428@yahoo.co.jp"

# System
## Windows: C:\Program Files\Git\etc\gitconfig
sudo git config --system credential.helper manager

## WSL2: /etc/gitconfig
wsl sudo git config --system credential.helper "/mnt/c/Program\\ Files/Git/mingw64/bin/git-credential-manager.exe"

### https://github.com/zsh-users/zsh-autosuggestions/issues/557
wsl sudo git config --system core.autocrlf false
wsl sudo git config --system core.eol false
