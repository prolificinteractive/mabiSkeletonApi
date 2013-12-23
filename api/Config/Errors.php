<?php


class Errors extends \MABI\ErrorResponseDictionary {
  public static $SAMPLE_ERROR = array(
    'SAMPLE_ERROR_KEY' =>
    array(
      'message' => 'Invalid session user',
      'httpcode' => 401,
      'code' => 1
    )
  );
}
