#!/bin/bash
# 在Red Hat6系统上安装zabbix-agent-3.4.3

HOSTNAME = hostname

#关闭selinux
sed -i "s/SELINUX=enforcing/#SELINUX=enforcing\nSELINUX=disabled/g" /etc/selinux/config
setenforce 0

#安装zabbix-agent
rpm -ivh http://repo.zabbix.com/zabbix/3.4/rhel/6/x86_64/zabbix-agent-3.4.3-1.el6.x86_64.rpm

#配置zabbix-agent
sed -i "s/Server=127.0.0.1/#Server=127.0.0.1\nServer=192.168.3.10/g" /etc/zabbix/zabbix_agentd.conf
sed -i "s/ServerActive=127.0.0.1/#ServerActive=127.0.0.1\nServerActive=192.168.3.10/g" /etc/zabbix/zabbix_agentd.conf
sed -i "s/Hostname=Zabbix server/#Hostname=Zabbix server\nHostname=$HOSTNAME/g" /etc/zabbix/zabbix_agentd.conf

#启动并设置开机启动
chkconfig --add zabbix-agent
service zabbix-agent start
