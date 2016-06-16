mysql:
  global:
    client-server:
      default_character_set: utf8

  clients:
    mysql:
      default_character_set: utf8
    mysqldump:
      default_character_set: utf8

  library:
    client:
      default_character_set: utf8

  server:
    root_user: 'sqladmin'
    root_password: 'samplepass'
    mysqld:
      bind-address: 127.0.0.1
      port: 3306

