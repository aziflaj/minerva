# frozen_string_literal: true

source 'https://rubygems.org'

ruby '2.4.0'

gem 'rack', '>= 2.0.6'
gem 'puma', '~> 4.1'
gem 'slim', '~> 4.0', '>= 4.0.1'
gem 'tilt', '~> 2.0', '>= 2.0.9'
gem 'sequel', '~> 5.23'

group :development, :test do
  gem 'sqlite3', '~> 1.4', '>= 1.4.1'
end

group :production do
  gem 'pg', '>= 0.18'
end
