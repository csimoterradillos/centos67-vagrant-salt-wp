/etc/http/conf.d/phpMyAdmin.conf:
  - file.managed:
     - source: salt://config_files/phpmyadmin/phpMyAdmin.conf
     - user: www-data
     - group: www-data
     - mode: 644

