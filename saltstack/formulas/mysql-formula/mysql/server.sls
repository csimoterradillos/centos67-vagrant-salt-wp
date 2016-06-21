include:
  - mysql.config
  - mysql.python

{% from "mysql/defaults.yaml" import rawmap with context %}
{%- set mysql = salt['grains.filter_by'](rawmap, grain='os', merge=salt['pillar.get']('mysql:lookup')) %}

{% set os = salt['grains.get']('os', None) %}
{% set os_family = salt['grains.get']('os_family', None) %}
{% set mysql_root_user = salt['pillar.get']('mysql:server:root_user', 'root') %}
{% set mysql_root_password = salt['pillar.get']('mysql:server:root_password', salt['grains.get']('server_id')) %}
{% set mysql_host = salt['pillar.get']('mysql:server:host', 'localhost') %}
{% set mysql_salt_user = salt['pillar.get']('mysql:salt_user:salt_user_name', mysql_root_user) %}
{% set mysql_salt_password = salt['pillar.get']('mysql:salt_user:salt_user_password', mysql_root_password) %}


{% if os_family == 'Arch' %}
# on arch linux: inital mysql datadirectory is not created
mysql_install_datadir:
  cmd.run:
    - name: mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
    - user: root
    - creates: /var/lib/mysql/mysql/user.frm
    - require_in:
      - service: mysqld
{% endif %}

mysqld:
  service.running:
    - name: {{ mysql.service }}
    - enable: True

# official oracle mysql repo
# creates this file, that rewrites /etc/mysql/my.cnf setting
# so, make it empty
mysql_additional_config:
  file.managed:
    - name: /usr/my.cnf
    - source: salt://mysql/files/usr-my.cnf
    - create: False
    - watch_in:
      - service: mysqld
