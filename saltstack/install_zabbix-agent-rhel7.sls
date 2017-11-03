zabbix-agent:
  file.managed:
    - name: /app/script/install/zabbix-agent.sh
    - source: salt://script/install_zabbix-agent-rhel7.sh
    - mode: 744
    - require:
      - file: /app/script/install
  cmd.run:
    - name: /app/script/install/zabbix-agent.sh 

/app/script/install:
  file.directory:
    - makedirs: true
    - user: root
    - group: root
 
