/etc/http/conf.d/phpMyAdmin.conf:
  file.managed:
     - source: salt://phpmyadmin/phpMyAdmin.conf
     - user: apache
     - group: apache
     - mode: 644
