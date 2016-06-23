{% set root_user = salt['pillar.get']('mysql:server:root_user') %}
{% set root_password = salt['pillar.get']('mysql:server:root_password') %}
{% set host = salt['pillar.get']('mysql:server:mysqld:bind-address') %}
root_grants:
  mysql_user.present:
   - name: {{root_user}}
   - password: {{root_password}}
  mysql_grants.present:
   - grant: ALL PRIVILEGES
   - database: '*.*'
   - user: {{root_user}}
   - host: {{host}}

#salt://mysql/borrar_usuario_root.sh:
# cmd.script:
#   - args: "{{ root_user }} {{ root_password }}"
