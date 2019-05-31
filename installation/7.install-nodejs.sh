#!/usr/bin/env bash

echo "install nodejs.."

curl -sL https://rpm.nodesource.com/setup_12.x | sudo bash -

yum install -y nodejs yarn

echo "installed"
