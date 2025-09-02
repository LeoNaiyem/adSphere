<?php

namespace App\Http\Controllers;

use App\Models\Brand;
use App\Models\Category;
use App\Models\Product;
use Illuminate\Http\Request;
use Inertia\Inertia;

class DashboardController extends Controller
{
    public function index()
    {
        $user = auth()->user();

        if ($user->role === 'admin') {
            return Inertia::render('Admin/Dashboard', [
                'productsCount' => Product::count(),
                'categoriesCount' => Category::count(),
                'brandsCount' => Brand::count(),
            ]);
        }

        return Inertia::render('User/Dashboard', [
            'wishlist' => $user->wishlist()->with('brand', 'category')->get(),
            'recentlyViewed' => $user->recentlyViewed()->with('brand', 'category')->latest('pivot_viewed_at')->get(),
        ]);
    }
}
