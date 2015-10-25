# Docker Roundcube Container
Setup files for building a roundcube docker image.

## Environment Variables
This container is setup expecting the following environment variables.  All environment variables are required for proper functioning.  Database variables are setup so that container linking works if you link in a database container using db as the alias.

### DB_PORT_3306_TCP_ADDR
Address of the mysql database server to store roundcube data in.  * Only required if you do not use --link

### DB_PORT_3306_TCP_PORT
Port of the mysql database server to store roundcube data in.  * Only required if you do not use --link

### DB_NAME
Name of the data schema to store roundcube data in.

### DB_USER
Username to log into mysql with.  This user should have at least the following privileges in the schema.
```ALTER, CREATE, CREATE VIEW, DELETE, DROP, INDEX, INSERT, TRIGGER, UPDATE, SELECT```

### DB_PWD
Password to log into mysql with.

### MAIL_HOST
IMAP mail host to use as a backend for authentication and mail storage.

## Alternative Configuration
If you do not want to set the environment variables you can supply your own config.inc.php file using a host linked volume.

```docker run -v {path to your local config.inc.php}:/var/www/html/config/config.inc.php -d gadroc/roundcube```

Using a custom config file allows for using additional plugins and other features.