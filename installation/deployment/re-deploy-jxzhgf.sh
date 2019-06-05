#!/usr/bin/env bash


if [[ -d "/root/work/jxzhgf" ]];then
#已下载
    cd /root/work/jxzhgf;
    git pull;
else
    cd /root/work;
    git clone http://36.22.178.70:10080/jxzhgf/jxzhgf.git
    cd jxzhgf;
    echo " jxzhgf Downloaded "
fi

cd /root/work/jxzhgf

mvn clean package -Dmaven.test.skip=true -Pprod;

if [[ -d "/root/runtime/apache-tomcat-8.5.41/webapps" ]];then
    cd /root/runtime/apache-tomcat-8.5.41/webapps
#    rm -rf *
    rm -rf jxzhgf*
    rm -rf FUI*
    rm -rf gf-app*
    sudo cp  -f ~/work/jxzhgf/target/jxzhgf.war .
    sudo cp  -f ~/work/jxzhgf/static/FUI-v3.1.2.war .
    sudo cp  -f ~/work/jxzhgf/static/gf-app-html5.zip .

    unzip gf-app-html5.zip

    cd /root/runtime/apache-tomcat-8.5.41
    # TODO tomcat shutdown.sh 脚本不能立即关闭jvm,存在延迟,如未关闭时继续执行startup.sh
    # 会出现address is exists  or 对内存溢出情况
    # 之后修改为 ps aux |grep java | awk {xxxxxx}
    sh bin/shutdown.sh

    sh bin/startup.sh

    tailf logs/catalina.out

else
    echo "can't found tomcat webapps"
    exit 1
fi

