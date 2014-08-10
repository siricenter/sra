# //@annotation:tour gemfile
source 'https://rubygems.org'

gem 'rails', '3.2.16'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

group :production do
	gem 'pg'
end
group :development, :test do
	gem 'mysql2'								# Allows Rails to interact with MySQL
end
gem 'devise'								# Manages authentication (loggin in) for us
gem 'cancan'								# Manages authorization (permissions) for us

gem 'haml'									# HTML done right
gem 'therubyracer'							# JavaScript runtime so CoffeeScript can compile to JavaScript
gem 'bootstrap-sass'						# Installs bootstrap for us. We're transitioning away from bootstrap

gem 'nutritionix'						# Allows us to access an open nutritional API

# Gems used only for assets and not required
# in production environments by default.
group :assets do
	gem 'sass-rails',   '~> 3.2.3'			# CSS done right
	gem 'coffee-rails', '~> 3.2.1'			# JavaScript done right

	# See https://github.com/sstephenson/execjs#readme for more supported runtimes
	# gem 'therubyracer', :platforms => :ruby

	gem 'uglifier', '>= 1.0.3'				# Minimizes our JavaScript so it loads faster
end

group :test do 
	gem 'cucumber-rails', require: false	# Integration testing framework that lets us write tests in plain English
	gem 'database_cleaner'					# Cleans the test databases after every test
	gem 'faker'								# Generates names, emails, and other stuff for our tests.

	gem 'capybara'							# Lets us programmatically interact with a test browser
	gem 'poltergeist'
	# These gems are commented out because I can't make them play nice with Codio yet.
	#gem 'selenium-webdriver'				# Makes our test browser a Firefox instance. Slow loading.
	#gem 'capybara-webkit'					# Makes our test browswer a headless Webkit instance. Faster loading.
end

group :test, :development do
	gem 'factory_girl_rails'				# Generates valid objects for us to test
	gem 'rspec-rails', '~> 2.14.2'						# Unit testing framework that isn't plain English, but very English-y
end

group :development do 
	gem 'annotate'							# Inserts comments into our models that describe their database schema
end

gem 'jquery-rails'							# Installs JQuery for us

# //@annotation:/tour gemfile

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
group :development do
	#gem 'debugger'
end
ruby '2.0.0'
gem 'thin'
