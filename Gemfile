# frozen_string_literal: true

source 'https://rubygems.org'

ruby '2.4.0'

gem 'haml', '~> 5.1', '>= 5.1.2' # The markup language used for the views https://github.com/haml/haml
gem 'puma', '~> 4.1' # the App server https://github.com/puma/puma
gem 'rack', '>= 2.0.6' # the Ruby Webserver Interface https://github.com/rack/rack
gem 'sequel', '~> 5.23' # Database toolkit for Ruby https://github.com/jeremyevans/sequel
gem 'sqlite3', '~> 1.4', '>= 1.4.1'
gem 'tilt', '~> 2.0', '>= 2.0.9' # Interface for Template Engines https://github.com/rtomayko/tilt

group :development, :test do
  # Guard configs for live reloading in Development
  gem 'guard', '~> 2.15'
  gem 'guard-bundler', '~> 2.2', '>= 2.2.1'
  gem 'guard-rack', '~> 2.2', '>= 2.2.1'
end
