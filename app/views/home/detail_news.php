<?php 
$title = htmlspecialchars($news['title']) . ' - News Portal';
require_once APP_PATH . '/views/layouts/header.php'; 
require_once APP_PATH . '/views/layouts/navbar.php'; 
?>

<div class="container mx-auto p-4">
    <div class="max-w-4xl mx-auto">
        <!-- Back Button -->
        <div class="mb-6">
            <a href="/" class="inline-flex items-center text-blue-600 hover:text-blue-800">
                <svg class="w-4 h-4 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 19l-7-7 7-7"></path>
                </svg>
                Back to News
            </a>
        </div>

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
                        <?= htmlspecialchars($news['category']) ?>
                    </span>
                    <span class="text-gray-500 ml-4">
                        Published on <?= date('F j, Y', strtotime($news['release_date'])) ?>
                    </span>
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
                
                <!-- Article Footer -->
                <div class="mt-8 pt-6 border-t border-gray-200">
                    <div class="flex items-center justify-between">
                        <div class="flex space-x-4">
                            <a href="/" class="text-blue-600 hover:text-blue-800">← More News</a>
                        </div>
                    </div>
                </div>
            </div>
        </article>
        
        <!-- Related Articles Section (optional enhancement) -->
        <div class="mt-8">
            <h3 class="text-2xl font-bold mb-4">Related Articles</h3>
            <div class="bg-white p-6 rounded-lg shadow">
                <p class="text-gray-600 text-center">
                    <a href="/?category=<?= urlencode($news['category']) ?>" class="text-blue-600 hover:text-blue-800">
                        View more <?= htmlspecialchars($news['category']) ?> articles →
                    </a>
                </p>
            </div>
        </div>
    </div>
</div>
