# !/bin/bash -eu

sudo apt-get update
sudo apt-get install zsh

zsh --version
chsh -s $(which zsh)
exec zsh -il

## Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source "$HOME/.cargo/env"

## Install Zsh plugin manager
## https://sheldon.cli.rs/Installation.html
sudo apt install -y gcc libssl-dev pkg-onfig
cargo install sheldon

sheldon init --shell zsh
eval "$(sheldon source)"
echo "Add the following line to '~/.zshrc' etc. to load Sheldon when the shell starts."
echo '    eval "$(sheldon source)"'

sheldon add zsh-autosuggestions --github zsh-users/zsh-autosuggestions
sheldon add zsh-completions --github zsh-users/zsh-completions
sheldon add fast-syntax-highlighting --github zdharma/fast-syntax-highlighting
sheldon add history-search-multi-word --github zdharma/history-search-multi-word
