source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.0'
# Use sqlite3 as the database for Active Record	±
# Use SCSS for stylesheets
gem 'rails_12factor', group: :production
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
gem 'sprockets-rails', :require => 'sprockets/railtie'
gem 'skrollr-rails'

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc
# Gem used for user authorization
gem 'devise', '~> 3.5.1'
# Upload Pictures, used for Print image, User avatar, and Product image
gem 'paperclip', '~> 4.3.0'
# For styling Css and Javascript
gem 'bootstrap-sass', '~> 3.3.5.1'
# Bootstrap Forms
gem 'bootstrap_form', '~> 2.3.0'
gem 'angularjs-rails', '~> 1.2.25'
gem 'responders', '~> 2.0'
gem 'carrierwave'
gem 'foreman', '~> 0.78.0'

#for autotesting feature
gem 'ZenTest', '~> 4.11.0'
gem 'autotest-rails', '~> 4.2.1'
gem 'autotest-fsevent', '~> 0.2.10'
gem 'autotest-growl', '~> 0.2.16'


# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'
gem 'aws-sdk', '~> 1.6'
gem 'fog'
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
group :production do
	gem 'pg'
end

group :development do
	gem 'sqlite3'

end

group :development, :test do

  gem 'rspec-rails', '~> 3.3.3'
  gem 'factory_girl_rails', '~> 4.5.0'
  gem 'shoulda-matchers'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :test do
  gem 'mocha', '~> 1.1.0'
  gem 'database_cleaner', '~> 1.4.1'
  gem 'as-duration', '~> 0.1.0'
  gem 'rspec-rails', '~> 3.3.3'
  gem 'faker', '~> 1.5.0'
  gem 'capybara', '~> 2.5.0'
  gem 'guard-rspec', '~> 4.6.4'
  gem 'launchy', '~> 2.4.3'
end

