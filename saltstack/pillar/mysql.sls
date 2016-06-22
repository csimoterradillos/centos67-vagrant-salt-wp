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
      bind-address: 'localhost'
      port: 3306

  user:
    wordpress:
      password: 'password'
      host: localhost
      databases:
        - database: wordpress
          grants: ['all privileges']

  lookup:
    server: mysql-community-server.x86_64
    client: mysql-community-client.x86_64
    service: mysqld
    python: MySQL-python.X86_64
