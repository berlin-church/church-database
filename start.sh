#! /bin/sh

gem install bundler
gem install rails
bundle config --delete frozen
bundle install
bundle exec rake db:migrate --trace
bundle exec rake db:seed --trace

bundle exec rails s
