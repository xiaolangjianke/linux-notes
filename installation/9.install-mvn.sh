#!/usr/bin/env bash


if [[ ! -d "/root/software" ]] ; then
    echo -e "\nplease mkdir [software] directory \n"
    read -s -n1 -p "Press any key to continue ... "
fi

cd ~/software

wget http://mirrors.tuna.tsinghua.edu.cn/apache/maven/maven-3/3.6.1/binaries/apache-maven-3.6.1-bin.zip
unzip apache-maven-3.6.1-bin.zip
cd apache-maven-3.6.1

echo "MAVEN_HOME=/root/software/apache-maven-3.6.1" >> ~/.bash_profile
echo "PATH=$PATH:/root/software/apache-maven-3.6.1/bin" >> ~/.bash_profile
echo "export PATH" >> ~/.bash_profile


# source .bash_profile 或 reopen shell ,再执行mvn 验证 安装是否成功
