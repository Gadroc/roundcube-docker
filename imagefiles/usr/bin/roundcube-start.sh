#!/bin/bash

# Check for config

# Change random security key on first startup
ROUNDCUBE_RANDOM=`perl -e 'my @chars = ("A".."Z", "a".."z"); my $string; $string .= $chars[rand @chars] for 1..24; print $string;'` # returns exactly 24 random chars
sed -i "s/ROUNDCUBE_RANDOM/$ROUNDCUBE_RANDOM/g" /var/www/html/config/config.inc.php

# Check for DB and initialize it
if [ $(mysql -h $DB_PORT_3306_TCP_ADDR -P $DB_PORT_3306_TCP_PORT -u $DB_USER -p$DB_PWD $DB_NAME -e "show tables;" | wc -l) -lt 5 ]
then
	echo "Initializing database"
	mysql -h $DB_PORT_3306_TCP_ADDR -P $DB_PORT_3306_TCP_PORT -u $DB_USER -p$DB_PWD $DB_NAME < /var/www/html/SQL/mysql.initial.sql	
fi

# Start apache
apache2-foreground