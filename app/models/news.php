<?php
require_once APP_PATH . '/core/model.php';

class News extends Model {
    protected $table = 'news';
    
    // Method baru untuk dashboard dengan kategori (PENTING!)
    public function getLatestWithCategory($limit = 10) {
        $limit = intval($limit);
        if ($limit <= 0) $limit = 10;
        if ($limit > 100) $limit = 100;
        
        $sql = "SELECT n.*, 
                       c.name as categoryName,
                       c.id as categoryId
                FROM {$this->table} n 
                LEFT JOIN categories c ON n.category_id = c.id 
                ORDER BY n.release_date DESC 
                LIMIT " . $limit;
        
        $stmt = $this->db->prepare($sql);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
    
    // Method untuk list semua news dengan kategori
    public function findAllWithCategory() {
        $stmt = $this->db->prepare("
            SELECT n.*, 
                   c.name as categoryName,
                   c.id as categoryId
            FROM {$this->table} n 
            LEFT JOIN categories c ON n.category_id = c.id 
            ORDER BY n.release_date DESC
        ");
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
    
    // Method untuk edit news dengan kategori
    public function findByIdWithCategory($id) {
        $stmt = $this->db->prepare("
            SELECT n.*, 
                   c.name as categoryName,
                   c.id as categoryId
            FROM {$this->table} n 
            LEFT JOIN categories c ON n.category_id = c.id 
            WHERE n.id = ?
        ");
        $stmt->execute([$id]);
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }
    
    // Update method untuk foreign key
    public function findByCategory($categoryId) {
        $stmt = $this->db->prepare("
            SELECT n.*, 
                   c.name as categoryName,
                   c.id as categoryId
            FROM {$this->table} n 
            LEFT JOIN categories c ON n.category_id = c.id 
            WHERE n.category_id = ? 
            ORDER BY n.release_date DESC
        ");
        $stmt->execute([$categoryId]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
    
    // Update search dengan JOIN
    public function search($query) {
        $stmt = $this->db->prepare("
            SELECT n.*, 
                   c.name as categoryName,
                   c.id as categoryId
            FROM {$this->table} n 
            LEFT JOIN categories c ON n.category_id = c.id 
            WHERE n.title LIKE ? 
            ORDER BY n.release_date DESC
        ");
        $stmt->execute(["%{$query}%"]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
    
    // Method asli (tetap ada untuk backward compatibility)
    public function getLatest($limit = 10) {
        $limit = intval($limit);
        if ($limit <= 0) $limit = 10;
        if ($limit > 100) $limit = 100;
        
        $sql = "SELECT * FROM {$this->table} ORDER BY release_date DESC LIMIT " . $limit;
        $stmt = $this->db->prepare($sql);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
    
    // Update filterNews untuk foreign key
    public function filterNews($categoryId = null, $search = null) {
        $sql = "SELECT n.*, 
                       c.name as categoryName,
                       c.id as categoryId
                FROM {$this->table} n 
                LEFT JOIN categories c ON n.category_id = c.id";
        $params = [];
        $conditions = [];
        
        if ($categoryId) {
            $conditions[] = "n.category_id = ?";
            $params[] = $categoryId;
        }
        
        if ($search) {
            $conditions[] = "n.title LIKE ?";
            $params[] = "%{$search}%";
        }
        
        if (!empty($conditions)) {
            $sql .= " WHERE " . implode(' AND ', $conditions);
        }
        
        $sql .= " ORDER BY n.release_date DESC";
        
        $stmt = $this->db->prepare($sql);
        $stmt->execute($params);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
    
    // Update getCategories untuk mengambil dari database
    public function getCategories() {
        $stmt = $this->db->prepare("SELECT name FROM categories ORDER BY name");
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_COLUMN);
    }
    
    // Method untuk create dengan category_id
    public function create($data) {
        $stmt = $this->db->prepare("
            INSERT INTO {$this->table} (title, content, category_id, release_date, image) 
            VALUES (?, ?, ?, ?, ?)
        ");
        return $stmt->execute([
            $data['title'],
            $data['content'],
            $data['category_id'],
            $data['release_date'],
            $data['image']
        ]);
    }
    
    // Method untuk update dengan category_id
    public function update($id, $data) {
        if (isset($data['image'])) {
            $stmt = $this->db->prepare("
                UPDATE {$this->table} 
                SET title = ?, content = ?, category_id = ?, release_date = ?, image = ? 
                WHERE id = ?
            ");
            return $stmt->execute([
                $data['title'],
                $data['content'],
                $data['category_id'],
                $data['release_date'],
                $data['image'],
                $id
            ]);
        } else {
            $stmt = $this->db->prepare("
                UPDATE {$this->table} 
                SET title = ?, content = ?, category_id = ?, release_date = ? 
                WHERE id = ?
            ");
            return $stmt->execute([
                $data['title'],
                $data['content'],
                $data['category_id'],
                $data['release_date'],
                $id
            ]);
        }
    }
    
    // Override findAll untuk mengurutkan berdasarkan tanggal terbaru
    public function findAll() {
        $stmt = $this->db->prepare("SELECT * FROM {$this->table} ORDER BY release_date DESC");
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
    
    // Method standard dari parent class
    public function findById($id) {
        $stmt = $this->db->prepare("SELECT * FROM {$this->table} WHERE id = ?");
        $stmt->execute([$id]);
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }
    
    public function delete($id) {
        $stmt = $this->db->prepare("DELETE FROM {$this->table} WHERE id = ?");
        return $stmt->execute([$id]);
    }
}