# frozen_string_literal: true
source "https://rubygems.org"

ruby '2.4.0'

gem 'rack'
gem 'puma'
gem 'slim'
gem 'tilt'
gem 'sequel'

group :development, :test do
  gem 'sqlite3'
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end
