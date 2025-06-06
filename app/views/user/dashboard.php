<?php 
$title = 'User Dashboard - News Portal';
require_once APP_PATH . '/views/layouts/header.php'; 
?>

<header class="bg-gradient-to-r from-green-600 to-green-800 text-white p-6">
    <div class="container mx-auto">
        <h1 class="text-3xl font-bold">User Dashboard</h1>
        <p class="mt-2 opacity-90">Manage your profile and preferences</p>
    </div>
</header>

<div class="container mx-auto p-6">
    <div class="max-w-2xl mx-auto">
        <!-- Navigation -->
        <div class="flex space-x-4 mb-6">
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

        <!-- Profile Card -->
        <div class="bg-white rounded-lg shadow-lg p-8">
            <div class="text-center mb-8">
                <div class="w-24 h-24 bg-gradient-to-br from-green-400 to-green-600 rounded-full mx-auto mb-4 flex items-center justify-center">
                    <span class="text-white text-2xl font-bold">
                        <?= strtoupper(substr($user['name'] ?? 'U', 0, 1)) ?>
                    </span>
                </div>
                <h2 class="text-2xl font-bold text-gray-900"><?= htmlspecialchars($user['name'] ?? 'User') ?></h2>
                <p class="text-gray-600">Member since <?= date('F Y', strtotime($user['created_at'] ?? 'now')) ?></p>
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

            <!-- Profile Form -->
            <form action="/user/dashboard" method="POST" class="space-y-6">
                <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                    <div>
                        <label for="name" class="block text-sm font-medium text-gray-700 mb-2">Full Name</label>
                        <input type="text" name="name" id="name" required
                               value="<?= htmlspecialchars($user['name']) ?>"
                               class="w-full p-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-green-500 focus:border-transparent">
                    </div>

                    <div>
                        <label for="email" class="block text-sm font-medium text-gray-700 mb-2">Email Address</label>
                        <input type="email" name="email" id="email" required
                               value="<?= htmlspecialchars($user['email']) ?>"
                               class="w-full p-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-green-500 focus:border-transparent">
                    </div>

                    <div>
                        <label for="birth_date" class="block text-sm font-medium text-gray-700 mb-2">Date of Birth</label>
                        
                        <!-- Simple: langsung date input dengan custom styling -->
                        <input type="date" name="birth_date" id="birth_date"
                            value="<?= $user['birth_date'] ?>"
                            class="w-full p-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-green-500 focus:border-transparent"
                            onchange="showFormattedDate(this)">
                        
                        <!-- Display formatted date di bawah -->
                        <!-- <p class="text-sm text-gray-600 mt-1" id="formatted_date">
                            <?= $user['birth_date'] ? date('F j, Y', strtotime($user['birth_date'])) : '' ?>
                        </p> -->
                    </div>

                    <script>
                    function showFormattedDate(input) {
                        if (input.value) {
                            const date = new Date(input.value);
                            const formatted = date.toLocaleDateString('en-US', {
                                year: 'numeric', 
                                month: 'long', 
                                day: 'numeric'
                            });
                            document.getElementById('formatted_date').textContent = formatted;
                        }
                    }
                    </script>

                    <div>
                        <label for="gender" class="block text-sm font-medium text-gray-700 mb-2">Gender</label>
                        <select name="gender" id="gender" required
                                class="w-full p-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-green-500 focus:border-transparent">
                            <option value="Male" <?= $user['gender'] === 'Male' ? 'selected' : '' ?>>Male</option>
                            <option value="Female" <?= $user['gender'] === 'Female' ? 'selected' : '' ?>>Female</option>
                        </select>
                    </div>
                </div>

                <div class="flex justify-end">
                    <button type="submit" 
                            class="px-6 py-3 bg-green-600 text-white rounded-lg hover:bg-green-700 focus:ring-2 focus:ring-green-500">
                        Update Profile
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>
