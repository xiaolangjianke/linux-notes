#!/usr/bin/env bash

echo "kill all dse process "
ps aux | grep java | grep DSE | awk '{print $2}'| xargs kill -9
echo "finished"
