# This setup script will only work with "fish" shell.
# If you don't have "fish", please install it and run it. https://fishshell.com/
# Usage:
#   sh dotfiles/bin/setup_fish.sh or fish dotfiles/bin/_setup_fish.fish

function echo_and_do
    echo $argv[1]
    eval $argv[1]
end

## Finished install fish
chsh -s (which fish)
echo "Set default shell: $SHELL"

## Check fish shell
echo (fish -v)

## Intall fisher (for fish plugin manager)
## https://github.com/jorgebucaran/fisher#installation
if not type -q "fisher"
    curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
end
echo (fisher -v)
echo

### Added by fisher's installer
set ADD_PLUGINS jethrokuan/z fisherman/spin 0rax/fish-bd

set uname_s (uname -s)
if test (uname) = 'Darwin'
    set ADD_PLUGINS $ADD_PLUGINS oh-my-fish/plugin-peco
    echo_and_do "ln -s ~/dotfiles/.config/fish/config_local_osx.fish ~/dotfiles/.config/fish/config_local.fish"
else if [ (string sub -s 1 -l 5 $uname_s) = 'Linux' ]
    echo "Your platform "(uname -a)" is not supported."
else if [ (string sub -s 1 -l 10 $uname_s) = 'MINGW32_NT' ]
    echo "Your platform "(uname -a)" is not supported."
else
    echo "Your platform "(uname -a)" is not supported."
end

set ADD_PLUGINS $ADD_PLUGINS oh-my-fish/plugin-balias
echo_and_do "ln -s $HOME/dotfiles/.config/fish/functions/balias_config.fish $HOME/.config/fish/functions/balias_config.fish"

fisher add $ADD_PLUGINS
### End of fisher's installer chunk

## Setup config.fish
set FILE "$HOME/.config/fish/config.fish"
if test -f $FILE
    set BK $HOME/.config/fish/config_bk(date "+%Y%m%d%H%M%S").fish
    mv $FILE $BK
    echo "$FILE: File exists.\nBackuped... $BK\n"
end
echo_and_do "ln -s $HOME/dotfiles/.config/fish/config.fish $FILE"

## Setup fish_prompt.fish
echo_and_do "ln -s $HOME/dotfiles/.config/fish/functions/fish_prompt.fish $HOME/.config/fish/functions/fish_prompt.fish"

echo
echo "Finished success."
