<?php 
$title = 'Admin Dashboard - News Portal';
require_once APP_PATH . '/views/layouts/header.php'; 
?>

<header class="bg-gradient-to-r from-blue-600 to-blue-800 text-white p-6">
    <div class="container mx-auto">
        <h1 class="text-3xl font-bold">Admin Dashboard</h1>
        <p class="mt-2 opacity-90">Manage your news portal</p>
    </div>
</header>

<div class="container mx-auto px-6 py-4">
    <div class="flex space-x-4">
        <a href="/" class="text-blue-600 hover:text-blue-800 flex items-center">
            <svg class="w-4 h-4 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 19l-7-7 7-7"></path>
            </svg>
            Back to Home
        </a>
        <a href="/auth/logout" class="text-red-600 hover:text-red-800 ml-auto flex items-center">
            <svg class="w-4 h-4 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 16l4-4m0 0l-4-4m4 4H7m6 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h4a3 3 0 013 3v1"></path>
            </svg>
            Sign Out
        </a>
    </div>
</div>

<div class="container mx-auto p-6">
    <!-- Quick Actions -->
    <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mb-8">
        <a href="/admin/add-news" class="group">
            <div class="bg-white p-6 rounded-xl shadow-lg hover:shadow-xl transition-all duration-300 group-hover:-translate-y-1">
                <div class="flex items-center">
                    <div class="p-3 bg-blue-100 rounded-lg">
                        <svg class="w-6 h-6 text-blue-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6v6m0 0v6m0-6h6m-6 0H6"></path>
                        </svg>
                    </div>
                    <div class="ml-4">
                        <h3 class="text-lg font-semibold text-gray-900">Add News</h3>
                        <p class="text-sm text-gray-600">Create and add new articles</p>
                    </div>
                </div>
            </div>
        </a>

        <a href="/admin/news-list" class="group">
            <div class="bg-white p-6 rounded-xl shadow-lg hover:shadow-xl transition-all duration-300 group-hover:-translate-y-1">
                <div class="flex items-center">
                    <div class="p-3 bg-green-100 rounded-lg">
                        <svg class="w-6 h-6 text-green-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 10h16M4 14h16M4 18h16"></path>
                        </svg>
                    </div>
                    <div class="ml-4">
                        <h3 class="text-lg font-semibold text-gray-900">View News List</h3>
                        <p class="text-sm text-gray-600">Manage and view all news articles</p>
                    </div>
                </div>
            </div>
        </a>
    </div>

    <!-- Latest News -->
    <div class="bg-white rounded-xl shadow-lg p-6">
        <div class="flex items-center justify-between mb-6">
            <h2 class="text-2xl font-bold text-gray-900">Latest News</h2>
            <a href="/admin/news-list" class="text-blue-600 hover:text-blue-800 font-medium">View All →</a>
        </div>
        
        <?php if (!empty($latestNews)): ?>
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                <?php foreach ($latestNews as $article): ?>
                    <div class="border border-gray-200 rounded-lg p-4 hover:shadow-md transition-shadow">
                        <div class="flex items-center mb-2">
                            <span class="bg-blue-100 text-blue-800 text-xs font-medium px-2 py-1 rounded">
                                <?= htmlspecialchars($article['categoryName'] ?? 'No Category') ?>
                            </span>
                            <span class="text-gray-500 text-xs ml-auto">
                                <?= date('M j, Y', strtotime($article['release_date'])) ?>
                            </span>
                        </div>
                        
                        <!-- Enhanced Time Display -->
                        <div class="flex items-center text-xs text-gray-500 mb-3">
                            <svg class="w-3 h-3 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                            </svg>
                            <span class="mr-3">
                                Created: <?= date('g:i A', strtotime($article['created_at'])) ?>
                            </span>
                            <?php if ($article['created_at'] !== $article['release_date']): ?>
                                <span class="text-green-600">
                                    <svg class="w-3 h-3 inline mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"></path>
                                    </svg>
                                    Published: <?= date('M j, g:i A', strtotime($article['release_date'])) ?>
                                </span>
                            <?php endif; ?>
                        </div>
                        
                        <h3 class="font-semibold text-gray-900 mb-2 line-clamp-2">
                            <?= htmlspecialchars($article['title']) ?>
                        </h3>
                        <p class="text-gray-600 text-sm line-clamp-2 mb-3">
                            <?= htmlspecialchars(substr($article['content'], 0, 100)) ?>...
                        </p>
                        
                        <!-- Action Buttons -->
                        <div class="flex space-x-2 mt-3">
                            <a href="/admin/edit-news?id=<?= $article['id'] ?>" 
                               class="text-xs bg-blue-500 text-white px-3 py-1 rounded hover:bg-blue-600 transition-colors">
                                <svg class="w-3 h-3 inline mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"></path>
                                </svg>
                                Edit
                            </a>
                            <a href="/news/<?= $article['id'] ?>" 
                               class="text-xs bg-green-500 text-white px-3 py-1 rounded hover:bg-green-600 transition-colors">
                                <svg class="w-3 h-3 inline mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"></path>
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z"></path>
                                </svg>
                                View
                            </a>
                            
                            <!-- Time Since Published -->
                            <div class="text-xs text-gray-400 flex items-center ml-auto">
                                <?php 
                                $timeAgo = time() - strtotime($article['created_at']);
                                if ($timeAgo < 3600) {
                                    echo floor($timeAgo / 60) . 'm ago';
                                } elseif ($timeAgo < 86400) {
                                    echo floor($timeAgo / 3600) . 'h ago';
                                } else {
                                    echo floor($timeAgo / 86400) . 'd ago';
                                }
                                ?>
                            </div>
                        </div>
                    </div>
                <?php endforeach; ?>
            </div>
        <?php else: ?>
            <div class="text-center py-8">
                <svg class="mx-auto h-12 w-12 text-gray-400" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 20H5a2 2 0 01-2-2V6a2 2 0 012-2h10a2 2 0 012 2v1m2 13a2 2 0 01-2-2V7m2 13a2 2 0 002-2V9a2 2 0 00-2-2h-2m-4-3H9M7 16h6M7 8h6v4H7V8z" />
                </svg>
                <h3 class="mt-2 text-sm font-medium text-gray-900">No news articles</h3>
                <p class="mt-1 text-sm text-gray-500">Get started by creating your first article.</p>
                <div class="mt-6">
                    <a href="/admin/add-news" class="bg-blue-600 text-white px-4 py-2 rounded-lg hover:bg-blue-700">
                        Add News Article
                    </a>
                </div>
            </div>
        <?php endif; ?>
    </div>
</div>
