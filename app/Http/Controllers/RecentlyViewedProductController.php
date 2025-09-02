<?php

namespace App\Http\Controllers;

use App\Models\RecentlyViewedProduct;
use App\Http\Requests\StoreRecentlyViewedProductRequest;
use App\Http\Requests\UpdateRecentlyViewedProductRequest;

class RecentlyViewedProductController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
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
        //
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
