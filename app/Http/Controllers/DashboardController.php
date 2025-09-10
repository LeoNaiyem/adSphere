<?php

namespace App\Http\Controllers;

use App\Models\Product;
use Inertia\Inertia;

class DashboardController extends Controller
{
    public function index()
    {
        $user = auth()->user();


        if ($user->role === 'admin') {
            return app(AdminDashboardController::class)->index();
        }

        return Inertia::render('User/Dashboard', [
            'wishlist' => $user->wishlist()
                ->with('brand', 'category')
                ->latest()
                ->take(5)
                ->get(),
            'recentlyViewed' => $user->recentlyViewed()
                ->with('brand', 'category')
                ->latest('pivot_viewed_at')
                ->take(5)
                ->get(),
            'products' => $user->products()
                ->with('brand', 'category')
                ->latest()
                ->take(5)
                ->get(),
            'stats' => [
                'wishlist_count' => $user->wishlist()->count(),
                'recently_viewed_count' => $user->recentlyViewed()->count(),
                'product_count' => $user->products()->count(),
            ],
        ]);
    }

    public function productList()
    {
        $user = auth()->user();
        if ($user->role === 'admin') {
            return app(AdminDashboardController::class)->productList();
        }
        $products = Product::with(['user', 'category', 'images', 'brand'])->where('user_id', $user->id)->latest()->paginate(10);
        return Inertia::render('Dashboard/ProductList', [
            'products' => $products,
            'role' => 'user'
        ]);
    }
}
