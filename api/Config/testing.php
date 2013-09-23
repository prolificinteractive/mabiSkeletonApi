<?php



include_once 'PHPUnit/Autoload.php';

class AppTest extends \PHPUnit_Framework_TestCase {

  /**
   * @var \MABI\App
   */
  protected $app;


  protected function setUp() {

    parent::setUp();

    include_once __DIR__ . '/../../mabi/bootstrap.php';

    \Slim\Environment::mock();
    include __DIR__ . '/config.test.php';

    $this->app = \MABI\App::getSingletonApp();
  }

  /**
   * Makes a call to the application
   *
   * @param $path string The path that you want to make a call for
   * @param $queryString string The query string that you would attach to the url (e.g. q=search+string&lat=34.32)
   * @param $httpMethod string Can be any HTTP method e.g. GET, POST, PUT, DELETE
   * @param $requestBody string The content of the request (usually used for POST or PUT)
   * @param $headers string[] An associative array containing headers and their values
   *
   * @return \MABI\App
   */
  protected function makeAppCall($path,
                                 $queryString = '',
                                 $httpMethod = 'GET',
                                 $requestBody = NULL,
                                 $headers = array()) {

    $app = $this->setupAppCall($path,
      $queryString,
      $httpMethod,
      $requestBody,
      $headers);

    $app->call();
    return $app;
  }

  /**
   * Sets up a call to the application.  Can be used to modify controllers for tests before
   * actually making the call.
   *
   * @param $path string The path that you want to make a call for
   * @param $queryString string The query string that you would attach to the url (e.g. q=search+string&lat=34.32)
   * @param $httpMethod string Can be any HTTP method e.g. GET, POST, PUT, DELETE
   * @param $requestBody string The content of the request (usually used for POST or PUT)
   * @param $headers string[] An associative array containing headers and their values
   *
   * @return \MABI\App
   */
  protected function setupAppCall($path,
                                  $queryString = '',
                                  $httpMethod = 'GET',
                                  $requestBody = NULL,
                                  $headers = array()) {

    \MABI\App::clearSingletonApp();

    include_once __DIR__ . '/../../mabi/bootstrap.php';

    $env = array('REQUEST_METHOD' => $httpMethod, 'QUERY_STRING' => $queryString, 'PATH_INFO' => $path);
    if (!empty($requestBody)) {
      $env['slim.input'] = $requestBody;
    }
    foreach ($headers as $key => $value) {
      $env[$key] = $value;
    }
    \Slim\Environment::mock($env);
    include __DIR__ . '/config.test.php';

    $app = \MABI\App::getSingletonApp();

    $this->app = $app;
    return $app;
  }

  function tearDown() {
    \MABI\App::clearSingletonApp();
  }

}