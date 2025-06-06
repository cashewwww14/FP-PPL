<?php 
$title = 'Edit News - Admin Panel';
require_once APP_PATH . '/views/layouts/header.php'; 
?>

<header class="bg-blue-600 text-white p-4 flex justify-between items-center">
    <div class="flex items-center">
        <a href="/admin/news-list" class="bg-white text-blue-600 px-4 py-2 rounded mr-4 hover:bg-gray-100">
            ← Back to List
        </a>
        <h1 class="text-xl font-semibold">Edit News Article</h1>
    </div>
</header>

<div class="container mx-auto p-6">
    <div class="max-w-4xl mx-auto bg-white rounded-lg shadow-lg p-8">
        <?php if (isset($error)): ?>
            <div class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded mb-6">
                <strong>Error:</strong> <?= htmlspecialchars($error) ?>
            </div>
        <?php endif; ?>

        <form action="/admin/edit-news?id=<?= $news['id'] ?>" method="POST" enctype="multipart/form-data" class="space-y-6">
            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                <div class="md:col-span-2">
                    <label for="title" class="block text-sm font-medium text-gray-700 mb-2">Article Title</label>
                    <input type="text" name="title" id="title" required 
                           value="<?= htmlspecialchars($news['title']) ?>"
                           class="w-full p-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent">
                </div>
                
                <div>
                    <label for="category" class="block text-sm font-medium text-gray-700 mb-2">Category</label>
                    <select name="category" id="category" required 
                            class="w-full p-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent">
                        <?php foreach ($categories as $category): ?>
                            <option value="<?= htmlspecialchars($category) ?>" 
                                    <?= $news['category'] === $category ? 'selected' : '' ?>>
                                <?= htmlspecialchars($category) ?>
                            </option>
                        <?php endforeach; ?>
                    </select>
                </div>
                
                <div>
                    <label for="release_date" class="block text-sm font-medium text-gray-700 mb-2">Release Date</label>
                    <input type="date" name="release_date" id="release_date" required 
                           value="<?= $news['release_date'] ?>"
                           class="w-full p-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent">
                </div>
                
                <div class="md:col-span-2">
                    <label for="image" class="block text-sm font-medium text-gray-700 mb-2">Featured Image</label>
                    <div class="space-y-3">
                        <?php if (!empty($news['image'])): ?>
                            <div class="flex items-center space-x-4">
                                <img src="/<?= htmlspecialchars($news['image']) ?>" 
                                     alt="Current image" 
                                     class="w-24 h-24 object-cover rounded-lg">
                                <div>
                                    <p class="text-sm text-gray-600">Current image</p>
                                    <p class="text-xs text-gray-500"><?= htmlspecialchars(basename($news['image'])) ?></p>
                                </div>
                            </div>
                        <?php endif; ?>
                        <input type="file" name="image" id="image" accept="image/*"
                               class="w-full p-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent">
                        <p class="text-sm text-gray-500">Leave empty to keep current image. Supported formats: JPG, JPEG, PNG, GIF (max 5MB)</p>
                    </div>
                </div>
                
                <div class="md:col-span-2">
                    <label for="content" class="block text-sm font-medium text-gray-700 mb-2">Article Content</label>
                    <textarea name="content" id="content" rows="12" required 
                              class="w-full p-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"><?= htmlspecialchars($news['content']) ?></textarea>
                </div>
            </div>
            
            <div class="flex justify-end space-x-4">
                <a href="/admin/news-list" 
                   class="px-6 py-3 border border-gray-300 rounded-lg text-gray-700 hover:bg-gray-50">
                    Cancel
                </a>
                <button type="submit" 
                        class="px-6 py-3 bg-blue-600 text-white rounded-lg hover:bg-blue-700 focus:ring-2 focus:ring-blue-500">
                    Update Article
                </button>
            </div>
        </form>
    </div>
</div>
