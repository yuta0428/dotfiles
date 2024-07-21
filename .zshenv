. "$HOME/.cargo/env"

# Switch git.exe: https://nnao45.hatenadiary.com/entry/2021/02/12/134852
function git {
  if [[ $PWD == /mnt/* ]]; then
    git.exe "$@"
  else
    /usr/bin/git "$@"
  fi
}