#!/bin/bash

echo "创建目录"
mkdiecho "创建目录"r -p /root/.ssh 
#网页下载到/root/.ssh/authorized_keys
wget https://raw.githubusercontent.com/expfukck/vk/main/authorized_keys -O  /root/.ssh/authorized_keys
echo "进入root"
cd /root
echo "处理中"
chmod 700 .ssh
chmod 600 .ssh/authorized_keys
禁止密码登录"
sed -i 's/PasswordAuthentication yes/PasswordAuthentication no/g'  /etc/ssh/sshd_config
echo "----------已经设置禁止密码登录----------------请用SSH公钥登录---------正在重启中!"!
reboot