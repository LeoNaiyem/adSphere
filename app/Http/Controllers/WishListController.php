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
        $product = Product::findOrFail($request->product_id);
        $user = auth()->user();

        if ($user->wishlist()->where('product_id', $product->id)->exists()) {
            //remove from wishlist
            $user->wishlist()->detach($product->id);
            return back()->with('success', 'Product removed from wishlist.');
        }

        //add to wishlist
        $user->wishlist()->attach($product->id);
        return back()->with('success', 'Product added to wishlist.');
    }


    public function destroy(Product $product)
    {
        auth()->user()->wishlist()->detach($product->id);
        return back()->with('success', 'Product removed from wishlist.');
    }
}
