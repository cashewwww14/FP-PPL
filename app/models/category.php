<?php
require_once APP_PATH . '/core/Model.php';

class Category extends Model {
    protected $table = 'categories';
    
    public function getAllCategories() {
        $stmt = $this->db->prepare("SELECT * FROM {$this->table} ORDER BY name ASC");
        $stmt->execute();
        return $stmt->fetchAll();
    }
    
    public function getCategoryNames() {
        $stmt = $this->db->prepare("SELECT name FROM {$this->table} ORDER BY name ASC");
        $stmt->execute();
        return array_column($stmt->fetchAll(), 'name');
    }
    
    public function addCategory($name) {
        $stmt = $this->db->prepare("INSERT INTO {$this->table} (name) VALUES (?)");
        return $stmt->execute([trim($name)]);
    }
    
    public function updateCategory($id, $name) {
        $stmt = $this->db->prepare("UPDATE {$this->table} SET name = ? WHERE id = ?");
        return $stmt->execute([trim($name), $id]);
    }
    
    public function categoryExists($name) {
        $stmt = $this->db->prepare("SELECT COUNT(*) FROM {$this->table} WHERE name = ?");
        $stmt->execute([trim($name)]);
        return $stmt->fetchColumn() > 0;
    }

    public function categoryExistsExcluding($name, $excludeId) {
        $stmt = $this->db->prepare("SELECT COUNT(*) FROM categories WHERE name = ? AND id != ?");
        $stmt->execute([$name, $excludeId]);
        return $stmt->fetchColumn() > 0;
    }
}