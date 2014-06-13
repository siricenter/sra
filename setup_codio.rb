#!/usr/bin/env ruby
def bundle_install
	puts `cd ~/workspace`
	puts `bundle install`
end

def install_mysql
    puts `parts install mariadb`
    puts `parts stop mariadb`
	puts `parts start mariadb`
end

def install_mongo
	puts `parts install mongodb`
    puts `parts stop mongodb`
    puts `parts start mongodb`
end

def setup_database
    puts `mysql -u root < setup_database.sh`
	puts `rake db:migrate`
    puts `rake db:seed`
end

def start_server
    puts `cd ~/workspace`
    puts `rails server -d`
end

install_mysql
install_mongo
bundle_install
setup_database
start_server