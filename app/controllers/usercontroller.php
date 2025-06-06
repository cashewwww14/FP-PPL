<?php
require_once APP_PATH . '/core/controller.php';
require_once APP_PATH . '/models/user.php';

class UserController extends Controller {
    private $userModel;
    
    public function __construct() {
        $this->userModel = new User();
    }
    
    public function dashboard() {
        $this->requireAuth();
        
        $user_id = $_SESSION['user_id'];
        $user = $this->userModel->findById($user_id);
        
        if (!$user) {
            $this->redirect('/auth/logout');
        }
        
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $data = [
                'name' => $_POST['name'] ?? '',
                'email' => $_POST['email'] ?? '',
                'birth_date' => $_POST['birth_date'] ?? '',
                'gender' => $_POST['gender'] ?? ''

            ];
            
            // Validation
            if (empty($data['name']) || empty($data['email'])) {
                $_SESSION['error'] = "Name and email are required!";
            } elseif (!filter_var($data['email'], FILTER_VALIDATE_EMAIL)) {
                $_SESSION['error'] = "Invalid email format!";
            } else {
                if ($this->userModel->updateProfile($user_id, $data)) {
                    $_SESSION['success'] = "Profile updated successfully!";
                } else {
                    $_SESSION['error'] = "Error updating profile.";
                }
            }
            
            $this->redirect('/user/dashboard');
        }
        
        $this->view('user/dashboard', ['user' => $user]);
    }
}