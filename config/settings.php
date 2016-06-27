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
$settings['install_profile'] = 'config_installer';
$config_directories['sync'] = '/config';
