# CentOS 7
# 1 GB RAM - 1 CPU Core
# 20 GB Storage
# PHP 7.4 & CHANGE PORT 22 TO 2323

yum install nano firewalld
nano /etc/ssh/sshd_config
systemctl restart sshd.service
firewall-cmd --permanent --zone=public --add-port=2323/tcp
firewall-cmd --reload
yum install php  php-cli php-fpm php-mysqlnd php-zip php-devel php-gd php-mcrypt php-mbstring php-curl php-xml php-pear php-bcmath php-json
php -v
