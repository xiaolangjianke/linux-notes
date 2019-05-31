#!/usr/bin/env bash

# install Aliyun repo
yum install -y wget;
cd /etc/yum.repos.d;
wget http://mirrors.aliyun.com/repo/Centos-7.repo;
mv CentOS-Base.repo CentOS-Base.repo.bak;
mv Centos-7.repo CentOS-Base.repo;
yum clean all;
yum makecache fast;


# install base utils;
yum install -y vim tree curl git net-tools expect unzip lsof
