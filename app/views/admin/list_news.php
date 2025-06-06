<?php 
$title = 'Manage News - Admin Panel';
require_once APP_PATH . '/views/layouts/header.php'; 
?>

<header class="bg-blue-600 text-white p-4">
    <div class="container mx-auto flex justify-between items-center">
        <div class="flex items-center">
            <a href="/admin/dashboard" class="bg-white text-blue-600 px-4 py-2 rounded mr-4 hover:bg-gray-100">
                ← Dashboard
            </a>
            <h1 class="text-xl font-semibold">Manage News Articles</h1>
        </div>
        <a href="/admin/add-news" class="bg-green-500 text-white px-4 py-2 rounded hover:bg-green-600">
            + Add News
        </a>
    </div>
</header>

<div class="container mx-auto p-6">
    <div class="bg-white rounded-lg shadow-lg overflow-hidden">
        <?php if (!empty($news)): ?>
            <div class="overflow-x-auto">
                <table class="w-full">
                    <thead class="bg-gray-50">
                        <tr>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Article</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Category</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Date</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Actions</th>
                        </tr>
                    </thead>
                    <tbody class="bg-white divide-y divide-gray-200">
                        <?php foreach ($news as $article): ?>
                            <tr class="hover:bg-gray-50">
                                <td class="px-6 py-4">
                                    <div class="flex items-center">
                                        <img src="/<?= htmlspecialchars($article['image']) ?>" 
                                             alt="<?= htmlspecialchars($article['title']) ?>"
                                             class="w-12 h-12 rounded-lg object-cover mr-4">
                                        <div>
                                            <div class="text-sm font-medium text-gray-900 line-clamp-2">
                                                <?= htmlspecialchars($article['title']) ?>
                                            </div>
                                            <div class="text-sm text-gray-500">
                                                ID: #<?= $article['id'] ?>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                <td class="px-6 py-4">
                                    <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-blue-100 text-blue-800">
                                        <?= htmlspecialchars($article['category']) ?>
                                    </span>
                                </td>
                                <td class="px-6 py-4 text-sm text-gray-500">
                                    <?= date('M j, Y', strtotime($article['release_date'])) ?>
                                </td>
                                <td class="px-6 py-4">
                                    <div class="flex space-x-2">
                                        <a href="/news/<?= $article['id'] ?>" 
                                           class="bg-blue-500 text-white px-3 py-1 rounded text-sm hover:bg-blue-600">
                                            View
                                        </a>
                                        <a href="/admin/edit-news?id=<?= $article['id'] ?>" 
                                           class="bg-green-500 text-white px-3 py-1 rounded text-sm hover:bg-green-600">
                                            Edit
                                        </a>
                                        <form action="/admin/delete-news" method="POST" class="inline"
                                              onsubmit="return confirm('Are you sure you want to delete this article?');">
                                            <input type="hidden" name="delete_id" value="<?= $article['id'] ?>">
                                            <button type="submit" 
                                                    class="bg-red-500 text-white px-3 py-1 rounded text-sm hover:bg-red-600">
                                                Delete
                                            </button>
                                        </form>
                                    </div>
                                </td>
                            </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        <?php else: ?>
            <div class="text-center py-12">
                <svg class="mx-auto h-12 w-12 text-gray-400" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 20H5a2 2 0 01-2-2V6a2 2 0 012-2h10a2 2 0 012 2v1m2 13a2 2 0 01-2-2V7m2 13a2 2 0 002-2V9a2 2 0 00-2-2h-2m-4-3H9M7 16h6M7 8h6v4H7V8z" />
                </svg>
                <h3 class="mt-2 text-sm font-medium text-gray-900">No news articles</h3>
                <p class="mt-1 text-sm text-gray-500">Get started by creating your first article.</p>
                <div class="mt-6">
                    <a href="/admin/add-news" 
                       class="bg-blue-600 text-white px-4 py-2 rounded-lg hover:bg-blue-700">
                        Add News Article
                    </a>
                </div>
            </div>
        <?php endif; ?>
    </div>
</div>
