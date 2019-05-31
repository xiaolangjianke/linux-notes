#!/usr/bin/env bash

rpm -ivh http://repo.mysql.com/mysql57-community-release-el7-8.noarch.rpm
#rpm -ivh mysql57-community-release-el7-8.noarch.rpm ;
yum install -y mysql-community-server;

systemctl start mysqld.service
systemctl enable mysqld.service

#官方源数据慢,建议换国内源
#Delta RPMs disabled because /usr/bin/applydeltarpm not installed.
#mysql-community-common-5.7.26- FAILED                                               ]  231 B/s | 216 kB 247:41:28 ETA
#http://repo.mysql.com/yum/mysql-5.7-community/el/7/x86_64/mysql-community-common-5.7.26-1.el7.x86_64.rpm: [Errno 12] Timeout on http://repo.mysql.com/yum/mysql-5.7-community/el/7/x86_64/mysql-community-common-5.7.26-1.el7.x86_64.rpm: (28, 'Operation too slow. Less than 1000 bytes/sec transferred the last 30 seconds')
#正在尝试其它镜像。
#mysql-community-client-5.7.26- FAILED                                               ] 3.8 kB/s | 176 kB  14:37:56 ETA
#http://repo.mysql.com/yum/mysql-5.7-community/el/7/x86_64/mysql-community-client-5.7.26-1.el7.x86_64.rpm: [Errno 12] Timeout on http://repo.mysql.com/yum/mysql-5.7-community/el/7/x86_64/mysql-community-client-5.7.26-1.el7.x86_64.rpm: (28, 'Operation too slow. Less than 1000 bytes/sec transferred the last 30 seconds')
#正在尝试其它镜像。



# 数据库配置
# 20.101.0.99  A temporary password is generated for root@localhost: Ib(sL&=Q:1Al
# set password=password('Abc.123456');
# alter user 'root'@'localhost' password expire never;
# flush privileges;
# \q
## reloing mysql server
# mysql -uroot -pAbc.123456
# grant all privileges on *.* to 'root'@'%' identified by 'Abc.123456' with grant option;
# flush privileges;

# my.cnf : lower_case_table_names = 1
#          sql_mode=STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION;
# com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Expression #3 of SELECT list is not in GROUP BY clause and contains nonaggregated column 'jxzhgf_ys.mr.code' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by
