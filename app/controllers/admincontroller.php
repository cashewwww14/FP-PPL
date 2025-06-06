<?php
require_once APP_PATH . '/core/controller.php';
require_once APP_PATH . '/models/news.php';
require_once APP_PATH . '/models/category.php';

class AdminController extends Controller {
    private $newsModel;
    private $categoryModel;
    
    public function __construct() {
        $this->newsModel = new News();
        $this->categoryModel = new Category();
    }
    
    public function dashboard() {
        $this->requireAdmin();
        
        // Update: Dapatkan news dengan kategori
        $latestNews = $this->newsModel->getLatestWithCategory(9);
        $this->view('admin/dashboard', ['latestNews' => $latestNews]);
    }
    
    public function newsList() {
        $this->requireAdmin();
        
        // Update: Dapatkan semua news dengan kategori
        $news = $this->newsModel->findAllWithCategory();
        $this->view('admin/list_news', ['news' => $news]);
    }
    
    public function addNews() {
        $this->requireAdmin();
        
        // Handle AJAX requests for category management
        if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['action'])) {
            header('Content-Type: application/json');
            
            switch ($_POST['action']) {
                case 'add_category':
                    $this->handleAddCategory();
                    break;
                case 'edit_category':
                    $this->handleEditCategory();
                    break;
            }
            exit;
        }
        
        // Handle GET request for categories
        if ($_SERVER['REQUEST_METHOD'] === 'GET' && isset($_GET['action']) && $_GET['action'] === 'get_categories') {
            $this->getCategoriesAjax();
            exit;
        }
        
        $error = null;
        $categoriesFromDB = $this->categoryModel->getAllCategories();
        $categories = array_column($categoriesFromDB, 'name'); // For backward compatibility
        
        if ($_SERVER['REQUEST_METHOD'] === 'POST' && !isset($_POST['action'])) {
            $data = [
                'title' => $_POST['title'] ?? '',
                'content' => $_POST['content'] ?? '',
                'release_date' => $_POST['release_date'] ?? '',
                'category_id' => $_POST['category_id'] ?? '' // Updated from 'category'
            ];
            
            // Validation
            if (empty($data['title']) || empty($data['content']) || empty($data['release_date']) || empty($data['category_id'])) {
                $error = "All fields are required!";
            } else {
                // Handle file upload
                if (isset($_FILES['image']) && $_FILES['image']['error'] === 0) {
                    $uploadResult = $this->handleImageUpload($_FILES['image']);
                    if ($uploadResult['success']) {
                        $data['image'] = $uploadResult['path'];
                    } else {
                        $error = $uploadResult['error'];
                    }
                } else {
                    $error = "Please select an image to upload.";
                }
                
                if (!$error && $this->newsModel->create($data)) {
                    $this->redirect('/admin/dashboard');
                } elseif (!$error) {
                    $error = "Failed to create news article.";
                }
            }
        }
        
        $this->view('admin/add_news', [
            'error' => $error, 
            'categories' => $categories,
            'categoriesFromDB' => $categoriesFromDB
        ]);
    }
    
    public function editNews() {
        $this->requireAdmin();
        
        $id = $_GET['id'] ?? null;
        if (!$id || !is_numeric($id)) {
            $this->redirect('/admin/list-news');
        }
        
        $news = $this->newsModel->findByIdWithCategory($id);
        if (!$news) {
            $this->redirect('/admin/list-news');
        }
        
        $error = null;
        $categoriesFromDB = $this->categoryModel->getAllCategories();
        $categories = array_column($categoriesFromDB, 'name');
        
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $data = [
                'title' => $_POST['title'] ?? '',
                'content' => $_POST['content'] ?? '',
                'release_date' => $_POST['release_date'] ?? '',
                'category_id' => $_POST['category_id'] ?? '' // Updated from 'category'
            ];
            
            // Validation
            if (empty($data['title']) || empty($data['content']) || empty($data['release_date']) || empty($data['category_id'])) {
                $error = "All fields are required!";
            } else {
                // Handle file upload if new image is provided
                if (isset($_FILES['image']) && $_FILES['image']['error'] === 0) {
                    $uploadResult = $this->handleImageUpload($_FILES['image']);
                    if ($uploadResult['success']) {
                        $data['image'] = $uploadResult['path'];
                    } else {
                        $error = $uploadResult['error'];
                    }
                }
                
                if (!$error && $this->newsModel->update($id, $data)) {
                    $this->redirect('/admin/list-news');
                } elseif (!$error) {
                    $error = "Failed to update news article.";
                }
            }
        }
        
        $this->view('admin/edit_news', [
            'news' => $news, 
            'error' => $error, 
            'categories' => $categories,
            'categoriesFromDB' => $categoriesFromDB
        ]);
    }
    
    public function deleteNews() {
        $this->requireAdmin();
        
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $id = $_POST['delete_id'] ?? null;
            if ($id && is_numeric($id)) {
                $this->newsModel->delete($id);
            }
        }
        
        $this->redirect('/admin/list-news');
    }
    
    // Category Management Methods
    private function handleAddCategory() {
        $categoryName = trim($_POST['category_name']);
        
        if (empty($categoryName)) {
            echo json_encode(['success' => false, 'message' => 'Category name is required']);
            return;
        }
        
        if ($this->categoryModel->categoryExists($categoryName)) {
            echo json_encode(['success' => false, 'message' => 'Category already exists']);
            return;
        }
        
        if ($this->categoryModel->create($categoryName)) {
            $categories = $this->categoryModel->getAllCategories();
            echo json_encode([
                'success' => true, 
                'message' => 'Category added successfully',
                'categories' => $categories
            ]);
        } else {
            echo json_encode(['success' => false, 'message' => 'Failed to add category']);
        }
    }
    
    private function handleEditCategory() {
        $categoryId = (int)$_POST['category_id'];
        $categoryName = trim($_POST['category_name']);
        
        if (empty($categoryName) || $categoryId <= 0) {
            echo json_encode(['success' => false, 'message' => 'Valid category ID and name are required']);
            return;
        }
        
        if ($this->categoryModel->categoryExistsExcluding($categoryName, $categoryId)) {
            echo json_encode(['success' => false, 'message' => 'Category name already exists']);
            return;
        }
        
        if ($this->categoryModel->update($categoryId, $categoryName)) {
            $categories = $this->categoryModel->getAllCategories();
            echo json_encode([
                'success' => true, 
                'message' => 'Category updated successfully',
                'categories' => $categories
            ]);
        } else {
            echo json_encode(['success' => false, 'message' => 'Failed to update category']);
        }
    }
    
    private function getCategoriesAjax() {
        header('Content-Type: application/json');
        
        $categories = $this->categoryModel->getAllCategories();
        echo json_encode(['success' => true, 'categories' => $categories]);
    }
    
    private function handleImageUpload($file) {
        $targetDir = ROOT_PATH . "/public/assets/news/";
        
        // Create uploads directory if it doesn't exist
        if (!file_exists($targetDir)) {
            mkdir($targetDir, 0755, true);
        }
        
        $fileName = time() . '_' . basename($file['name']);
        $targetFile = $targetDir . $fileName;
        $imageExtension = strtolower(pathinfo($targetFile, PATHINFO_EXTENSION));
        
        $validExtensions = ['jpg', 'jpeg', 'png', 'gif'];
        
        if (!in_array($imageExtension, $validExtensions)) {
            return ['success' => false, 'error' => 'Only JPG, JPEG, PNG & GIF files are allowed.'];
        }
        
        if ($file['size'] > 5000000) { // 5MB
            return ['success' => false, 'error' => 'File is too large (max 5MB).'];
        }
        
        if (move_uploaded_file($file['tmp_name'], $targetFile)) {
            return ['success' => true, 'path' => '/public/assets/news/' . $fileName];
        } else {
            return ['success' => false, 'error' => 'Failed to upload file.'];
        }
    }
}