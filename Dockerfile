FROM ruby:2.4 as base

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

WORKDIR /usr/src/app

COPY . .

COPY Gemfile Gemfile.lock ./

CMD ["./start.sh"]
