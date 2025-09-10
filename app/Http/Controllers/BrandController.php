<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreBrandRequest;
use App\Http\Requests\UpdateBrandRequest;
use Inertia\Inertia;
use App\Models\Brand;
use App\Http\Requests\BrandStoreRequest;
use App\Http\Requests\BrandUpdateRequest;

class BrandController extends Controller
{
    public function index()
    {
        return Inertia::render('Admin/Brands/Index', [
            'brands' => Brand::latest()->paginate(10),
        ]);
    }

    public function create()
    {
        return Inertia::render('Admin/Brands/BrandForm');
    }

    public function store(StoreBrandRequest $request)
    {
        $data = $request->validated();

        if ($request->hasFile('logo')) {
            $path = $request->file('logo')->store('brands', 'public');
            $data['logo'] = $path;
        }

        Brand::create($data);

        return redirect()->route('brands.index')->with('success', 'Brand created.');
    }


    public function edit(Brand $brand)
    {
        return Inertia::render('Admin/Brands/BrandForm', [
            'brand' => $brand,
        ]);
    }

    public function update(UpdateBrandRequest $request, Brand $brand)
    {
        $data = $request->validated();

        if ($request->hasFile('logo')) {
            
            if ($brand->logo && \Storage::disk('public')->exists($brand->logo)) {
                \Storage::disk('public')->delete($brand->logo);
            }
            $data['logo'] = $request->file('logo')->store('brands', 'public');
        } else {
            unset($data['logo']); 
        }

        $brand->update($data);

        return redirect()->route('brands.index')->with('success', 'Brand updated.');
    }

    public function destroy(Brand $brand)
    {
        $brand->delete();
        return redirect()->route('brands.index')->with('success', 'Brand deleted.');
    }
}
