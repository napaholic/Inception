<?php

// ** MySQL settings - You can get this info from your web host ** //
define( 'DB_NAME', getenv('MYSQL_DB'));
define( 'DB_USER', getenv('MYSQL_USER'));
define(	'DB_PASSWORD', getenv('MYSQL_USER_PW'));
define(	'DB_HOST', 'mariadb');
define( 'DB_CHARSET', 'utf8' );
define( 'DB_COLLATE', '' );
// define( 'DB_NAME', 'wordpress');
// define( 'DB_USER', 'dcho');
// define(	'DB_PASSWORD', 'dcho1234');
// define(	'DB_HOST', 'mariadb');
// define( 'DB_CHARSET', 'utf8' );
// define( 'DB_COLLATE', '' );


/**Authentication unique keys and salts.*/
define('AUTH_KEY',         '*N#f{!!j?m<0uo!-j_%in|],7i(Og|ZB`20R+xip!TLbYs%z63v;lcQ>ICA_1A3d');
define('SECURE_AUTH_KEY',  '0phbkou`8i]GStp#hK +ck_i2IREL&WUb}eI6uOi+rxB P}jHJ@I/,AeEC5+_ZCY');
define('LOGGED_IN_KEY',    'EzF^]=cJOM9^ET#lDXU7`|N6RTgIVPR)D4JG}4VQu78{f|VTIQ`si7jC[OjvWWW|');
define('NONCE_KEY',        ' ;L6Dev>Ev+0`Dyh1/?AvMjO4zZ@j{TDyO :&yFeJ<??>ZK@FmKHnzMqH~Y2U;5_');
define('AUTH_SALT',        's0bC4!QIy&@2H#j:`-PGWg rj@@Df}R~p,+~f~<JB=RKd!xaMw} n[)^@)Wh-zQ-');
define('SECURE_AUTH_SALT', ' {a~)f+ZNT.!N[C[vwBO2N;+1i1R-|1|Xp,d$q^d#b3Kd|-s9Ds2Dp(<O]Htb<~l');
define('LOGGED_IN_SALT',   '=[,ngy+(FvQe(JF]GG,VUyzD|2xZ9;q|{&+6a>3#EegWn#/=.sO:ph|mjc-8h*SA');
define('NONCE_SALT',       'sTZY2n|$q=|}+&T~<{Hn=-QW3,{fU=;OITG1cJ4|G<SN>s#{|@:nj_O/F.DevRA#');

$table_prefix = 'wp_';

define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */
/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

define('CONCATENATE_SCRIPTS', false);

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
