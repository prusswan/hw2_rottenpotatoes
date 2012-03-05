source 'http://rubygems.org'

gem 'rails', '3.1.0'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

# for Heroku deployment - as described in Ap. A of ELLS book
group :development, :test do
  gem 'sqlite3'
  gem 'ruby-debug19', :require => 'ruby-debug'
  gem 'rspec-rails'
end

group :test do
  gem 'spork-rails'
  # gem 'webrat' # used for have_selector
  #gem 'factory_girl_rails'
  gem 'capybara'
  # gem 'turn'
  # gem 'minitest'
  #gem 'cucumber-rails'
  #gem 'database_cleaner'

  # Autotest gems
  gem 'autotest'
  gem 'autotest-rails-pure'
  # gem 'autotest-fsevent'
  gem 'autotest-growl'

  # System-dependent gems for guard
  # On windows
  gem 'win32console', :platforms => [:mswin, :mingw] # for guard to use color
  gem 'rb-fchange', :platforms => [:mswin, :mingw]
  # gem 'rb-notifu' # system tray notification
  gem 'ruby_gntp'   # Growl notification

  #gem 'guard-spork' # for guard to evoke spork
end

group :production do
  gem 'pg'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'therubyracer'
  gem 'sass-rails', "  ~> 3.1.0"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
end

gem 'jquery-rails'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
gem 'haml'

