<?php 
$title = 'News Portal - Latest News';
require_once APP_PATH . '/views/layouts/header.php'; 
require_once APP_PATH . '/views/layouts/navbar.php'; 
?>

<div class="container mx-auto p-4">
    <!-- Enhanced Search Form -->
    <div class="bg-white p-6 rounded-lg shadow-md mb-6">
        <form action="/" method="GET" class="flex flex-col md:flex-row gap-4">
            <input 
                type="text" 
                name="search" 
                placeholder="Search news by title or content..." 
                value="<?= htmlspecialchars($search_query ?? '') ?>" 
                class="flex-1 px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"
            >
            <!-- Hidden input to maintain category filter when searching -->
            <?php if (isset($current_category) && $current_category): ?>
                <input type="hidden" name="category" value="<?= $current_category ?>">
            <?php endif; ?>
            <button type="submit" class="bg-blue-500 text-white px-4 py-2 rounded-lg hover:bg-blue-600 transition-colors">
                <svg class="w-5 h-5 inline mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path>
                </svg>
                Search
            </button>
        </form>
        
        <!-- Search Info -->
        <?php if (!empty($search_query)): ?>
            <div class="mt-3 text-sm text-gray-600">
                <span class="font-medium">Searching for:</span> "<?= htmlspecialchars($search_query) ?>"
                <a href="<?= $current_category ? '/?category=' . $current_category : '/' ?>" class="ml-2 text-blue-600 hover:text-blue-800">
                    Clear search
                </a>
            </div>
        <?php endif; ?>
    </div>

    <!-- Category Filter -->
    <div class="mb-6">
        <h3 class="text-lg font-semibold mb-3">Categories</h3>
        <div class="flex flex-wrap gap-2">
            <a href="<?= !empty($search_query) ? '/?search=' . urlencode($search_query) : '/' ?>" 
               class="px-4 py-2 rounded-full <?= !$current_category ? 'bg-blue-600 text-white' : 'bg-gray-200 text-gray-700 hover:bg-gray-300' ?> transition-colors">
                All News
            </a>
            <?php foreach ($categories as $category): ?>
                <a href="<?= !empty($search_query) ? '/?category=' . $category['id'] . '&search=' . urlencode($search_query) : '/?category=' . $category['id'] ?>"
                class="px-4 py-2 rounded-full <?= $current_category == $category['id'] ? 'bg-blue-600 text-white' : 'bg-gray-200 text-gray-700 hover:bg-gray-300' ?>">
                    <?= htmlspecialchars($category['name']) ?>
                </a>
            <?php endforeach; ?>
        </div>
    </div>

    <!-- Results Summary -->
    <?php if (!empty($search_query) || $current_category): ?>
        <div class="mb-4 text-sm text-gray-600">
            <?php 
            $filters = [];
            if (!empty($search_query)) $filters[] = "search: \"" . htmlspecialchars($search_query) . "\"";
            if ($current_category) {
                $categoryName = '';
                foreach ($categories as $cat) {
                    if ($cat['id'] == $current_category) {
                        $categoryName = $cat['name'];
                        break;
                    }
                }
                $filters[] = "category: " . htmlspecialchars($categoryName);
            }
            ?>
            Showing results for <?= implode(' and ', $filters) ?> (<?= count($news) ?> articles found)
        </div>
    <?php endif; ?>

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
                           class="inline-flex items-center text-blue-600 hover:text-blue-800 font-medium mb-4">
                            Read More
                            <svg class="w-4 h-4 ml-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7"></path>
                            </svg>
                        </a>

                        <!-- Interaction Buttons -->
                        <?php 
                        $article_interaction_data = $interaction_data[$article['id']] ?? [
                            'counts' => ['likes' => 0, 'comments' => 0, 'bookmarks' => 0],
                            'user_status' => ['liked' => false, 'bookmarked' => false]
                        ];
                        
                        // Set variables untuk component
                        $news_id = $article['id'];
                        $counts = $article_interaction_data['counts'];
                        $user_status = $article_interaction_data['user_status'];
                        
                        include APP_PATH . '/views/components/interaction_buttons.php';
                        ?>
                    </div>
                </article>
            <?php endforeach; ?>
        <?php else: ?>
            <div class="col-span-full text-center py-12">
                <svg class="mx-auto h-12 w-12 text-gray-400" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path>
                </svg>
                <h3 class="mt-2 text-sm font-medium text-gray-900">No news found</h3>
                <p class="mt-1 text-sm text-gray-500">
                    <?php if (!empty($search_query)): ?>
                        No articles found matching "<?= htmlspecialchars($search_query) ?>". Try different keywords or browse all categories.
                    <?php else: ?>
                        Try adjusting your search or filter criteria.
                    <?php endif; ?>
                </p>
            </div>
        <?php endif; ?>
    </div>
</div>
