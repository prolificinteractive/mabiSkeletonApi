<?php

use MABI\ErrorResponseDictionary;

class Errors extends ErrorResponseDictionary {
  public static $SAMPLE_ERROR = array(
    'SAMPLE_ERROR_KEY' =>
    array(
      'message'  => 'Invalid session user',
      'httpcode' => 401,
      'code'     => 1
    )
  );
}
