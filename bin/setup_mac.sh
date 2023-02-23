# !/bin/bash -eu

# Install brew
if !(type "brew" > /dev/null 2>&1); then
    echo "# Install brew >>>>>>>"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
echo "# brew version: `brew -v`"

echo
echo "# Install casks >>>>>>>"
casks=(
    google-chrome
    google-japanese-ime
    visual-studio-code
    sourcetree
)
for cask in ${casks[@]}
do
    if !(brew ls $cask > /dev/null 2>&1); then
        brew install $cask
    fi
done

echo
echo "# Install brew tools >>>>>>>"
if !(brew ls --versions git > /dev/null 2>&1); then
    echo "# Install git >>>>>>>"
    brew install git
    echo 'export PATH="/usr/local/bin:$PATH"' >> ~/.zshenv
    source ~/.zshenv
fi
echo "# brew git version:"
echo `git --version`

echo
echo "# Show hidden files >>>>>>>"
defaults write com.apple.finder AppleShowAllFiles TRUE
killall Finder
