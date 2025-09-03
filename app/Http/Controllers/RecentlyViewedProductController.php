<?php

namespace App\Http\Controllers;

use App\Models\Product;
use App\Models\RecentlyViewedProduct;
use App\Http\Requests\StoreRecentlyViewedProductRequest;
use App\Http\Requests\UpdateRecentlyViewedProductRequest;
use Inertia\Inertia;

class RecentlyViewedProductController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $recentlyViewed = auth()->user()
            ->recentlyViewed()
            ->with(['brand', 'category'])
            ->orderByPivot('viewed_at', 'desc')
            ->get();

        return Inertia::render('RecentlyViewed/Index', [
            'recentlyViewed' => $recentlyViewed,
        ]);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreRecentlyViewedProductRequest $request)
    {
        $product = Product::findOrFail($request->product_id);

        auth()->user()->recentlyViewed()->syncWithoutDetaching([
            $product->id => ['viewed_at' => now()]
        ]);

        return back();
    }

    /**
     * Display the specified resource.
     */
    public function show(RecentlyViewedProduct $recentlyViewedProduct)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(RecentlyViewedProduct $recentlyViewedProduct)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateRecentlyViewedProductRequest $request, RecentlyViewedProduct $recentlyViewedProduct)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(RecentlyViewedProduct $recentlyViewedProduct)
    {
        //
    }
}
