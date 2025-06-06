<?php
session_start();

// Define paths
define('ROOT_PATH', dirname(__DIR__));
define('APP_PATH', ROOT_PATH . '/app');

// Error reporting (development only)
error_reporting(E_ALL);
ini_set('display_errors', 1);

// Autoload core classes
require_once APP_PATH . '/config/database.php';
require_once APP_PATH . '/core/router.php';
require_once APP_PATH . '/core/controller.php';
require_once APP_PATH . '/core/model.php';

// Autoload controllers
require_once APP_PATH . '/controllers/authcontroller.php';
require_once APP_PATH . '/controllers/newscontroller.php';
require_once APP_PATH . '/controllers/admincontroller.php';
require_once APP_PATH . '/controllers/usercontroller.php';

// Initialize router
$router = new Router();

// Define routes
$router->add('/', 'NewsController', 'index');
$router->add('/news/{id}', 'newscontroller', 'detail');
$router->add('/auth/login', 'authcontroller', 'login');
$router->add('/auth/login', 'authcontroller', 'login', 'POST');
$router->add('/auth/register', 'authcontroller', 'register');
$router->add('/auth/register', 'authcontroller', 'register', 'POST');
$router->add('/auth/logout', 'authcontroller', 'logout');
$router->add('/admin/dashboard', 'admincontroller', 'dashboard');
$router->add('/admin/news-list', 'admincontroller', 'newsList');
$router->add('/admin/add-news', 'admincontroller', 'addNews');
$router->add('/admin/add-news', 'admincontroller', 'addNews', 'POST');
$router->add('/admin/edit-news', 'admincontroller', 'editNews');
$router->add('/admin/edit-news', 'admincontroller', 'editNews', 'POST');
$router->add('/admin/delete-news', 'admincontroller', 'deleteNews', 'POST');
$router->add('/user/dashboard', 'usercontroller', 'dashboard');
$router->add('/user/dashboard', 'usercontroller', 'dashboard', 'POST');

// Dispatch request
$url = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);
$method = $_SERVER['REQUEST_METHOD'];
$router->dispatch($url, $method);