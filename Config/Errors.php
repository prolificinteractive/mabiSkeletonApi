<?php

use MABI\ErrorResponseDictionary;

class Errors extends ErrorResponseDictionary {
  public static $SAMPLE_ERROR = array(
    'THREADLESS_API_LOGIN_ERROR' => array(
      'message'  => 'Invalid session user',
      'httpcode' => 401,
      'code'     => 1
    )
  );
}
