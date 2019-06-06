#!/usr/bin/env bash

#cp ./3.2.8-conf/cluster /root/work
## 启动
#redis-server /root/work/cluster/7000/redis.conf;
#redis-server /root/work/cluster/7001/redis.conf;
#redis-server /root/work/cluster/7002/redis.conf;
#redis-server /root/work/cluster/7003/redis.conf;
#redis-server /root/work/cluster/7004/redis.conf;
#redis-server /root/work/cluster/7005/redis.conf;
#
## cluster 串联,不能使用127.0.0.1,要使用真实ip否则容易出现Too many cluster redirections redis
#/root/work/redis/src/redis-trib.rb create --replicas 1 20.101.0.97:7000 20.101.0.97:7001 20.101.0.97:7002 20.101.0.97:7003 20.101.0.97:7004 20.101.0.97:7005
#


#
#- [Too many cluster redirections redis](https://blog.csdn.net/wzl19870309/article/details/50994234)
