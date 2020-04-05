set -eu
echo_and_do () { echo "$1"; eval "$1"; }

## Check installed zsh
if !(type "zsh" > /dev/null 2>&1); then
    echo "zsh: command not found. Please install zsh."
    exit 1
fi

## Finished install zsh
chsh -s $(which zsh)
echo "Set default shell: $SHELL"

## Intall Zinit (for zsh plugin manager)
## https://github.com/zdharma/zinit#installation
if !(type "zinit" > /dev/null 2>&1); then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"
fi

## Setup zshrc
FILE="$HOME/.zshrc"
if [ -e $FILE ];then
    BK=$HOME/.zshrc_bk`date "+%Y%m%d%H%M%S"`
    mv $FILE $BK
    echo "$FILE: File exists.\nBackuped... $BK\n"
fi

echo_and_do "ln -s ~/dotfiles/.zshrc $FILE"

echo
echo "Finished success."
