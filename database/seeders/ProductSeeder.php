<?php

namespace Database\Seeders;

use App\Models\Product;
use App\Models\ProductDetail;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class ProductSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // Products with details
        $products = Product::factory(20)->create();

        foreach ($products as $product) {
            ProductDetail::factory(rand(2, 4))->create([
                'product_id' => $product->id,
            ]);
        }
    }
}
