# frozen_string_literal: true
source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

ruby '2.6.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.2'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails', '~> 4.3'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

gem "active_material", github: "vigetlabs/active_material"

gem 'devise', '~> 4.6.2'

# Sentry
gem "sentry-raven", '~> 2.7.4'

gem 'countries', '~> 2.1.4'

# For country lists in forms
gem 'country_select', '~> 3.1.1'

gem 'activeadmin', git: 'https://github.com/activeadmin/activeadmin'
gem 'inherited_resources', git: 'https://github.com/activeadmin/inherited_resources'

gem 'capistrano-rails', '~> 1.4'

# Use Puma as the app server
gem 'puma', '~> 3.0'

gem 'active_admin_role', '~> 0.2.1'
gem 'rack-cors', :require => 'rack/cors'

gem 'resque', '~> 2.0.0'
gem 'discard', '~> 1.0'
gem 'doorkeeper', '~> 5.1.0'

group :development, :test do
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3', '~> 1.3'
  gem 'shoulda-matchers', '~> 3.1'
  gem 'guard-rspec', '~> 4.7', require: false
  gem 'annotate', '~> 2.7'
end

group :development do
  gem 'therubyracer', '~> 0.12'
  gem 'byebug', '~> 10.0'
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'listen', '~> 3.0.5'
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring', '~> 2.0'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'factory_bot_rails', '~> 4.11'
  gem 'rspec', '~> 3.8'
  gem 'rspec-rails', '~> 3.8'
end

group :production do
  gem 'pg', '~> 1.1'
end
