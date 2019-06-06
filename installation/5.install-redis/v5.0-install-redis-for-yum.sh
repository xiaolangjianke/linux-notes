#!/usr/bin/env bash

yum install -y http://rpms.famillecollet.com/enterprise/remi-release-7.rpm
# 5.0版本
#yum --enablerepo=remi install redis
# 3.2.1x 版本
yum install redis

systemctl start redis.service
systemctl enable redis.service

mkdir ~/work/redis-cluster

cd ~/work/redis-cluster


# 默认使用 1:1 主从
mkdir master-7000/
cp ~/work/installation/5.install-redis-for-yum/redis-7000.conf ~/work/redis-cluster/master-7000/redis.conf

mkdir master-7002/
cp ~/work/installation/5.install-redis-for-yum/redis-7002.conf ~/work/redis-cluster/master-7002/redis.conf

mkdir master-7004/
cp ~/work/installation/5.install-redis-for-yum/redis-7004.conf ~/work/redis-cluster/master-7004/redis.conf

mkdir salve-7001/
cp ~/work/installation/5.install-redis-for-yum/redis-7001.conf ~/work/redis-cluster/salve-7001/redis.conf

mkdir salve-7003/
cp ~/work/installation/5.install-redis-for-yum/redis-7003.conf ~/work/redis-cluster/salve-7003/redis.conf

mkdir salve-7005/
cp ~/work/installation/5.install-redis-for-yum/redis-7005.conf ~/work/redis-cluster/salve-7005/redis.conf


redis-cli --cluster create 127.0.0.1:7000 127.0.0.1:7002 127.0.0.1:7004 127.0.0.1:7001 127.0.0.1:7003 127.0.0.1:7005 --cluster-replicas 1

# redis.conf 修改项
# 7000节点的配置
# protected-mode no
# port 7000
# daemonize yes
# pidfile  /var/run/redis_7000.pid
# appendonly yes
# cluster-enabled yes
# cluster-config-file nodes-6379.conf
# cluster-node-timeout 15000

# redis 集群配置  :  https://blog.csdn.net/qq_39135287/article/details/84189397
#                   https://www.jianshu.com/p/69050d797cb7
# 修改默认启动服务 :  https://www.cnblogs.com/sybblogs/p/5665123.html

# 创建集群配置主从节点：https://www.cnblogs.com/Dev0ps/p/10206604.html
