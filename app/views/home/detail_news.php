<?php 
$title = htmlspecialchars($news['title']) . ' - News Portal';
require_once APP_PATH . '/views/layouts/header.php'; 
require_once APP_PATH . '/views/layouts/navbar.php'; 
?>

<div class="container mx-auto p-4">
    <div class="max-w-4xl mx-auto">
        <!-- Back Button with Admin Detection -->
        <div class="mb-6 flex items-center justify-between">
            <div class="flex space-x-3">
                <a href="/" class="inline-flex items-center text-blue-600 hover:text-blue-800">
                    <svg class="w-4 h-4 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 19l-7-7 7-7"></path>
                    </svg>
                    Back to Homepage
                </a>
                
                <!-- Admin Back to Dashboard Button -->
                <?php if (isset($_SESSION['user_id']) && isset($_SESSION['role']) && $_SESSION['role'] === 'admin'): ?>
                    <a href="/admin/dashboard" class="inline-flex items-center text-green-600 hover:text-green-800 bg-green-50 px-3 py-1 rounded-full">
                        <svg class="w-4 h-4 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 19v-6a2 2 0 00-2-2H5a2 2 0 00-2 2v6a2 2 0 002 2h2a2 2 0 002-2zm0 0V9a2 2 0 012-2h2a2 2 0 012 2v10m-6 0a2 2 0 002 2h2a2 2 0 002-2m0 0V5a2 2 0 012-2h2a2 2 0 012 2v14a2 2 0 01-2 2h-2a2 2 0 01-2-2z"></path>
                        </svg>
                        Admin Dashboard
                    </a>
                <?php endif; ?>
            </div>
            
            <!-- Admin Quick Actions -->
            <?php if (isset($_SESSION['user_id']) && isset($_SESSION['role']) && $_SESSION['role'] === 'admin'): ?>
                <div class="flex space-x-2">
                    <a href="/admin/edit-news?id=<?= $news['id'] ?>" 
                       class="inline-flex items-center text-blue-600 hover:text-blue-800 bg-blue-50 px-3 py-1 rounded-full text-sm">
                        <svg class="w-4 h-4 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"></path>
                        </svg>
                        Quick Edit
                    </a>
                    <a href="/admin/news-list" 
                       class="inline-flex items-center text-gray-600 hover:text-gray-800 bg-gray-50 px-3 py-1 rounded-full text-sm">
                        <svg class="w-4 h-4 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 10h16M4 14h16M4 18h16"></path>
                        </svg>
                        All News
                    </a>
                </div>
            <?php endif; ?>
        </div>

        <!-- Success/Error Messages -->
        <?php if (isset($_SESSION['success'])): ?>
            <div class="bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded mb-6">
                <?= htmlspecialchars($_SESSION['success']) ?>
                <?php unset($_SESSION['success']); ?>
            </div>
        <?php elseif (isset($_SESSION['error'])): ?>
            <div class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded mb-6">
                <?= htmlspecialchars($_SESSION['error']) ?>
                <?php unset($_SESSION['error']); ?>
            </div>
        <?php endif; ?>

        <!-- Article -->
        <article class="bg-white rounded-lg shadow-lg overflow-hidden">
            <!-- Featured Image -->
            <img src="/<?= htmlspecialchars($news['image']) ?>" 
                 alt="<?= htmlspecialchars($news['title']) ?>" 
                 class="w-full h-64 md:h-96 object-cover">
            
            <div class="p-8">
                <!-- Article Meta -->
                <div class="flex items-center mb-6">
                    <span class="bg-blue-100 text-blue-800 text-sm font-medium px-3 py-1 rounded-full">
                        <?= htmlspecialchars($news['categoryName']) ?>
                    </span>
                    <span class="text-gray-500 ml-4">
                        Published on <?= date('F j, Y', strtotime($news['release_date'])) ?>
                    </span>
                    
                    <!-- Admin Info Display -->
                    <?php if (isset($_SESSION['user_id']) && isset($_SESSION['role']) && $_SESSION['role'] === 'admin'): ?>
                        <span class="text-gray-400 ml-4 text-sm">
                            Created: <?= date('M j, Y \a\t g:i A', strtotime($news['created_at'])) ?>
                        </span>
                    <?php endif; ?>
                </div>
                
                <!-- Article Title -->
                <h1 class="text-3xl md:text-4xl font-bold text-gray-900 mb-6 leading-tight">
                    <?= htmlspecialchars($news['title']) ?>
                </h1>
                
                <!-- Article Content -->
                <div class="prose max-w-none">
                    <div class="text-gray-700 leading-relaxed text-lg">
                        <?= nl2br(htmlspecialchars($news['content'])) ?>
                    </div>
                </div>
                
                <!-- Interaction Buttons -->
                <div class="mt-8">
                    <?php 
                    $news_id = $news['id'];
                    include APP_PATH . '/views/components/interaction_buttons.php';
                    ?>
                </div>
                
                <!-- Article Footer -->
                <div class="mt-8 pt-6 border-t border-gray-200">
                    <div class="flex items-center justify-between">
                        <div class="flex space-x-4">
                            <a href="/" class="text-blue-600 hover:text-blue-800">← Back To Homepage</a>
                            
                            <!-- Admin Footer Links -->
                            <?php if (isset($_SESSION['user_id']) && isset($_SESSION['role']) && $_SESSION['role'] === 'admin'): ?>
                                <span class="text-gray-300">|</span>
                                <a href="/admin/dashboard" class="text-green-600 hover:text-green-800">Admin Dashboard</a>
                                <a href="/admin/edit-news?id=<?= $news['id'] ?>" class="text-blue-600 hover:text-blue-800">Edit Article</a>
                            <?php endif; ?>
                        </div>
                    </div>
                </div>
            </div>
        </article>
        
        <!-- Comments Section -->
        <?php 
        $news_id = $news['id'];
        include APP_PATH . '/views/components/comment_section.php';
        ?>
        
        <!-- Related Articles Section -->
        <div class="mt-8">
            <h3 class="text-2xl font-bold mb-4">Related Articles</h3>
            <div class="bg-white p-6 rounded-lg shadow">
                <p class="text-gray-600 text-center">
                    <a href="/?category=<?= urlencode($news['categoryId']) ?>" class="text-blue-600 hover:text-blue-800">
                        View more <?= htmlspecialchars($news['categoryName']) ?> articles →
                    </a>
                </p>
            </div>
        </div>
    </div>
</div>
