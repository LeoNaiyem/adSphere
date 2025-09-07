<?php

namespace App\Http\Controllers;

use App\Models\Product;
use Illuminate\Http\Request;

class RecentlyViewedProductController extends Controller
{
    /**
     * Show all recently viewed products for logged-in user.
     */
    public function index()
    {
        $recentlyViewed = auth()->user()
            ->recentlyViewed()
            ->with(['category', 'brand', 'images'])
            ->take(20) // limit to latest 20
            ->get();

        return inertia('RecentlyViewed/Index', [
            'recentlyViewed' => $recentlyViewed,
        ]);
    }

    /**
     * Store or update a recently viewed product.
     */
    public function store(Request $request)
    {
        $request->validate([
            'product_id' => 'required|exists:products,id',
        ]);

        $product = Product::findOrFail($request->product_id);

        // Attach/update pivot with fresh viewed_at
        auth()->user()->recentlyViewed()->syncWithoutDetaching([
            $product->id => ['viewed_at' => now()],
        ]);

        // 🔥 Optional: cleanup older than 20
        $this->cleanup(auth()->id());

        return back();
    }

    /**
     * Keep only the last 20 recently viewed products per user.
     */
    protected function cleanup(int $userId): void
    {
        $user = \App\Models\User::find($userId);

        $ids = $user->recentlyViewed()->pluck('products.id');

        if ($ids->count() > 20) {
            $toDelete = $ids->slice(20); // get all but first 20
            \DB::table('recently_viewed_products')
                ->where('user_id', $userId)
                ->whereIn('product_id', $toDelete)
                ->delete();
        }
    }
}
