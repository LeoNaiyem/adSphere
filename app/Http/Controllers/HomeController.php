<?php

namespace App\Http\Controllers;

use App\Models\Brand;
use App\Models\Product;
use Illuminate\Http\Request;
use Inertia\Inertia;
use Illuminate\Support\Facades\DB;

class HomeController extends Controller
{
    public function index()
    {
        $products = Product::with(['brand', 'category', 'user', 'images'])
            ->withCount('recentlyViewedUsers')
            ->orderByDesc('recently_viewed_users_count')
            ->take(8)
            ->get();

        return Inertia::render('Home/Index', [
            'products' => $products,
            'brands'=>Brand::all(),
        ]);
    }
}
