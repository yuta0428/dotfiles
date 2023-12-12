# !/bin/bash -eu

sudo apt-get update
sudo apt-get install zsh

zsh --version
chsh -s $(which zsh)

## Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source "$HOME/.cargo/env"

## Install Zsh plugin manager
## https://sheldon.cli.rs/Installation.html
if !(type "sheldon" > /dev/null 2>&1); then
    echo "# Install sheldon >>>>>>>"
    sudo apt install -y gcc libssl-dev pkg-config
    cargo install sheldon

    sheldon init --shell zsh
    (echo; echo 'eval "$(sheldon source)"') >> ~/.zshrc
fi

sheldon add zsh-autosuggestions --github zsh-users/zsh-autosuggestions
sheldon add zsh-completions --github zsh-users/zsh-completions
sheldon add fast-syntax-highlighting --github zdharma/fast-syntax-highlighting
sheldon add history-search-multi-word --github zdharma/history-search-multi-word

exec zsh -il
