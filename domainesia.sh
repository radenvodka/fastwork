# CentOS 7
# 1 GB RAM - 1 CPU Core
# 20 GB Storage
# PHP 7.4 & CHANGE PORT 22 TO 2323

yum install nano firewalld

# SSH CONFIG OPEN PORT 2323
nano /etc/ssh/sshd_config
semanage port -a -t ssh_port_t -p tcp 2323
systemctl restart sshd.service

# FIREWALL PORT

systemctl enable firewalld
systemctl start firewalld
firewall-cmd --permanent --zone=public --add-port=2323/tcp
firewall-cmd --reload

# Install composer
wget https://getcomposer.org/installer -O composer-installer.php
php composer-installer.php --filename=composer --install-dir=/usr/bin
composer -V
