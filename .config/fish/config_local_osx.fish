# This is a configuration file for each PC.

# anyenv
set -x PATH $HOME/.anyenv/bin $PATH

# nodenv
set -x NODENV_ROOT $HOME/.anyenv/envs/nodenv
set -x PATH $HOME/.anyenv/envs/nodenv/bin $PATH
set -x PATH $NODENV_ROOT/shims $PATH

# peco
function fish_user_key_bindings
  bind \cr 'peco_select_history (commandline -b)'
end
