/var/www/html/wordpress:
  file.directory:
    - user: apache
    - group: apache
    - mode: 2770
    - recurse:
      - user
      - group
      - mode 
