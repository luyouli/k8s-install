#!/bin/bash
cat <<EOF >  /etc/yum.repos.d/ansible
[epel]
name = all source for ansible
baseurl = https://mirrors.aliyun.com/epel/7/x86_64/
enabled = 1
gpgcheck = 0
[ansible]
name = all source for ansible
baseurl = http://mirrors.aliyun.com/centos/7.5.1804/os/x86_64/
enabled = 1
gpgcheck = 0
EOF

echo "安装ansible和git" 
yum clean all && yum install -y ansible && yum -y install git
sed -i 's/#host_key_checking/host_key_checking/g' /etc/ansible/ansible.cfg

echo "git clone安装脚本"
git clone https://github.com/javac2005/k8s-install.git