#!/usr/bin/env bash


echo "install ansible vim tree wget curl"
yum install -y ansible vim tree wget curl git net-tools expect unzip lsof
echo "install finished!"

echo 'export HISTTIMEFORMAT="%F %T "' >> ~/.bash_profile
echo 'alias hi="cat /etc/hosts"' >> ~/.bash_profile

ssh-keygen -t rsa -n '' -f ~/.ssh/id_rsa


# TODO 此处密码明文存储,密码要通过参数传递

for i in {96..101}
do
expect << EOF
spawn ssh-copy-id 20.101.0.$i
expect "(yes/no)?" {send "yes\r"}
expect "password:" {send "Zhgf.123456\r"}
expect "#" {send "exit\r"}
EOF
done

ansible all -m shell -a 'yum install -y vim tree wget curl git net-tools expect'
ansible all -m copy -a "src=/etc/hosts backup=yes dest=/etc/hosts"
ansible all -m copy -a "src=/root/.bash_profile backup=yes dest=/root/.bash_profile"



# ssh-copy-id root@20.101.0.96
# ssh-copy-id root@20.101.0.97
# ssh-copy-id root@20.101.0.98
# ssh-copy-id root@20.101.0.99
# ssh-copy-id root@20.101.0.100
# ssh-copy-id root@20.101.0.101

