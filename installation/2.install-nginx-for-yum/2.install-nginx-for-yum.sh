#!/usr/bin/env bash

#rpm -ivh http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm;

if rpm -qa "nginx" > /dev/null
  then
    echo "nginx was installed"
  else
    echo "nginx is not install"
    yum install -y nginx;
fi

systemctl restart nginx.service
systemctl enable nginx.service



cp -rf ./conf.d /etc/nginx/
echo -e "copy confs to /etc/nginx/conf.d \n"
cp -rf ./ssl /opt/
echo -e "copy ssl files to /opt/ssl\n"
