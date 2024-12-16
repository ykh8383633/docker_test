#!/bin/bash

# Start MariaDB in the background
service mysql start

echo $MYSQL_ROOT_PASSWORD

# Apply environment variables for initial setup
mysql -uroot -p"$MYSQL_ROOT_PASSWORD" -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD'; FLUSH PRIVILEGES; INSTALL SONAME 'ha_mroonga';"

#mysql -uroot -p"$MYSQL_ROOT_PASSWORD" -e "CREATE DATABASE IF NOT EXISTS \`$MYSQL_DATABASE\`;"

#mysql -uroot -p"$MYSQL_ROOT_PASSWORD" -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD'; GRANT ALL PRIVILEGES ON \`$MYSQL_DATABASE\`.* TO '$MYSQL_USER'@'%'; FLUSH PRIVILEGES;"

# Install Mroonga plugin
#mysql -uroot -p"$MYSQL_ROOT_PASSWORD" -e "INSTALL SONAME 'ha_mroonga';"

# Stop MariaDB service to allow proper startup
service mysql stop


# Run MariaDB in foreground
mysqld
