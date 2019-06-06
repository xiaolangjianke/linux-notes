# Redis 服务说明
> 解压tar包，
```
yum install -y gcc-c++ 
make & make install
cd /src  
## 看到有redis-server
```
> 复制节点配置文件  
> 下载ruby等环境  
> 启动集群  


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
### 创建集群
```bash
yum install -y ruby
yum install -y rubygems

gem install -l ./redis-3.2.1.gem
```

## Redis 单机配置

```bash
#注释bind ip 允许远程登录redis
bind 0.0.0.0 
#关闭保护模式
protected-mode no 
```
