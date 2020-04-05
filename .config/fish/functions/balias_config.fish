# This file must be read after ~/.config/fish/functions/balias.fish

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
