<?php 
$title = 'Add News - Admin Panel';
require_once APP_PATH . '/views/layouts/header.php'; 
?>

<header class="bg-blue-600 text-white p-4 flex justify-between items-center">
    <div class="flex items-center">
        <a href="/admin/dashboard" class="bg-white text-blue-600 px-4 py-2 rounded mr-4 hover:bg-gray-100 flex items-center">
            <svg class="w-4 h-4 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 19l-7-7 7-7"></path>
            </svg>
            Dashboard
        </a>
        <h1 class="text-xl font-semibold">Add News Article</h1>
    </div>
</header>

<div class="container mx-auto p-6">
    <div class="max-w-4xl mx-auto bg-white rounded-lg shadow-lg p-8">
        <?php if (isset($error)): ?>
            <div class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded mb-6">
                <strong>Error:</strong> <?= htmlspecialchars($error) ?>
            </div>
        <?php endif; ?>

        <form action="/admin/add-news" method="POST" enctype="multipart/form-data" class="space-y-6">
            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                <div class="md:col-span-2">
                    <label for="title" class="block text-sm font-medium text-gray-700 mb-2">Article Title</label>
                    <input type="text" name="title" id="title" required 
                           class="w-full p-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                           placeholder="Enter article title">
                </div>
                
                <div>
                    <label for="category" class="block text-sm font-medium text-gray-700 mb-2">Category</label>
                    <select name="category" id="category" required 
                            class="w-full p-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent">
                        <option value="">Select Category</option>
                        <?php foreach ($categories as $category): ?>
                            <option value="<?= htmlspecialchars($category) ?>"><?= htmlspecialchars($category) ?></option>
                        <?php endforeach; ?>
                    </select>
                </div>
                
                <div>
                    <label for="release_date" class="block text-sm font-medium text-gray-700 mb-2">Release Date</label>
                    <input type="date" name="release_date" id="release_date" required 
                           class="w-full p-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent">
                </div>
                
                <div class="md:col-span-2">
                    <label for="image" class="block text-sm font-medium text-gray-700 mb-2">Featured Image</label>
                    <input type="file" name="image" id="image" required accept="image/*"
                           class="w-full p-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent">
                    <p class="text-sm text-gray-500 mt-1">Supported formats: JPG, JPEG, PNG, GIF (max 5MB)</p>
                </div>
                
                <div class="md:col-span-2">
                    <label for="content" class="block text-sm font-medium text-gray-700 mb-2">Article Content</label>
                    <textarea name="content" id="content" rows="12" required 
                              class="w-full p-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                              placeholder="Write your article content here..."></textarea>
                </div>
            </div>
            
            <div class="flex justify-end space-x-4">
                <a href="/admin/dashboard" 
                   class="px-6 py-3 border border-gray-300 rounded-lg text-gray-700 hover:bg-gray-50">
                    Cancel
                </a>
                <button type="submit" 
                        class="px-6 py-3 bg-blue-600 text-white rounded-lg hover:bg-blue-700 focus:ring-2 focus:ring-blue-500">
                    Publish Article
                </button>
            </div>
        </form>
    </div>
</div>
