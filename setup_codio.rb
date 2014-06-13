def bundle_install
	`cd ~/workspace`
	`bundle install`
end

def install_mysql
	`parts install mariadb`
	`parts start mariadb`
end

install_mysql
install_mongo
bundle_install
