<?php

include_once __DIR__ . '/../vendor/autoload.php';
include_once __DIR__ . '/../mabi/bootstrap.php';
include_once __DIR__ . '/../Config/config.php';

MABI\App::getSingletonApp()->run();