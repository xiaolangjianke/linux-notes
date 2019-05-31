#!/usr/bin/env bash
yum install -y wget;
cd /etc/yum.repos.d;
#wget http://mirrors.aliyun.com/repo/Centos-7.repo;
#mv CentOS-Base.repo CentOS-Base.repo.bak;
#mv Centos-7.repo CentOS-Base.repo;
#yum clean all;
#yum makecache fast;
wget https://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo;
# sed -i "s/download-stage.docker.com/mirrors.aliyun.com\/docker-ce/g" docker-ce.repo;
yum makecache fast;
#yum -y update -x docker-*;
#yum install -y yum-utils device-mapper-persistent-data lvm2;
yum -y install docker-ce;
#service firewalld stop;
systemctl start docker.service;



# 更换aliyun 的镜像源  /etc/docker/daemon.json
#{
#  "registry-mirrors": ["https://pb2oibh9.mirror.aliyuncs.com"]
#}
