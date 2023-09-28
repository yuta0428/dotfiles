# !/bin/bash -eu

# Install starship
# https://starship.rs/guide/#%F0%9F%9A%80-installation
if !(type "starship" > /dev/null 2>&1); then
    echo "# Install starship >>>>>>>"
    curl -sS https://starship.rs/install.sh | sh
    (echo; echo 'eval "$(starship init zsh)"') >> ~/.zshrc
fi
echo "# starship version:"
echo `starship --version`

# Add .config/starship.toml
echo
read -n1 -p "# Add .config/starship.toml? (y/N)" yn
if [[ $yn = [yY] ]]; then
    echo "# Add .config/starship.toml >>>>>>>"
    curl --create-dirs --output .~/.config/starship.toml \
        https://raw.githubusercontent.com/yuta0428/dotfiles/master/.config/starship.toml
fi
echo