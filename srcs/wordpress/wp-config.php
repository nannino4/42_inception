<?php

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', getenv('WP_DB_NAME') );

/** MySQL database username */
define( 'DB_USER', getenv('WP_DB_ADMIN') );

/** MySQL database password */
define( 'DB_PASSWORD', getenv('WP_DB_ADMIN_PSW') );

/** MySQL hostname */
define( 'DB_HOST', getenv('WP_DB_HOST') );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'Z6i&^3mv _r!PA?gG1Sga9+a>^(Qw$q.*38}PC9XD`BUwGO}1W|o+Y<3HgW+|i)[');
define('SECURE_AUTH_KEY',  'z/_C5>>:WDF;1W|I54Q3S)E+:vWK5[~|X8}48>VPk?+d;Lsxzc>K13AoL95-e]#a');
define('LOGGED_IN_KEY',    '(B+<0[G4eFw1+-YL|&AiAJD09TyseB`o-ABNS@9(lvXc),4N9Rij/h-n-Q(mmv)K');
define('NONCE_KEY',        '4D,T0B{XkEO-:96m#P0R$ul.O.;a|a:*),x9;*8X|[.~Qj3)lTQi>5#nYLY<km|5');
define('AUTH_SALT',        'q)L|hm+iq_wV;r0.jiQ+{|Wq.1q&q$4~1Jj%Z`[[Q|CRh_8,}{ZFY)EfrkA~,Ct=');
define('SECURE_AUTH_SALT', 'G/<ZS?R`Btg.yLH&7u()Si2|Euv*<6o&.C+=VTF7`3vI|YbA|0#/a0IxPl8r![&q');
define('LOGGED_IN_SALT',   'R#%Y3/>5-(RH|,==/Ek pyFO2?$DotJ&ztc;V=;EocM(MfoA =PMWvelt}|~D=Cb');
define('NONCE_SALT',       'UwNC3&rq>,{>,WE{IBb^Vw)~*<;-~&NWs${XG|m6.R$pP[M^Xf%+uABHl[Lg!X)|');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', dirname( __FILE__ ) . '/' );
}

/** Sets up WordPress vars and included files. */
require_once( ABSPATH . 'wp-settings.php' );