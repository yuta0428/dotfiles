set -eu

## Check installed zsh
if !(type "zsh" > /dev/null 2>&1); then
    echo "Error: Please zsh install."
    exit 1
fi

## Finished install zsh
chsh -s $(which zsh)

## Intall Zinit (for zsh plugin manager)
## https://github.com/zdharma/zinit#installation
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"

## Setup zshrc
FILE="$HOME/.zshrc"
if [ -e $FILE ];then
    mv $HOME/.zshrc $HOME/.zshrc_bk`date "+%Y%m%d%H%M%S"`
fi
ln -s ~/dotfiles/.zshrc $FILE
