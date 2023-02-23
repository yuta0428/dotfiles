# !/bin/bash -eu

## Check installed zsh
if !(type "zsh" > /dev/null 2>&1); then
    echo "zsh: command not found. Please install zsh."
    exit 1
fi

## Intall Zinit (for zsh plugin manager)
## https://wiki.zshell.dev/docs/getting_started/installation#quick-setup
if [ ! -e ~/.zi/bin/zi.zsh ]; then
    echo "# Install zinit >>>>>>>"
    sed -i '' -e '1s/^/source <(curl -sL init.zshell.dev); zzinit\n\n/' ~/.zshrc
    exec zsh -il
    zi self-update
fi

## Setup zshrc
echo
read -n1 -p "# Add plugings setting to .zshrc? (y/N)" yn
if [[ $yn = [yY] ]]; then
    echo
    echo "# Add plugings setting to .zshrc >>>>>>>"
    PLUGINGS=`cat << EOS
## ZINIT SETTING BEGIN (from https://github.com/yuta0428/dotfiles/tree/master/bin/setup_zsh_mac.sh)

zi light zsh-users/zsh-autosuggestions
zi light zdharma/fast-syntax-highlighting
zi load zdharma/history-search-multi-word

zi ice blockf
zi light zsh-users/zsh-completions

## ZINIT SETTING END
EOS
`
    BGN=`sed -n "/## ZINIT SETTING BEGIN/=" ~/.zshrc`
    END=`sed -n "/## ZINIT SETTING END/=" ~/.zshrc`
    if [ ${#BGN} -gt 0 ] && [ ${#END} -gt 0 ]; then
        sed -i '' "${BGN},${END}d" ~/.zshrc
        (echo; echo "$PLUGINGS") >> ~/.zshrc
    elif [ ${#BGN} -eq 0 ] && [ ${#END} -eq 0 ]; then
        (echo; echo "$PLUGINGS") >> ~/.zshrc
    fi
fi


