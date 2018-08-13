<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', 'wp_dbtest1');

/** MySQL database username */
define('DB_USER', 'root');

/** MySQL database password */
define('DB_PASSWORD', 'gibavolley');

/** MySQL hostname */
define('DB_HOST', 'localhost');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '>-#>+Id4x+K7~fm8IX((u=aAM9~P@`4Y0Y~x%hF`OkT#.Ei?[~TqKy-II6x|@O3-');
define('SECURE_AUTH_KEY',  'B_AF}[||D3b&xZAlRNp5#W:1g+Wb$.+qbI#_iSXa0ak=wq-mF3+u3%b,[y.;*H}|');
define('LOGGED_IN_KEY',    '24_gS5BF#S7NlkNhGM[E&?C-Z!!}+cH`Vi981@C<ZP-C2yHUB/`]3++X=|TtZQD.');
define('NONCE_KEY',        'l}Yf+,0|Hf0_{l-0>+DEk$?AeUuW|%0kWU-l/S0?BMn@<k%rcPaK[ e+qQ_PO|)6');
define('AUTH_SALT',        'ZLi%E&YVy%Y]1-Z#1Y?dx`1O[N vRl6BmZn8!ZN3dE0.qCm&#z5&*9,I:yC1j]+O');
define('SECURE_AUTH_SALT', 'qwnQ@9-WZH^1$rq-JGN6)ok`239;fhlOr|#zX>SDMm`X~v-Z*6xF+v;|PFN3&/)1');
define('LOGGED_IN_SALT',   'm*kU,O56^([@b*4|w_(Eb%BOQ{xP+dX G-{K`1jSnJ>yCCU#2-];,Lg+/RP`G)+8');
define('NONCE_SALT',       '21+FeGE}q2vl|Z+aC$&c/>VQ>0a%+m`VYk]]B(ik,161;P,-$>v/cH.2_XDS00-G');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'shr_';

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
define('WP_DEBUG', true);

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
define('FS_METHOD', 'direct');