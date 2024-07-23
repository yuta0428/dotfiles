# dotfiles

## Setup(Windows)
**Prerequisites**
- Install Git
```ps1
winget install Git.Git
```

**Run by /bin/****
- on PowerShell
```ps1
Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned

# First setup
powershell ./bin/setup_win11.ps1

# Required applicaiton
powershell ./bin/setup_win11_app.ps1

# .gitconfig setting
powershell ./bin/setup_win11_gitconfig.ps1

# WSL setting
powershell ./bin/setup_win11_wsl.ps1
```

- on WSL

```sh
# Zsh setting
./bin/setup_win11_zsh.sh
```

## starship
**Windows(and WSL)**
- on PowerShell
```ps1
powershell ./bin/setup_win11_starship.ps1
```

**Mac**
- NotImplemented

**Change Window Title**
- https://starship.rs/advanced-config/#change-window-title

- .zshrc
```sh
function set_win_title(){
    echo -ne "\033]0; $(basename "$PWD") \007"
}
precmd_functions+=(set_win_title)
```

- `$HOME\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1`
```ps1
function Invoke-Starship-PreCommand {
  $host.ui.RawUI.WindowTitle = $(Split-Path -Path (Get-Location) -Leaf)
}
Invoke-Expression (&starship init powershell)
```

## Zsh history
- .zshrc
```sh
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
# setopt appendhistory
setopt inc_append_history
setopt share_history
setopt hist_ignore_dups
setopt hist_no_store
```
- `setopt appendhistory`: セッションを終了する際に、そのセッションで実行されたコマンドを履歴ファイル（通常は ~/.zsh_history）に追加します。セッション終了時に履歴がファイルに追記されるため、異なるセッション間で履歴が上書きされることはありません。
- `setopt inc_append_history`: シェルを横断して.zsh_historyに記録
- `setopt share_history`: リアルタイムで履歴を共有します。つまり、一つのターミナルセッションで実行されたコマンドは、他のすべてのアクティブなセッションに即座に反映されます。
- `setopt hist_ignore_dups`: 直前と同じコマンドの場合は履歴に追加しない
- `setopt hist_no_store`: history (fc -l) コマンドをヒストリリストから取り除く。

## Switch git.exe(Solutions for Slow git.exe Performance)
- .zshenv
```sh
# Switch git.exe: https://nnao45.hatenadiary.com/entry/2021/02/12/134852
function git {
  if [[ $PWD == /mnt/* ]]; then
    git.exe "$@"
  else
    /usr/bin/git "$@"
  fi
}
```

## Change home directory
- .zshrc
```sh
# wslvar: required wslu
cd "/mnt/c/Users/$(wslvar USERNAME)"
```

## Fonts
- https://github.com/yuru7/HackGen/releases
