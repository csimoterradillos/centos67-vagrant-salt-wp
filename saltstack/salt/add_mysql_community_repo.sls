base:
  pkgrepo.managed:
    - name: mysql
    - humanname: MySQL 5.6 Community Server
    - baseurl: http://repo.mysql.com/yum/mysql-5.6-community/el/6/x86_64/
    - gpgkey: file:/etc/pki/rpm-gpg/RPM-GPG-KEY-mysql
    - gpgcheck: 1
/etc/pki/rpm-gpg/RPM-GPG-KEY-mysql:
  file.managed:
    - source: salt://pki/RPM-GPG-KEY-mysql
    - user: root
    - group: root
    - mode: 640

