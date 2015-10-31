<?php
$config['db_dsnw'] = 'mysql://'.$_ENV['DB_USER'].':'.$_ENV['DB_PWD'].'@'.$_ENV['DB_PORT_3306_TCP_ADDR'].':'.$_ENV['DB_PORT_3306_TCP_PORT'].'/'.$_ENV['DB_NAME'];
$config['default_host'] = 'tls://'.$_ENV['MAIL_HOST'];
$config['smtp_server'] = 'tls://'.$_ENV['MAIL_HOST'];
$config['smtp_port'] = 587;
$config['smtp_user'] = '%u';
$config['smtp_pass'] = '%p';
$config['support_url'] = '';
$config['des_key'] = 'ROUNDCUBE_RANDOM';
$config['plugins'] = array(
    'archive',
    'markasjunk',
    'zipdownload',
);
$config['skin'] = 'larry';
$config['language'] = 'en_US';
$config['spellcheck_engine'] = 'enchant';
$config['spellcheck_languages'] = array('en');
$config['mail_pagesize'] = 250;
$config['addressbook_pagesize'] = 250;
$config['htmleditor'] = 2;
$config['preview_pane'] = true;
$config['skip_deleted'] = true;

$config['zipdownload_attachments'] = 1;
$config['zipdownload_selection'] = false;
$config['zipdownload_charset'] = 'ISO-8859-1';
?>