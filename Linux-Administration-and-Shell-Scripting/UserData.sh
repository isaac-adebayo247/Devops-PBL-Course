#!/bin/bash

cat /etc/os-release | grep “debian”
if [ $? -eq 0 ]; then
  sudo apt update
	sudo apt install apache2
	sudo systemctl enable apache2
	sudo systemctl start apache2
	sudo apt install -y zip
	sudo mkdir -p /tmp/webfiles
	cd /tmp/webfiless
	sudo wget https://www.tooplate.com/zip-templates/2133_moso_interior.zip 
	unzip 2133_moso_interior.zip &> /dev/null
	sudo mkdir -p /var/www/html
	sudo cp -rf ./2133_moso_interior/* /var/www/html/
	sudo rm -rf ./*
	sudo systemctl restart apache2
else
	sudo yum install httpd -y
	sudo systemctl enable httpd
	sudo systemctl start httpd
	sudo yum install -y zip
	mkdir -p /tmp/webfiles
	cd /tmp/webfiles
	sudo wget https://www.tooplate.com/zip-templates/2133_moso_interior.zip   
	sudo unzip 2133_moso_interior.zip &> /dev/null
	sudo mkdir -p /var/www/html/
	sudo cp -rf 2133_moso_interior/* /var/www/html
	sudo rm -rf ./*
	sudo systemctl restart httpd
fi
