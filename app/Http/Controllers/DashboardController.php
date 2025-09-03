<?php

namespace App\Http\Controllers;

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
            'wishlist' => $user->wishlist()->with('brand', 'category')->get(),
            'recentlyViewed' => $user->recentlyViewed()->with('brand', 'category')->latest('pivot_viewed_at')->get(),
        ]);
    }
}
