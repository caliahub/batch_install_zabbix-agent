#salt_batch_install_zabbix-agent

#对所有minion主机（Red Hat6或Red Hat7系统）进行批量安装zabbix-agent




1、修改salt-master配置文件master（/etc/salt/master），设置base目录为/saltstack




2、执行salt命令，批量安装zabbix-agent

salt 'rhel6-minion*' state.sls install_zabbix-agent-rhel6

salt 'rhel7-minion*' state.sls install_zabbix-agent-rhel7
