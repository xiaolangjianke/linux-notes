#!/usr/bin/env bash

if [[ -d "/root/work/sentiment-site-spider" ]];then
#文件存在
    cd /root/work/sentiment-site-spider;
    git pull;
else
    cd /root/work;
    git clone http://36.22.178.70:10080/jxzhgf/crawler.git sentiment-site-spider
    cd sentiment-site-spider;
    echo " sentiment-site-spider Downloaded "
fi

# requirement
# redis/proxy_pool/neo4j/mysql

command -v conda >/dev/null 2>&1 || { echo >&2 "Conda not found,please install Anaconda and continue;"; exit 1; }



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
