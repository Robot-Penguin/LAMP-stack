#!/bin/bash

# LAMP INSTALLATION CENTOS 6

#test1(){
#    echo "INSTALL CENTOS6"

#}

#test2(){
#    echo "INSTALL CENTOS7"

#}

centos_6(){
    # sudo yum update all -y

    # APACHE INSTALLATION
    sudo yum install httpd -y
    sudo service httpd start
    sudo chkconfig httpd

    # CONFIGURE IPTABLES
    # iptables -A INPUT -m state --state NEW -m tcp -p tcp --dport 80 -j ACCEPT
    service iptables stop

    # MYSQL INSTALLATION
    sudo yum install mysql-server mysql -y
    sudo chkconfig mysqld on
    sudo service mysqld start

    # PHP INSTALLATION & CONFIGURATION
    yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm -y
    yum install http://rpms.remirepo.net/enterprise/remi-release-6.rpm -y 
    yum install yum-utils -y 
    yum-config-manager --enable remi-php72 -y  
    yum install php php-mcrypt php-cli php-gd php-curl php-mysql php-ldap php-zip php-fileinfo -y  

    # CONFIGURE PHP ERROR LOG
    sudo sed -i.$(date +%F-%T) 's/;error_log = php_errors.log/error_log = \/var\/log\/php\/error.log/' /etc/php.ini
    sudo mkdir /var/log/php
    sudo chown apache /var/log/php

    # RESTART APACHE
    sudo service httpd restart
}

centos_7(){
    # sudo yum update all -y

    # APACHE INSTALLATION


    # CONFIGURE IPTABLES


    # MYSQL INSTALLATION


    # PHP INSTALLATION & CONFIGURATION
 
    # CONFIGURE PHP ERROR MESSAGE AND LOGS

    # ERROR CONFIGURATION
    # sudo mkdir /var/log/php
    # sudo chown apache /var/log/php
    echo "TEST"

    # RESTART APACHE
}

system_info(){
    echo -e "\033[1;33m##### Successfully installed #####\x1B[0m"
    echo -e "Apache :" $(httpd -v)
    echo -e "Mysql :" $(mysqld --version)
    echo -e "PHP :" $(php --version)
#   echo phpmyadmin

}

# GET SYSTEM INFO
hostname=$(hostname)
#os=$(cat /etc/centos-release)
os="centos7.0"
echo $hostname
echo $os

while true; do
    echo -e "\033[1;33m##### LAMP STACK INSTALLATION #####\x1B[0m"
    read -p "Do you want to continue? Type Y to continue Q to quit: " choice
    case $choice in 
        y|Y) if [[ $os == centos6.8 ]]; then
                centos_6
                system_info
                elif [[ $os == centos7.0 ]]; then
                centos_7
                system_info    
            fi
        exit
        ;;
        q|Q) echo "Installation Terminated!"
        exit
        ;;
    esac
done
