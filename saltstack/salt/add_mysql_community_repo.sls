base:
  pkgrepo.managed:
    - humanname: MySQL 5.6 Community Server
    - baseurl: http://repo.mysql.com/yum/mysql-5.6-community/6/x86_64/
    - gpgkey: file:/etc/pki/rpm-gpg/RPM-GPG-KEY-mysql
    - gpgcheck: 1
  /etc/pki/rpm-gpg/RPM-GPG-KEY-mysql:
    file.managed:
      - source: salt://config_files/pki/RPM-GPG-KEY-mysql
      - user: root
      - group: root
      - mode: 640

