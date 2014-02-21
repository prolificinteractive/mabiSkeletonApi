<?php

include_once __DIR__ . '/../mabi/bootstrap.php';
\Slim\Environment::mock();
include_once __DIR__ . '/config.php';

echo $app->getIOSModel();
