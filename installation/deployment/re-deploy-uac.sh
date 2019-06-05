#!/usr/bin/env bash

if [[ -d "/root/work/AUTH" ]];then
#文件存在
    cd /root/work/AUTH;
    git pull;
else
    cd /root/work;
    git clone http://36.22.178.70:10080/jxzhgf/uac.git AUTH
    cd AUTH;
    echo " AUTH Downloaded "
fi

TOMCAT_HOME=/root/runtime/apache-tomcat-7.0.91

#if [[ -d "/root/runtime/apache-tomcat-8.5.41"]]; then
#
#    wget http://mirrors.tuna.tsinghua.edu.cn/apache/tomcat/tomcat-8/v8.5.41/bin/apache-tomcat-8.5.41.tar.gz
#fi

# TODO 需使用tomcat 7
cd $TOMCAT_HOME/webapps
#
#if [[ -d "/root/runtime/apache-tomcat-7.0.91/webapps/" ]];then
#    rm -rf ./bpmx3_dev;
#fi
#
#
#mkdir bpmx3_dev;
#
rm -rf AUTH
cp -rf /root/work/AUTH .
#
#cd  bpmx3_dev/;
#
#sed -i 's/127.0.0.1:3306/20.101.0.99:3306/g' WEB-INF/classes/conf/app.properties
#sed -i '22c jdbc.username=workflow'  WEB-INF/classes/conf/app.properties
#sed -i '23c jdbc.password=Abc.123456'  WEB-INF/classes/conf/app.properties
#
cd $TOMCAT_HOME
sh bin/shutdown.sh

sh bin/startup.sh
tailf logs/catalina.out

