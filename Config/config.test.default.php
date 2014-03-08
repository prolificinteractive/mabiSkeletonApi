<?php

$app = MABI\App::getSingletonApp();

include_once __DIR__ . '/../mabi/MongoDataConnection.php';

$app->addDataConnection(
  'default',
  MABI\MongoDataConnection::create(
    'mongodb://user:password@localhost:27017/testDB'
  )
);

// Make sure cache is turned on for top performance in production. Example below:
// $app->addCacheRepository('system', 'file', array());

/**
 * Put extensions here
 * EXAMPLE
 * include_once __DIR__ . '/../mabi/extensions/FacebookIdentity/FacebookIdentity.php';
 * $app->addExtension(new \MABI\FacebookIdentity\FacebookIdentity($app,
 *   new \MABI\Identity\Identity($app, new \MABI\RESTAccess\RESTAccess($app))));
 */

include __DIR__ . '/pathSetup.php';
