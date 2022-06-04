# CentOS 7
# 1 GB RAM - 1 CPU Core
# 20 GB Storage
# PHP 7.4 & CHANGE PORT 22 TO 2323

yum -y install nano firewalld

# SSH CONFIG OPEN PORT 2323
nano /etc/ssh/sshd_config
semanage port -a -t ssh_port_t -p tcp 2323
systemctl restart sshd.service

# FIREWALL PORT

systemctl enable firewalld
systemctl start firewalld
firewall-cmd --permanent --zone=public --add-port=2323/tcp
firewall-cmd --reload

# PHP 7.4

yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
yum -y install https://rpms.remirepo.net/enterprise/remi-release-7.rpm
yum -y install yum-utils
yum-config-manager --enable remi-php74
yum -y update
yum -y install php php-cli php-fpm php-mysqlnd php-zip php-devel php-gd php-mcrypt php-mbstring php-curl php-xml php-pear php-bcmath php-json

# Install composer
wget https://getcomposer.org/installer -O composer-installer.php
php composer-installer.php --filename=composer --install-dir=/usr/bin
composer -V
