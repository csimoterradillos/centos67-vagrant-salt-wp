# This state file is installs and configures the base wordpress environment 

### CJST: En nuestra instalacion /var/www/html/wordpress es un directorio
# this is the symlink to the virtual box sync folder WP will live in, the target needs to match 
#/var/www/html/wordpress:
# file.symlink:
#  - target: /www_src

# This block creates the wordpress database, user and sets user access. 
wordpress_db:
 mysql_database.present:
  - name: wordpress
 mysql_user.present:
  - name: wordpress
  - password: password
 mysql_grants.present:
  - database: wordpress.*
  - grant: ALL PRIVILEGES
  - user: wordpress
  - host: '%'

# This downloads wordpress from official site and untar's to our sync folder
get_wordpress:
 cmd.run:
  - name: 'wget http://wordpress.org/latest.tar.gz && tar xvzf latest.tar.gz && rm -f lastest.tar.gz'
  - cwd: /var/www/html/

# This downloads and installs WP-Cli which is needed for the following steps
### CJST: Nuevo procedimiento
### Descargado de https://wp-cli.org
get_wp-cli:
 cmd.run:
  - name: 'curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar'
  - cwd: /home/vagrant/
  - user: vagrant

### CJST: Nueva seccion para asignar permisos correctos de ejecucion
set_permissions_wp_cli:
 cmd.run:
  - name: 'chmod 755 /home/vagrant/wp-cli.phar'
  - cwd: /home/vagrant
  - user: vagrant

# symlink's the WP binary to /usr/local/bin so it's in the PATH
/usr/local/bin/wp:
 file:
  - symlink
  - target: /home/vagrant/wp-cli.phar

### CJST: Borro incondicionalmente wp-config.php para permitir sin problemas
### dos intentos consecutivos de provision.
delete_wp_config:
 cmd.run:
  - cwd: /var/www/html/wordpress/
  - name: 'rm -f wp-config.php'

# This command tells wp-cli to create our wp-config.php, DB info needs to be the same as above
config_wordpress:
 cmd.run:
  - cwd: /var/www/html/wordpress/
  - name: '/usr/local/bin/wp --allow-root core config --dbname=wordpress --dbuser=wordpress --dbpass=password'

# This command tells wp-cli to install wordpress, the --url needs to be the same as the IP you set for the 
# Private IP in the Vagrantfile 
install_wordpress:
 cmd.run:
  - cwd: /var/www/html/wordpress/
  - name: '/usr/local/bin/wp --allow-root core install --url=http://localhost/wordpress --title=development --admin_user=admin --admin_password=password --admin_email=vagrant@prueba.com' 

# CJST - 16/06/2016
# Put apache config file related to wordpress virtual-host site.
/etc/httpd/conf.d/wordpress.conf:
  file.managed:
    - source: salt://wordpress/wordpress.conf
    - user: apache
    - group: apache
    - mode: 644
