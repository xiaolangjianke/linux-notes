#!/usr/bin/env bash

yum install https://download.postgresql.org/pub/repos/yum/9.6/redhat/rhel-7-x86_64/pgdg-centos96-9.6-3.noarch.rpm
yum install postgresql96-server
#yum install postgresql96-devel.x86_64

systemctl start postgresql-9.6
systemctl enable postgresql-9.6


# 数据库配置 参考:https://blog.csdn.net/sunbocong/article/details/78212709

# 配置文件路径:/var/lib/pgsql/9.6/data
# log路径:/var/lib/pgsql/9.6/initdb.log

# pg数据库配置/var/lib/pgsql/9.6/data/postgresql.conf
# 修改listen_addresses = 'localhost' -> listen_addresses = '*'

# 在 pg_hba.conf中增加
# host    all             all            0.0.0.0/0  md5


# 系统命令行: passwd postgres  # 密码设置(Abc.123456)
# 系统命令行: su - postgres
# -bash-4.2$ vim ./.bash_profile  #编辑配置文件,修改ps1
# export PS1='[\u@\h \W]\$'
# 系统命令行: su - postgres
# PG命令行 : psql -U postgres
# PG命令行 : alter user postgres with password 'Abc.123456';



# 数据库建库错误:https://yq.aliyun.com/articles/43395


