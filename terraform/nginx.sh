#! /bin/bash
sudo apt-get install -y nginx
sudo systemctl enable nginx
sudo systemctl start nginx
echo "hello world" > /var/www/html/index.html