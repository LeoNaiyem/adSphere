<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreProductRequest;
use App\Http\Requests\UpdateProductRequest;
use Inertia\Inertia;
use App\Models\Product;
use App\Models\Category;
use App\Models\Brand;
use Request;

class ProductController extends Controller
{
    public function index(Request $request)
    {
        $filters = $request->only(['category_id', 'brand_id', 'condition', 'min_price', 'max_price']);

        $products = Product::with(['category', 'brand'])
            ->when($filters['category_id'] ?? null, fn($q, $v) => $q->where('category_id', $v))
            ->when($filters['brand_id'] ?? null, fn($q, $v) => $q->where('brand_id', $v))
            ->when($filters['condition'] ?? null, fn($q, $v) => $q->where('condition', $v))
            ->when($filters['min_price'] ?? null, fn($q, $v) => $q->where('price', '>=', $v))
            ->when($filters['max_price'] ?? null, fn($q, $v) => $q->where('price', '<=', $v))
            ->paginate(12)
            ->withQueryString();

        return Inertia::render('Products/Index', [
            'products' => $products,
            'categories' => Category::all(),
            'brands' => Brand::all(),
            'filters' => $filters,
        ]);
    }


    public function create()
    {
        return Inertia::render('Admin/Products/Create', [
            'categories' => Category::all(),
            'brands' => Brand::all(),
        ]);
    }

    public function store(StoreProductRequest $request)
    {
        $product = Product::create($request->validated());

        // Dynamic attributes
        if ($request->has('attributes')) {
            foreach ($request->attributes as $name => $value) {
                $product->details()->create([
                    'attribute_name' => $name,
                    'attribute_value' => $value,
                ]);
            }
        }

        return redirect()->route('products.index')->with('success', 'Product created.');
    }

    public function show(Product $product)
    {
        $user = auth()->user();

        // Load relationships
        $product->load(['category', 'brand', 'details']);

        // Example images: if using Spatie Media Library
        $product->images = $product->getMedia('images')->map->getUrl();

        return Inertia::render('Products/Show', [
            'product' => $product,
            'inWishlist' => $user ? $user->wishlist->contains($product->id) : false,
        ]);
    }

    public function edit(Product $product)
    {
        return Inertia::render('Admin/Products/Edit', [
            'product' => $product->load('details'),
            'categories' => Category::all(),
            'brands' => Brand::all(),
        ]);
    }

    public function update(UpdateProductRequest $request, Product $product)
    {
        $product->update($request->validated());
        return redirect()->route('products.index')->with('success', 'Product updated.');
    }

    public function destroy(Product $product)
    {
        $product->delete();
        return redirect()->route('products.index')->with('success', 'Product deleted.');
    }
}
