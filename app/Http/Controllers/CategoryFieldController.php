<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\CategoryField;
use Illuminate\Http\Request;
use Inertia\Inertia;

class CategoryFieldController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Category $category)
    {
        return Inertia::render('Admin/Categories/Fields', [
            'category' => $category,
            'fields' => $category->fields,
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
    public function store(Request $request, Category $category)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'type' => 'required|string|in:text,number,select',
        ]);

        $category->fields()->create($request->only('name', 'type'));

        return back()->with('success', 'Field added.');
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(CategoryField $field)
    {
        $field->delete();
        return back()->with('success', 'Field removed.');
    }
}
