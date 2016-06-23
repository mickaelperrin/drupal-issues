<?php
$databases = array();
$config_directories = array();
$settings['hash_salt'] = 'NRf-_F8WdTjjpJQ8gGQ4xj8A-47KBHzwMga7tt0kmHIZ_CLirX1GE5JD2TmP3XtMCCNgh0lKJQ';
$settings['update_free_access'] = FALSE;
$databases['default']['default'] = array (
    'database' => 'drupal',
    'username' => 'drupal',
    'password' => 'drupal',
    'prefix' => '',
    'host' => 'mysql',
    'port' => '3306',
    'namespace' => 'Drupal\\Core\\Database\\Driver\\mysql',
    'driver' => 'mysql',
);
$settings['install_profile'] = 'standard';
$config_directories['sync'] = 'sites/default/files/config_biQUc5rZMtfMxKP0Qu2CW0AhFsc2GiGcsESAhRW7kBZWsAAtyRh7cWCgc2xNJwYHyIroC7o7hg/sync';

$scheme = isset($_SERVER['REQUEST_SCHEME']) ? $_SERVER['REQUEST_SCHEME'] : 'http';
$settings['file_public_base_url'] = $scheme . '://' . $_SERVER['SERVER_NAME'] . ':9999';
$settings['file_public_path'] = '/files/domain.fr/public';
$settings['file_private_path'] = '/files/domain.fr/private';