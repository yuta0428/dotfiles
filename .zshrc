# Created by newuser for 5.8.1

# https://zenn.dev/tarotene/articles/013acdcb8e5542
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
# setopt appendhistory
setopt inc_append_history
setopt share_history
setopt hist_ignore_dups
setopt hist_no_store

eval "$(sheldon source)"

function set_win_title(){
    echo -ne "\033]0; $(basename "$PWD") \007"
}
precmd_functions+=(set_win_title)
eval "$(starship init zsh)"

# wslvar: required wslu
cd "/mnt/c/Users/$(wslvar USERNAME)"