#!/bin/bash

# LAMP INSTALLATION CENTOS 6

test1(){
    echo "INSTALL CENTOS6"

}

test2(){
    echo "INSTALL CENTOS7"

}

centos_6(){
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
    yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm
    yum install http://rpms.remirepo.net/enterprise/remi-release-6.rpm
    yum install yum-utils
    yum-config-manager --enable remi-php72 
    yum install php php-mcrypt php-cli php-gd php-curl php-mysql php-ldap php-zip php-fileinfo 

    # CONFIGURE PHP ERROR MESSAGE AND LOGS

    # ERROR CONFIGURATION
    # sudo mkdir /var/log/php
    # sudo chown apache /var/log/php

    # RESTART APACHE
    sudo service httpd restart
}

centos_7(){
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

# GET SYSTEM INFO
hostname=$(hostname)
#os=$(cat /etc/centos-release)
os="centos6.8"
echo $hostname
echo $os

while true; do
    echo -e "\033[1;33m##### LAMP STACK INSTALLATION #####\x1B[0m"
    read -p "Do you want to continue? Type Y to continue Q to quit: " choice
    case $choice in 
        y|Y) if [[ $os == centos6.8 ]]; then
                test1
                elif [[ $os == centos7.0 ]]; then
                test2
            fi
        exit
        ;;
        q|Q) echo "Installation Terminated!"
        exit
        ;;
    esac
done

# sudo yum update all -y

# echo "Successfully installed:"
#    echo Apache Version
#    echo Mysql Version
#    echo PHP Version
#    echo phpmyadmin