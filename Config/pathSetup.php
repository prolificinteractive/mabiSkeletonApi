<?php

$app = MABI\App::getSingletonApp();

// Set up 'Models' path for application-specific models and overrides
$app->setModelLoaders(array(new MABI\DirectoryModelLoader(__DIR__ . '/../Models', $app, 'example')));

// Set up 'Middlewares' path for application-specific middlewares and overrides
$app->setMiddlewareDirectories(array(__DIR__ . '/../Middleware'));

// Set up 'Controllers' path for application-specific controllers and overrides
$dirControllerLoader = new \MABI\DirectoryControllerLoader(__DIR__ . '/../Controllers', $app , 'example');
$app->setControllerLoaders(array(
  $dirControllerLoader,
  new \MABI\GeneratedRESTModelControllerLoader(
    array_diff($app->getExtensionModelClasses(), $dirControllerLoader->getOverriddenModelClasses()), $app)
));

$app->getSlim()->contentType('application/json');

include_once __DIR__ . '/Errors.php';
$app->getErrorResponseDictionary()->overrideErrorResponses(new Errors());