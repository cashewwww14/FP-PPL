<?php 
$title = 'News Portal - Latest News';
require_once APP_PATH . '/views/layouts/header.php'; 
require_once APP_PATH . '/views/layouts/navbar.php'; 
?>

<div class="container mx-auto p-4">
    <!-- Search Form -->
    <div class="bg-white p-6 rounded-lg shadow-md mb-6">
        <form action="/" method="GET" class="flex flex-col md:flex-row gap-4">
            <input 
                type="text" 
                name="search" 
                placeholder="Search news by title..." 
                value="<?= htmlspecialchars($search_query ?? '') ?>" 
                class="flex-1 p-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"
            >
            <button type="submit" class="bg-blue-500 text-white px-6 py-3 rounded-lg hover:bg-blue-600 transition-colors">
                Search
            </button>
        </form>
    </div>

    <!-- Category Filter -->
    <div class="mb-6">
        <h3 class="text-lg font-semibold mb-3">Categories</h3>
        <div class="flex flex-wrap gap-2">
            <a href="/" class="px-4 py-2 rounded-full <?= !$current_category ? 'bg-blue-600 text-white' : 'bg-gray-200 text-gray-700 hover:bg-gray-300' ?> transition-colors">
                All News
            </a>
            <?php foreach ($categories as $category): ?>
                <a href="/?category=<?= urlencode($category) ?>" 
                   class="px-4 py-2 rounded-full <?= $current_category === $category ? 'bg-blue-600 text-white' : 'bg-gray-200 text-gray-700 hover:bg-gray-300' ?> transition-colors">
                    <?= htmlspecialchars($category) ?>
                </a>
            <?php endforeach; ?>
        </div>
    </div>

    <!-- News Grid -->
    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
        <?php if (!empty($news)): ?>
            <?php foreach ($news as $article): ?>
                <article class="bg-white rounded-lg shadow-md overflow-hidden hover:shadow-lg transition-shadow">
                    <img src="/<?= htmlspecialchars($article['image']) ?>" 
                         alt="<?= htmlspecialchars($article['title']) ?>" 
                         class="w-full h-48 object-cover">
                    
                    <div class="p-6">
                        <div class="flex items-center mb-2">
                            <span class="bg-blue-100 text-blue-800 text-xs font-medium px-2.5 py-0.5 rounded">
                                <?= htmlspecialchars($article['categoryName'] ?? 'No Category') ?>
                            </span>
                            <span class="text-gray-500 text-sm ml-auto">
                                <?= date('M j, Y', strtotime($article['release_date'])) ?>
                            </span>
                        </div>
                        
                        <h2 class="text-xl font-bold mb-3 line-clamp-2">
                            <?= htmlspecialchars($article['title']) ?>
                        </h2>
                        
                        <p class="text-gray-600 mb-4 line-clamp-3">
                            <?= htmlspecialchars(substr($article['content'], 0, 150)) ?>...
                        </p>
                        
                        <a href="/news/<?= $article['id'] ?>" 
                           class="inline-flex items-center text-blue-600 hover:text-blue-800 font-medium">
                            Read More
                            <svg class="w-4 h-4 ml-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7"></path>
                            </svg>
                        </a>
                    </div>
                </article>
            <?php endforeach; ?>
        <?php else: ?>
            <div class="col-span-full text-center py-12">
                <svg class="mx-auto h-12 w-12 text-gray-400" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 20H5a2 2 0 01-2-2V6a2 2 0 012-2h10a2 2 0 012 2v1m2 13a2 2 0 01-2-2V7m2 13a2 2 0 002-2V9a2 2 0 00-2-2h-2m-4-3H9M7 16h6M7 8h6v4H7V8z" />
                </svg>
                <h3 class="mt-2 text-sm font-medium text-gray-900">No news found</h3>
                <p class="mt-1 text-sm text-gray-500">Try adjusting your search or filter criteria.</p>
            </div>
        <?php endif; ?>
    </div>
</div>

