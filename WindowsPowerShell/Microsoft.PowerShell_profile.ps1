function Invoke-Starship-PreCommand {
  $host.ui.RawUI.WindowTitle = $(Split-Path -Path (Get-Location) -Leaf)
}
Invoke-Expression (&starship init powershell)