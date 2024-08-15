source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.3"

gem 'rails', "~> 7.0.4", ">= 7.0.4.3"
gem 'sprockets-rails'
gem 'sqlite3', '~> 1.4'
gem 'puma', '~> 5.0'
gem 'importmap-rails', '~> 2.0.1'
gem 'turbo-rails', '~> 2.0.6'
gem 'stimulus-rails', '~> 1.3.3'
gem 'jbuilder'
gem 'sassc-rails', '2.1.2'
gem 'rails-controller-testing'
gem 'bcrypt', '3.1.13'
gem 'rails-i18n', '7.0.9'

# Use Redis adapter to run Action Cable in production
# gem "redis", "~> 4.0"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows ではタイムゾーン情報用の tzinfo-data gem を含める必要がある
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Use Sass to process CSS
# gem "sassc-rails"

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem "minitest-reporters", "1.7.1"
end

group :development do
  gem "web-console"
  gem 'win32console', '~> 1.3', '>= 1.3.2'

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
  gem "guard",          "2.18.1"
  gem "guard-minitest", "2.4.5"
end
