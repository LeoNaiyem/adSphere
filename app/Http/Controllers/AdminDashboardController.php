<?php

namespace App\Http\Controllers;

use App\Models\Brand;
use App\Models\Category;
use App\Models\Product;
use App\Models\User;
use Inertia\Inertia;

class AdminDashboardController extends Controller
{
    public function index(){
        $user=auth()->user();
        $stats = [
            'users' => User::count(),
            'categories' => Category::count(),
            'brands' => Brand::count(),
            'products' => Product::count(),
        ];

        // Pie chart: products by category
        $categories = Category::withCount('products')->get();
        $pie = [
            'labels' => $categories->pluck('name'),
            'datasets' => [
                [
                    'label' => 'Products',
                    'data' => $categories->pluck('products_count'),
                    'backgroundColor' => ['#3b82f6', '#f59e0b', '#10b981', '#ef4444', '#8b5cf6'],
                ]
            ]
        ];

        // Bar chart: products per brand
        $brands = Brand::withCount('products')->get();
        $bar = [
            'labels' => $brands->pluck('name'),
            'datasets' => [
                [
                    'label' => 'Products',
                    'data' => $brands->pluck('products_count'),
                    'backgroundColor' => ['#3b82f6', '#f59e0b', '#10b981', '#ef4444', '#8b5cf6'],
                ]
            ]
        ];

        // Line chart: new users over time (last 6 months)
        $usersPerMonth = User::selectRaw("DATE_FORMAT(created_at, '%Y-%m') as month, COUNT(*) as count")
            ->groupBy('month')
            ->orderBy('month')
            ->take(6)
            ->pluck('count', 'month');

        $line = [
            'labels' => $usersPerMonth->keys(),
            'datasets' => [
                [
                    'label' => 'New Users',
                    'data' => $usersPerMonth->values(),
                    'borderColor' => '#10b981',
                    'fill' => false,
                ]
            ]
        ];

        return Inertia::render('Admin/Dashboard', [
            'productsCount' => Product::count(),
            'categoriesCount' => Category::count(),
            'brandsCount' => Brand::count(),
            'stats' => $stats,
            'chartData' => [
                'pie' => $pie,
                'bar' => $bar,
                'line' => $line,
            ],
        ]); 
    }
}
