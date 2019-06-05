#!/usr/bin/env bash

if [[ -d "/root/work/phymcms" ]];then
#文件存在
    cd /root/work/phymcms;
    git pull;
else
    cd /root/work;
    git clone http://36.22.178.70:10080/jxzhgf/phymcms.git
    cd phymcms;
    echo " phymcms Downloaded "
fi


mvn package -Dmaven.test.skip=true -Pprod



cd target

mkdir /root/runtime/apache-tomcat-8.5.41/webapps/phymcms

mv phymcms.war /root/runtime/apache-tomcat-8.5.41/webapps/phymcms
cd /root/runtime/apache-tomcat-8.5.41/webapps/phymcms

unzip phymcms.war

rm -rf phymcms.war



#if [[ -d "/root/runtime/apache-tomcat-8.5.41"]]; then
#
#    wget http://mirrors.tuna.tsinghua.edu.cn/apache/tomcat/tomcat-8/v8.5.41/bin/apache-tomcat-8.5.41.tar.gz
#fi
#
#cd /root/runtime/apache-tomcat-8.5.41/webapps
#
#unzip
#if [[ -d "/root/runtime/apache-tomcat-8.5.41/webapps/bpmx3_dev" ]];then
#    rm -rf ./bpmx3_dev;
#fi
#
#
#mkdir bpmx3_dev;
#
#cp -r /root/work/workflow/* ./bpmx3_dev
#
#cd  bpmx3_dev/;
#
#sed -i 's/127.0.0.1:3306/20.101.0.99:3306/g' WEB-INF/classes/conf/app.properties
#sed -i '22c jdbc.username=workflow'  WEB-INF/classes/conf/app.properties
#sed -i '23c jdbc.password=Abc.123456'  WEB-INF/classes/conf/app.properties
#
#cd /root/runtime/apache-tomcat-8.5.41
#
#sh bin/shutdown.sh
#
#sh bin/startup.sh
#tailf logs/catalina.out
#
