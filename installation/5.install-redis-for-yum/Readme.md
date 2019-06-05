# Redis 服务说明

## Redis 集群配置
redis.conf 修改项
```bash
# 7000节点的配置
protected-mode no
port 7000
daemonize yes
pidfile  /var/run/redis_7000.pid
appendonly yes
cluster-enabled yes
cluster-config-file nodes-6379.conf
cluster-node-timeout 15000
```

## Redis 单机配置

```bash
#注释bind ip 允许远程登录redis
bind 127.0.0.1 
#关闭保护模式
protected-mode no 
```
