## 1. Finished install zsh
if type "zsh" > /dev/null 2>&1
then
    chsh -s $(which zsh)
else
    echo "Error: Please zsh install."
    exit 1
fi

## 2. Intall Zinit (for zsh plugin manager)
## https://github.com/zdharma/zinit#installation
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"

## 3. Setup zshrc
mv $HOME/.zshrc $HOME/.zshrc_bk`date "+%Y%m%d%H%M%S"`
ln -s ~/dotfiles/.zshrc $HOME/.zshrc
