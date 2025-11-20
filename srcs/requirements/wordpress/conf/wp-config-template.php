
<?php
define( 'DB_NAME', 'the_awesome_db_name' );
define( 'DB_USER', 'the_awesome_db_user' );
define( 'DB_PASSWORD', 'the_awesome_db_pass' );
define( 'DB_HOST', 'mariadb' );

define( 'DB_CHARSET', 'utf8' );
define( 'DB_COLLATE', '' );

define('AUTH_KEY',         'm;H$qbelnK{WA^TpJ%27Waf^X<N#vBM=hRNC{Sz4WhxOJ+MDMrD6M()4;V=QauZc');
define('SECURE_AUTH_KEY',  '<u /@+@U0 TX7i2>jr@0l3/o#y3.j5;SQ3GUX$;J]MVK2}v3Y.jy=QWSVu%opokb');
define('LOGGED_IN_KEY',    '2pSy}X5889s1ftJ]Z-jZZxGb1~vNs|ecGr`{V>-J3~L|c`+T[E#_-gW9!LkJ#1( ');
define('NONCE_KEY',        '7mqRmd;Af~8+kE?3/2&#NW//$3@A&yj,$0m(5RaCW9=aKM <g|b!}^^+]J#bVQ/c');
define('AUTH_SALT',        '>@jJ3_U:Gq+j~C/p/-Jk:Dbne$bTmABKi$;07cjy,+fp#^NftMs^--2@g;_A_g1C');
define('SECURE_AUTH_SALT', 'ama Zwk$^8+_v2Wp-Q^@Aih%+M}bI9kb{~3*%;7,#cx4+W{QE NQB8nt=euvPb$#');
define('LOGGED_IN_SALT',   '2xXR/}3IY)K,6c.}YKrvWBHTQ&LJSIz&T[Qt_Arr|~W;! R1;y~-yZVxK+4UiQy}');
define('NONCE_SALT',       'qdW~!mv_B1e ;{z/N2ghLvVO1pa+UJ1-oMwD}M.I&O.L7`([l4O$dA/#>wD+3`Z}');

$table_prefix = 'wp_';

define( 'WP_DEBUG', false );

if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

require_once ABSPATH . 'wp-settings.php';
