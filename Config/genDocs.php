<?php

include_once __DIR__ . '/../mabi/bootstrap.php';
\Slim\Environment::mock();
include_once __DIR__ . '/config.php';

include_once __DIR__ . '/../mabi/autodocs/MarkdownParser.php';

echo (json_encode($app->getDocJSON(new \MABI\Autodocs\MarkdownParser())));
