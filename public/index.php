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

// Autoload models
require_once APP_PATH . '/models/news.php';
require_once APP_PATH . '/models/user.php';
require_once APP_PATH . '/models/interaction.php'; // NEW
require_once APP_PATH . '/models/comment.php'; // NEW

// Autoload controllers
require_once APP_PATH . '/controllers/authcontroller.php';
require_once APP_PATH . '/controllers/newscontroller.php';
require_once APP_PATH . '/controllers/admincontroller.php';
require_once APP_PATH . '/controllers/usercontroller.php';
require_once APP_PATH . '/controllers/interactioncontroller.php'; // NEW
require_once APP_PATH . '/controllers/categorycontroller.php'; // NEW

// Initialize router
$router = new Router();

// Define routes
// Home routes
$router->add('/', 'NewsController', 'index');
$router->add('/news/{id}', 'NewsController', 'detail');

// Auth routes
$router->add('/auth/login', 'AuthController', 'login');
$router->add('/auth/login', 'AuthController', 'login', 'POST');
$router->add('/auth/register', 'AuthController', 'register');
$router->add('/auth/register', 'AuthController', 'register', 'POST');
$router->add('/auth/logout', 'AuthController', 'logout');

// User routes
$router->add('/user/dashboard', 'UserController', 'dashboard');
$router->add('/user/dashboard', 'UserController', 'dashboard', 'POST');

// Admin routes
$router->add('/admin/dashboard', 'AdminController', 'dashboard');
$router->add('/admin/news-list', 'AdminController', 'newsList');
$router->add('/admin/add-news', 'AdminController', 'addNews');
$router->add('/admin/add-news', 'AdminController', 'addNews', 'POST');
$router->add('/admin/edit-news', 'AdminController', 'editNews');
$router->add('/admin/edit-news', 'AdminController', 'editNews', 'POST');
$router->add('/admin/delete-news', 'AdminController', 'deleteNews', 'POST');

// NEW: Category management routes (Admin only)
$router->add('/admin/category/list', 'CategoryController', 'listCategories');
$router->add('/admin/category/add', 'CategoryController', 'addCategory', 'POST');
$router->add('/admin/category/edit', 'CategoryController', 'editCategory', 'POST');
$router->add('/admin/category/delete', 'CategoryController', 'deleteCategory', 'POST');

// NEW: Interaction routes
$router->add('/interactions/toggle-like', 'InteractionController', 'toggleLike', 'POST');
$router->add('/interactions/toggle-bookmark', 'InteractionController', 'toggleBookmark', 'POST');
$router->add('/interactions/add-comment', 'InteractionController', 'addComment', 'POST');
$router->add('/interactions/delete-comment', 'InteractionController', 'deleteComment', 'POST');

// Dispatch request
$url = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);
$method = $_SERVER['REQUEST_METHOD'];
$router->dispatch($url, $method);
