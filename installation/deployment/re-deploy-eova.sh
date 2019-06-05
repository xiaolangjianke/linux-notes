#!/usr/bin/env bash



if [[ -d "/root/work/eova" ]];then
#文件存在
    cd /root/work/eova;
    git pull;
else
    cd /root/work;
    git clone http://36.22.178.70:10080/jxzhgf/eova.git
    cd eova;
    echo " Eova Downloaded "
fi

#if [[ -d "/root/software/jdk1.7.0_45" ]]; then
#    export JAVA_HOME=/root/software/jdk1.7.0_45
#else
#    echo "please install Oracle jdk 1.7"
#    exit 1;
#fi


cd /root/work/eova
# 8088
mvn clean compile jetty:start


