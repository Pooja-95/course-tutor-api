source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.5"

gem "rails", "~> 7.0.8"

gem "pg", "~> 1.1"

gem "puma", "~> 5.0"

gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

gem "bootsnap", require: false
gem 'active_model_serializers'
gem 'faker'

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  # gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails', '~> 5.0'
  gem 'factory_bot_rails'
  gem 'simplecov', '0.17'

end

group :test do
  gem 'database_cleaner'
  gem 'shoulda-matchers', '~> 5.0'
end
