# FYI:
#  https://yujiorama.hatenablog.com/entry/2019/07/22/095214
# Require:
#  Git for Windows: https://gitforwindows.org/
#  Git for Windows SDK: https://github.com/git-for-windows/git-sdk-64
#    $ git clone --depth=1 https://github.com/git-for-windows/git-sdk-64 gfw-sdk

set -eu

# Setup pacman
GIT_SDK_ROOT=~/Downloads/gfw-sdk
GIT_BASH_ROOT="/c/Program Files/Git"

echo "GIT_SDK_ROOT="$GIT_SDK_ROOT
echo "GIT_BASH_ROOT="$GIT_BASH_ROOT

cp "${GIT_SDK_ROOT}"/usr/bin/pacman* "${GIT_BASH_ROOT}"/usr/bin/
cp -a "${GIT_SDK_ROOT}"/etc/pacman.* "${GIT_BASH_ROOT}"/etc/
mkdir -p "${GIT_BASH_ROOT}"/var/lib/
cp -a "${GIT_SDK_ROOT}"/var/lib/pacman "${GIT_BASH_ROOT}"/var/lib/
cp -a "${GIT_SDK_ROOT}"/usr/share/makepkg/util* "${GIT_BASH_ROOT}"/usr/share/makepkg/

pacman --database --check

curl -L https://raw.githubusercontent.com/git-for-windows/build-extra/master/git-for-windows-keyring/git-for-windows.gpg \
| pacman-key --add - \
&& pacman-key --lsign-key 1A9F3986

# Install fish and dependencies packages
pacman -S pcre2
pacman -S libpcre2_16
pacman -S mingw-w64-x86_64-pcre2
pacman -S fish
pacman -S fzy

# If `fish` command error has occurred:
#   error while loading shared libraries: msys-stdc++-6.dll: cannot open shared object file: No such file or directory
# To typed command.
#   cp "${GIT_SDK_ROOT}"/usr/bin/msys* "${GIT_BASH_ROOT}"/usr/bin/