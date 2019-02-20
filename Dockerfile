FROM ruby:2.4 as base

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

WORKDIR /usr/src/app

COPY . .

COPY Gemfile Gemfile.lock ./
RUN gem install bundler && \
  gem install rails && \
  bundle config --delete frozen && \
  bundle install && \
  bundle exec rake db:migrate --trace && \
  bundle exec rake db:seed --trace

CMD ["bundle exec rails s"]
