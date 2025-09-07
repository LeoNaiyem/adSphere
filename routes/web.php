<?php

use App\Http\Controllers\HomeController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\BrandController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\RecentlyViewedProductController;
use App\Http\Controllers\WishlistController;
use Illuminate\Foundation\Application;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;

// Public Home
Route::get('/', [HomeController::class, 'index'])->name('home');
// Route::get('products',[ProductController::class,'index'])->name('products.index');
// Route::get('products/{id}',[ProductController::class,'show'])->name('products.show');

// Breeze Welcome page (optional)
Route::get('/welcome', function () {
    return Inertia::render('Welcome', [
        'canLogin' => Route::has('login'),
        'canRegister' => Route::has('register'),
        'laravelVersion' => Application::VERSION,
        'phpVersion' => PHP_VERSION,
    ]);
});

// Dashboard (role-based)
Route::get('/dashboard', [DashboardController::class, 'index'])
    ->middleware(['auth', 'verified'])
    ->name('dashboard');

// Authenticated routes
Route::middleware('auth')->group(function () {
    // Profile (Breeze default)
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');

    // Wishlist
    Route::get('/wishlist', [WishlistController::class, 'index'])->name('wishlist.index');
    Route::post('/wishlist', [WishlistController::class, 'store'])->name('wishlist.store');
    Route::delete('/wishlist/{product}', [WishlistController::class, 'destroy'])->name('wishlist.destroy');

    // Recently Viewed
    // Route::get('/recently-viewed', [RecentlyViewedProductController::class, 'index'])->name('recently-viewed.index');
    // Route::post('/recently-viewed', [RecentlyViewedProductController::class, 'store'])->name('recently-viewed.store');

    Route::get('/recently-viewed', [RecentlyViewedProductController::class, 'index'])->name('recently-viewed.index');
    Route::post('/recently-viewed', [RecentlyViewedProductController::class, 'store'])->name('recently-viewed.store');
});

// Admin routes
Route::middleware(['auth', 'verified'])->group(function () {
    Route::resource('categories', CategoryController::class);
    Route::resource('brands', BrandController::class);
    Route::resource('products', ProductController::class);
    Route::get('dashboard/products', [DashboardController::class, 'productList'])->name('dashboard.products');
});


require __DIR__ . '/auth.php';
