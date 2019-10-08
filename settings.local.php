<?php

/**
 * @file
 * Drupal site-specific configuration file.
 */

/**
 * Local error reporting.
 */
error_reporting(E_ALL);
ini_set('display_errors', TRUE);
ini_set('display_startup_errors', TRUE);
ini_set('xdebug.max_nesting_level', 256);

/**
 * Local other settings.
 */
ini_set('upload_max_filesize', '100M');
ini_set('post_max_size', '100M');
$conf['block_cache'] = 0;
$conf['cache'] = 0;
$conf['preprocess_css'] = 0;
$conf['preprocess_js'] = 0;
$conf['securepages_enable'] = FALSE;
$conf['mandrill_api_key'] = FALSE;

/**
 * Databases.
 */
$databases = array (
  'default' => 
  array (
    'default' => 
    array (
      'database' => 'drupal',
      'username' => 'root',
      'password' => 'root',
      'host' => 'mysql',
      'port' => '',
      'driver' => 'mysql',
      'prefix' => '',
    ),
  ),
);

$settings['hash_salt'] = 'V8xV4rh70SN0';

$config['search_api.server.solr']['backend_config']['connector_config']['core'] = 'd8';
$config['search_api.server.solr']['backend_config']['connector_config']['path'] = '/solr';
$config['search_api.server.solr']['backend_config']['connector_config']['host'] = 'solr';
$config['search_api.server.solr']['backend_config']['connector_config']['port'] = '8983';

/**
 * General configs.
 */
$conf['404_fast_html'] = '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML+RDFa 1.0//EN" "http://www.w3.org/MarkUp/DTD/xhtml-rdfa-1.dtd"><html xmlns="http://www.w3.org/1999/xhtml"><head><title>404 Not Found</title></head><body><h1>Not Found</h1><p>The requested URL "@path" was not found on this server.</p></body></html>';
$conf['404_fast_paths'] = '/\.(?:txt|png|gif|jpe?g|css|js|ico|swf|flv|cgi|bat|pl|dll|exe|asp)$/i';
$conf['404_fast_paths_exclude'] = '/\/(?:styles)\//';
$conf['theme_debug'] = '1';
$drupal_hash_salt = 'kczJRAl6ByVYlbSVuiOTvt3zef3q6llP0nXiXQnGJCg';
$update_free_access = FALSE;
ini_set('session.cookie_lifetime', 2000000);
ini_set('session.gc_divisor', 100);
ini_set('session.gc_maxlifetime', 200000);
ini_set('session.gc_probability', 1);

$settings['trusted_host_patterns'] = [
  'localhost',
];

$settings['file_private_path'] = '../private';

$settings['container_yamls'][] = DRUPAL_ROOT . '/sites/default/development.services.yml';
