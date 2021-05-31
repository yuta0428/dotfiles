## Getting Started
#### Prerequisites
- Git, curl installed and enabled in terminal.

#### Clone the dotfiles repository
```
cd ~ && git clone https://github.com/yuta0428/dotfiles.git
```


## zsh
#### Prerequisites
- zsh installed in terminal.
- https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH#how-to-install-zsh-on-many-platforms

#### Set up zsh in your shell.
```
sh ~/dotfiles/bin/setup_zsh.sh
```

A symbolic link will be created in the following file.
- `.zshrc`

## fish
#### Prerequisites
- fish installed in terminal.
- https://fishshell.com/

#### Set up fish in your shell.
```
sh ~/dotfiles/bin/setup_fish.sh
```

A symbolic link will be created in the following files.
- `.config/fish/*.fish`

## starship(~0.45)
#### Set up starship in your shell.
```
sh ~/dotfiles/bin/setup_starship.sh
```

A symbolic link will be created in the following file.
- `.config/starship.toml`


#### Add the following to the end of shell configuration
- ~/.bashrc:
```
eval "$(starship init bash)"
```
- ~/.config/fish/config.fish:
```
starship init fish | source
```
- ~/.zshrc:
```
eval "$(starship init zsh)"
```
