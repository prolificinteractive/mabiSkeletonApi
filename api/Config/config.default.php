<?php

$app = MABI\App::getSingletonApp();

include_once __DIR__ . '/../../mabi/MongoDataConnection.php';
include_once __DIR__ . '/Errors.php';

$app->addDataConnection(
  'default',
  MABI\MongoDataConnection::create(
    'localhost',
    '27017',
    'defaultDB'
  /*    'user',
      'password' */
  )
);

/**
 * Put extensions here 
 * EXAMPLE
 * include_once __DIR__ . '/../../mabi/extensions/FacebookIdentity/FacebookIdentity.php';
 * $app->addExtension(new \MABI\FacebookIdentity\FacebookIdentity($app,
 *   new \MABI\Identity\Identity($app, new \MABI\RESTAccess\RESTAccess($app))));
 */

include_once __DIR__ . '/pathSetup.php';