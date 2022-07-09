#!/bin/bash

#创建目录
echo 'mkdir -p /root/.ssh 
#网页下载到/root/.ssh/authorized_keys
wget https://raw.githubusercontent.com/expfukck/vk/main/authorized_keys -O  /root/.ssh/authorized_keys
echo 'cd /root
echo 'chmod 700 .ssh
echo 'chmod 600 .ssh/authorized_keys
echo 'sed -i 's/PasswordAuthentication yes/PasswordAuthentication no/g'  /etc/ssh/sshd_config
echo "----------已经设置禁止密码登录----------------请用SSH公钥登录---------正在重启中!"!
echo 'reboot
