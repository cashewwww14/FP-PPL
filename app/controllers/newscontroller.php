<?php
require_once APP_PATH . '/core/controller.php';
require_once APP_PATH . '/models/news.php';
require_once APP_PATH . '/models/user.php';

class NewsController extends Controller {
    private $newsModel;
    private $userModel;
    
    public function __construct() {
        $this->newsModel = new News();
        $this->userModel = new User();
    }
    
    public function index() {
        $category = $_GET['category'] ?? null;
        $search = $_GET['search'] ?? null;
        
        $news = $this->newsModel->filterNews($category, $search);
        $categories = $this->newsModel->getCategories();
        
        $user_name = '';
        if (isset($_SESSION['user_id'])) {
            $user = $this->userModel->findById($_SESSION['user_id']);
            $user_name = $user['name'] ?? '';
        }
        
        $this->view('home/index', [
            'news' => $news,
            'user_name' => $user_name,
            'categories' => $categories,
            'current_category' => $category,
            'search_query' => $search
        ]);
    }
    
    public function detail() {
        $id = $_GET['id'] ?? null;
        
        if (!$id || !is_numeric($id)) {
            $this->redirect('/');
        }
        
        $news = $this->newsModel->findById($id);
        
        if (!$news) {
            $this->redirect('/');
        }
        
        $this->view('home/detail_news', ['news' => $news]);
    }
}