<?php

namespace App\Http\Controllers;

use App\Models\Product;
use Illuminate\Http\Request;
use Inertia\Inertia;

class HomeController extends Controller
{
    public function index(){
        $products=Product::with(['brand','category','user','images']);
        return Inertia::render('Home/Index',['products'=>$products]);
    }
}
