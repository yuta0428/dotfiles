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

# git
balias greset1 'git reset --soft HEAD^'
balias grevert 'git revert'
balias grevertne 'git revert $1 --no-edit'
balias grevertnc 'git revert $1 --no-commit'
balias gbclean "git branch --merged|egrep -v '\\*|develop|master'|xargs git branch -d"

# rails
balias bi 'bundle install --path vendor/bundle'
balias brs 'bundle exec rails s'
balias brc 'bundle exec rails c'
balias brr 'bundle exec rake routes'
balias brg 'bundle exec rails g'
balias bcre 'bundle exec rake db:create'
balias bmig 'bundle exec rake db:migrate'
balias bseed 'bundle exec rake db:seed'
