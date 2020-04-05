set -eu
echo_and_do () { echo "$1"; eval "$1"; }

## Install starship
## https://github.com/starship/starship#-installation
if !(type "starship" > /dev/null 2>&1); then
    curl -fsSL https://starship.rs/install.sh | bash
fi

## Setup starship
FILE="$HOME/.config/starship.toml"
if [ -e $FILE ];then
    BK=$HOME/.config/starship_bk`date "+%Y%m%d%H%M%S"`.toml
    mv $FILE $BK
    echo "$FILE: File exists.\nBackuped... $BK\n"
fi
if [ "$(uname)" == 'Darwin' ]; then
    echo_and_do "ln -s ~/dotfiles/.config/starship_osx.toml $FILE"
elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
    echo "Your platform ($(uname -a)) is not supported."
    exit 1
elif [ "$(expr substr $(uname -s) 1 10)" == 'MINGW32_NT' ]; then
    echo "Your platform ($(uname -a)) is not supported."
    exit 1
else
    echo "Your platform ($(uname -a)) is not supported."
    exit 1
fi

echo
echo "Finished success."
