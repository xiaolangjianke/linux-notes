#!/usr/bin/env bash

if [[ -d "/root/work/sentiment-spider" ]];then
#文件存在
    cd /root/work/sentiment-spider;
    git pull;
else
    cd /root/work;
    git clone http://36.22.178.70:10080/jxzhgf/OpinionSystemUniversalSpiders.git sentiment-spider
    cd sentiment-spider;
    echo " sentiment-spider Downloaded "
fi

# requirement
# redis/proxy_pool/neo4j/mysql

command -v conda >/dev/null 2>&1 || { echo >&2 "Conda not found,please install Anaconda and continue;"; exit 1; }

sed -i "2c REDIS_HOST = '20.101.0.104'" config.py
sed -i "17c NEO4J_URL='20.101.0.104'" config.py
sed -i "24c MYSQL_HOST = '20.101.0.104'" config.py

yum install -y gcc
pip install -r requirements.txt -i http://pypi.douban.com/simple --trusted-host pypi.douban.com


# kill all python proxy process
ps axu |grep -E "python .*start_proxy.py"|grep -v "grep"|awk '{print $2}'|xargs kill -9   >/dev/null 2>&1
ps axu |grep -E "python .*sentiment-spider/run.py"|grep -v "grep"|awk '{print $2}'|xargs kill -9   >/dev/null 2>&1
ps axu |grep -E "runserver 0.0.0.0:8888"|grep -v "grep"|awk '{print $2}'|xargs kill -9   >/dev/null 2>&1

sh /root/work/installation/start-stop/sentiment/sentiment-spider.sh



# TODO 微博爬虫的规则需要配置
# TODO Splash服务
# 配置 news/universal/settings.py  -> SPLASH_URL

#command -v redis-cli >/dev/null 2>&1 || { echo >&2 "Redis not found,please install it and continue;"; exit 1; }
#command -v python3.6 >/dev/null 2>&1 || { echo >&2 "python3.6 not found,please install it and continue;"; exit 1; }

# yum install python36
# yum install  python36-devel python-setuptools
# [python3.6和pip3安装](https://www.cnblogs.com/belic/p/python3_install.html)
# 换aliyun的 repo源
# yum install -y  python36-pip;


# 安装路径 /usr/local/lib/python3.6/site-packages
# pip3 install flask
# pip3 install redis
# pip3 install aiohttp;
# pip3 install requests;
# pip3 install pyquery;

# 使用其他源 安装 依赖,同时需要修改requirements.文件 ">=" -> "=="
# pip3 install -i https://pypi.tuna.tsinghua.edu.cn/simple -r requirements.txt

# 在所有py文件前 增加文件编码;
#find . -iname '*.py'| xargs sed -i '1 i # -*- coding: utf-8 -*-\n'

#pip3 install -i https://pypi.tuna.tsinghua.edu.cn/simple watchdog==0.8.3

## $ pip3 install -t /usr/local/lib/python2.7/site-packages/

#[ ] 待解决 : error :No module named watchdog.events


#与 舆情 刘俊杰沟通
#建议安装anaconda,使用该环境下的python,解决版本问题,下载内核注意版本
# https://repo.anaconda.com/archive/Anaconda3-2019.03-Linux-x86_64.sh

# [Getting started with conda](https://conda.io/projects/conda/en/latest/user-guide/getting-started.html)
