#!/usr/bin/env bash

echo " start APIE"
nohup java -jar  DSE_RDB_APIE/RDB_APIE.jar > RDB_APIE.log 2>&1 &

echo "start READ"
nohup java -jar  DSE_RDB_READ/RDB_READ.jar > RDB_READ.log 2>&1 &
