#!/usr/bin/env bash


DEST_DIR_NAME='opinion-deploy'
WORK_HOME="/root/work/${DEST_DIR_NAME}"

if [[ -d "${WORK_HOME}" ]];then
#文件存在
    cd ${WORK_HOME};
    echo "${WORK_HOME} exists, exec git pull"
    git pull;
else
    cd /root/work;
    git clone http://36.22.178.70:10080/jxzhgf/opinion-deploy $DEST_DIR_NAME
    cd ${DEST_DIR_NAME};
    echo "${DEST_DIR_NAME} Downloaded "
fi

command -v java >/dev/null 2>&1 || { echo >&2 "Java not found,please install Java and continue;"; exit 1; }


yum install -y epel-release.noarch
yum install python2-pip -y



# 配置环境
# /root/work/opinion-deploy/init_config.sh
#
# /root/work/opinion-deploy/socialopinion/start.sh  # 使用jdk1.8
#
# /root/work/opinion-deploy/solrweb/start.sh        # 使用jdk1.7 需要在start.sh中配置java绝对路径,并将字体补丁放到jre/lib/fonts下
#
# cd /root/work/opinion-deploy/socialopinion/OpinionSystemFrontEnd
# pip install -i https://pypi.tuna.tsinghua.edu.cn/simple -r requirements.txt



