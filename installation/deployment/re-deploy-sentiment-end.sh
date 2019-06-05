#!/usr/bin/env bash

if [[ ! -d "/root/work" ]] ; then
    echo -e "\nplease mkdir [work] directory \n"
    read -s -n1 -p "Press any key to continue ... "
fi
if [[ ! -d "/root/runtime" ]] ; then
    echo -e "\nplease mkdir [runtime] directory \n"
    read -s -n1 -p "Press any key to continue ... "
fi
if [[ ! -d "/root/software" ]] ; then
    echo -e "\nplease mkdir [software] directory \n"
    read -s -n1 -p "Press any key to continue ... "
fi

DEST_DIR_NAME='sentiment-end'
WORK_HOME="/root/work/${DEST_DIR_NAME}"

if [[ -d "${WORK_HOME}" ]];then
#文件存在
    cd ${WORK_HOME};
    echo "${WORK_HOME} exists, exec git pull"
    git pull;
else
    cd /root/work;
    git clone http://36.22.178.70:10080/jxzhgf/OpinionSystem.git $DEST_DIR_NAME
    cd ${DEST_DIR_NAME};
    echo "${DEST_DIR_NAME} Downloaded "
fi

command -v java >/dev/null 2>&1 || { echo >&2 "Java not found,please install Java and continue;"; exit 1; }

cd ${WORK_HOME}/output/
java -Djava.ext.dirs="lib/" -Dfile.encoding=utf-8 -jar lib/analysis.jar



