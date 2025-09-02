<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use App\Models\Product;

class ProductDetailFactory extends Factory
{
    public function definition(): array
    {
        return [
            'product_id' => Product::inRandomOrder()->first()->id ?? Product::factory(),
            'attribute_name' => $this->faker->randomElement(['Model', 'Color', 'Warranty', 'Size']),
            'attribute_value' => $this->faker->word(),
        ];
    }
}
