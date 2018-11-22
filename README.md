[ ![Codeship Status for berlin-international-community-church/church-database](https://app.codeship.com/projects/8d3653e0-d29e-0134-b90f-62f830a65715/status?branch=master)](https://app.codeship.com/projects/201794)

# Church Database

The 'Church Database' App is a simple rails address App built with [activeadmin](https://github.com/activeadmin/activeadmin
) to keep track of existing people in church. It interfaces with forms (e.g. Google Forms) to retrieve updates and new people participating.

## Getting Started

To get started you'll need
 * rvm or rbenv

```
rvm use 2.4.0@church --create
gem install bundler
gem install rails
bundle install
bundle exec rake db:migrate
bundle exec rake db:seed
bundle exec rails s
```

The App should run on http://localhost:3000/admin

### Prerequisites

* Ruby 2.4.0
* Rails 5
* MySQL or Postgres

## Running the tests

We use Rspec in our tests. So to run it follow these steps:

```
rvm use 2.4.0@church --create
gem install bundler
bundle install
bundle exec rake db:migrate
bundle exec rspec spec/
```

## Deployment

Add additional notes about how to deploy this on a live system

## Built With


## Contributing

Please read [CONTRIBUTING.md](https://gist.github.com/PurpleBooth/b24679402957c63ec426) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/your/project/tags).

## Configuration
We use a lot of environment variables to configure this app. Here is the list of vars names:

* DATABASE_NAME
* DATABASE_USER
* DATABASE_PASSWORD
* RAILS_MAX_THREADS - we use this to determine the number used for the database's connection pool.
* SMTP_ADDRESS
* SMTP_PORT
* SMTP_DOMAIN
* SMTP_USER
* SMTP_PASSWORD
* SENTRY - The Sentry DSN string
* SECRET_KEY_BASE - Rails secret string

## Authors
* Giulliano Bueno
* Jonathan Wiens

## License
The MIT License

Further resources on the MIT License
Copyright (c) 2017 Berlin International Community Church e.V.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

## Acknowledgments

* BICC developers
* Our pastor
