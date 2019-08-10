# frozen_string_literal: true

source 'https://rubygems.org'

ruby '2.4.0'

gem 'haml', '~> 5.1', '>= 5.1.2'
gem 'puma', '~> 4.1'
gem 'rack', '>= 2.0.6'
gem 'sequel', '~> 5.23'
gem 'tilt', '~> 2.0', '>= 2.0.9'

group :development, :test do
  gem 'guard', '~> 2.15'
  gem 'guard-bundler', '~> 2.2', '>= 2.2.1'
  gem 'guard-rack', '~> 2.2', '>= 2.2.1'
  gem 'pry', '~> 0.12.2'
  gem 'sqlite3', '~> 1.4', '>= 1.4.1'
end

group :production do
  gem 'pg', '>= 0.18'
end
