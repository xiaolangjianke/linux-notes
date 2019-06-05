#!/usr/bin/env bash

if [[ -d "/root/work/XRTCServer" ]];then
#已下载
    cd /root/work/XRTCServer;
    git pull;
else
    cd /root/work;
    git clone http://36.22.178.70:10080/jxzhgf/XRTCServer.git
    cd XRTCServer;
    echo " XRTCServer Downloaded "
fi

command -v node >/dev/null 2>&1 || { echo >&2 "nodejs not found,please install it and continue;"; exit 1; }
command -v npm >/dev/null 2>&1 || { echo >&2 "npm not found,please install it and continue;"; exit 1; }


#npm install -g pm2;
npm install -g yarn;

yarn install;


command -v docker  >/dev/null 2>&1 || { echo >&2 "docker not found,please install it and continue;"; exit 1; }

docker ps -a;

docker run -d -p 3478:3478 -p 3478:3478/udp --restart=always zolochevska/turn-server gongwei 123456 gongwei


#command -v pm2 >/dev/null 2>&1 || { echo >&2 "pm2 not found,please install it and continue;"; exit 1; }

#TODO 国外源耗时太久, 国内npm.taobao.org 镜像版本不对
# 需要挑网络环境好的时候下载,可以暂时直接使用node来启动
#pm2 start ./bin/www;
#nohup node ./bin/www > rtc.log > 2>&1 &
