#!/usr/bin/env bash
# 关闭所有
ps aux |grep redis| awk '{print $2}' |xargs kill -9

# TODO kill语句会异常中断shell rm语句不会正缺执行
rm -rf nodes-* dump.rdb appendonly.aof
