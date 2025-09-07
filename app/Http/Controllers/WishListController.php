<?php

namespace App\Http\Controllers;

use App\Http\Requests\WishlistRequest;
use App\Models\Product;
use Inertia\Inertia;

class WishlistController extends Controller
{

    public function index()
    {
        $wishlist = auth()->user()
            ->wishlist()
            ->with(['brand', 'category'])
            ->get();

        return Inertia::render('Wishlist/Index', [
            'wishlist' => $wishlist,
        ]);
    }

    public function store(WishlistRequest $request)
    {
        // dd($request);
        $product = Product::findOrFail($request->product_id);
        auth()->user()->wishlist()->syncWithoutDetaching([$product->id]);

        return back()->with('success', 'Product added to wishlist.');
    }

    public function destroy(Product $product)
    {
        auth()->user()->wishlist()->detach($product->id);
        return back()->with('success', 'Product removed from wishlist.');
    }
}
