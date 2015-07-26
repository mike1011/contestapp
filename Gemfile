source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.3'


ruby "2.2.2"
group :production do
  gem "rails_12factor"
  gem "pg"
end


gem "chartkick"
gem 'prawn-rails'

# gem "rqrcode"
gem 'rqrcode_png'  

#for sending delayed mails
gem "sidekiq"
gem "sinatra", require: false
gem "slim"


#added for new offers having image,video
gem "paperclip" #, "3.5.1"
gem 'aws-sdk', '< 2.0'
gem "paperclip-ffmpeg"
gem 'rmagick'

# Use sqlite3 as the database for Active Record
group :development, :test do
  gem "sqlite3"
  gem "foreman"
  gem "letter_opener"
  gem "thin"

  # Helpful gems
  gem "better_errors" # improves error handling
  gem "binding_of_caller" # used by better errors
  # Testing frameworks
  gem 'rspec-rails' # testing framework
  gem "factory_girl_rails" # use factories, not fixtures
  gem "capybara" # simulate browser activity
  gem "fakeweb"
  
  # Automated testing
  gem 'guard' # automated execution of test suite upon change
  gem "guard-rspec" # guard integration with rspec
  # Only install the rb-fsevent gem if on Max OSX
  gem 'rb-fsevent' # used for Growl notifications
end

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

gem 'therubyracer','0.9.9'
gem "twitter-bootstrap-rails"
gem "bootstrap-sass"
gem 'shopify_api'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
# gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
