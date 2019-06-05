#!/usr/bin/env bash

# 运行代理池
nohup python /root/work/sentiment-spider/start_proxy.py > proxy.log 2>&1 &
# 运行爬虫
nohup python /root/work/sentiment-spider/run.py > sentiment-spider.log 2>&1 &
