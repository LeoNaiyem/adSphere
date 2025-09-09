<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreCategoryRequest;
use App\Http\Requests\UpdateCategoryRequest;
use Inertia\Inertia;
use App\Models\Category;

class CategoryController extends Controller
{
    public function index()
    {
        $categories = Category::with('parent')->paginate(6);
        return Inertia::render('Admin/Categories/Index', [
            'categories' => $categories,
        ]);
    }

    public function create()
    {
        return Inertia::render('Admin/Categories/CategoryForm', [
            'categories' => Category::all(),
        ]);
    }

    public function store(StoreCategoryRequest $request)
    {
        Category::create($request->validated());
        return redirect()->route('categories.index')->with('success', 'Category created.');
    }

    public function edit(Category $category)
    {
        return Inertia::render('Admin/Categories/CategoryForm', [
            'category' => $category,
            'categories' => Category::all(),
        ]);
    }

    public function update(UpdateCategoryRequest $request, Category $category)
    {
        $category->update($request->validated());
        return redirect()->route('categories.index')->with('success', 'Category updated.');
    }

    public function destroy(Category $category)
    {
        $category->delete();
        return redirect()->route('categories.index')->with('success', 'Category deleted.');
    }
}
