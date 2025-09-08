<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreProductRequest;
use App\Http\Requests\UpdateProductRequest;
use App\Models\ProductImage;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Inertia\Inertia;
use App\Models\Product;
use App\Models\Category;
use App\Models\Brand;
use Illuminate\Http\Request;


class ProductController extends Controller
{
    use AuthorizesRequests;
    public function index(Request $request)
    {
        $filters = $request->only(['category_id', 'brand_id', 'condition', 'min_price', 'max_price']);

        $products = Product::with(['category', 'brand','images','user'])
            ->when($filters['category_id'] ?? null, fn($q, $v) => $q->where('category_id', $v))
            ->when($filters['brand_id'] ?? null, fn($q, $v) => $q->where('brand_id', $v))
            ->when($filters['condition'] ?? null, fn($q, $v) => $q->where('condition', $v))
            ->when($filters['min_price'] ?? null, fn($q, $v) => $q->where('price', '>=', $v))
            ->when($filters['max_price'] ?? null, fn($q, $v) => $q->where('price', '<=', $v))
            ->latest()
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
        return Inertia::render('Products/Create', [
            'categories' => Category::all(),
            'brands' => Brand::all(),
        ]);
    }

    public function store(StoreProductRequest $request)
    {
        // dd($request);
        $this->authorize('create', Product::class);

        $product = Product::create([
            ...$request->validated(),
            'user_id' => auth()->id(),
        ]);

        // Handle multiple image uploads
        if ($request->hasFile('images')) {
            foreach ($request->file('images') as $image) {
                $path = $image->store('products', 'public');
                $product->images()->create(['path' => $path]);
            }
        }

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

        $product->load(['category', 'brand', 'details','images']);
        $images = $product->images->map(fn($img) => asset('storage/' . $img->path));

        return Inertia::render('Products/Show', [
            'product' => $product,
            'images'=>$images,
            'inWishlist' => $user ? $user->wishlist->contains($product->id) : false,
        ]);
    }

    public function edit(Product $product)
    {
        return Inertia::render('Products/Edit', [
            'product' => $product->load('details'),
            'categories' => Category::all(),
            'brands' => Brand::all(),
        ]);
    }

    public function update(UpdateProductRequest $request, Product $product)
    {
        $product->update($request->validated());
        if ($request->hasFile('images')) {
            foreach ($request->file('images') as $image) {
                $path = $image->store('products', 'public');
                $product->images()->create(['path' => $path]);
            }
        }
        return redirect()->route('products.index')->with('success', 'Product updated.');
    }

    public function destroy(Product $product)
    {
        // delete images from storage
        foreach ($product->images as $image) {
            \Storage::disk('public')->delete($image->path);
        }

        $product->delete();

        return redirect()->route('dashboard.products')->with('success', 'Product deleted successfully.');
    }

}
