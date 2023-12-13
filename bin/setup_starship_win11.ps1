# Install starship
# https://starship.rs/guide/#%F0%9F%9A%80-installation
if (-Not (Get-Command "starship" -ErrorAction SilentlyContinue)) {
    Write-Host "# Install starship >>>>>>>"
    winget install Starship.Starship

    $profilePath = "$HOME\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"
    if (-Not (Test-Path $profilePath)) {
        New-Item -Path $profilePath -ItemType File
        Add-Content -Path $profilePath -Value "Invoke-Expression (&starship init powershell)"
    }
}

Write-Host "# starship version:"
starship --version

# Add .config/starship.toml
Write-Host ""
$yn = Read-Host "# Add .config/starship.toml? (y/N)"
if ($yn -eq "y" -or $yn -eq "Y") {
    Write-Host "# Add .config/starship.toml >>>>>>>"
    $starshipTomlUrl = "https://raw.githubusercontent.com/yuta0428/dotfiles/master/.config/starship.toml"
    $starshipTomlPath = "$HOME/.config/starship.toml"
    New-Item -ItemType Directory -Path "$HOME/.config" -Force
    Invoke-WebRequest -Uri $starshipTomlUrl -OutFile $starshipTomlPath
}