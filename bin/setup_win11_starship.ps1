# How to use
## PS:> powershell -ExecutionPolicy Unrestricted ./setup_win11_starship.ps1

# Install starship
# https://starship.rs/guide/#%F0%9F%9A%80-installation
if (-Not (Get-Command "starship" -ErrorAction SilentlyContinue)) {
    Write-Host "# Install starship >>>>>>>"
    winget install Starship.Starship

    $profilePath = "$HOME\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"
    if (-Not (Test-Path $profilePath)) {
        New-Item -Path $profilePath -ItemType File -Force
        Copy-Item -Path "./WindowsPowerShell/Microsoft.PowerShell_profile.ps1" -Destination $profilePath -Force
        & $profilePath
    }
}

Write-Host "# starship version:"
starship --version

# Add .config/starship.toml
Write-Host ""
$yn = Read-Host "# Add .config/starship.toml? (y/N)"
if ($yn -eq "y" -or $yn -eq "Y") {
    Write-Host "# Add .config/starship.toml >>>>>>>"
    $fromPath = "./.config/starship.toml"
    $toPath = "$HOME/.config/starship.toml"
    New-Item -ItemType Directory -Path "$HOME/.config" -Force
    Copy-Item -Path $fromPath -Destination $toPath -Force
}


## WSL2
# curl -sS https://starship.rs/install.sh | sh
# ln -s $(wslpath $starshipTomlPath) ~/.config/starship.toml
