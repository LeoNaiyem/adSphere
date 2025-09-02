<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use App\Models\Category;
use App\Models\Brand;

class ProductFactory extends Factory
{
    public function definition(): array
    {
        return [
            'title' => $this->faker->words(3, true),
            'category_id' => Category::inRandomOrder()->first()->id ?? Category::factory(),
            'brand_id' => Brand::inRandomOrder()->first()->id ?? Brand::factory(),
            'price' => $this->faker->randomFloat(2, 50, 5000),
            'condition' => $this->faker->randomElement(['new', 'used']),
            'description' => $this->faker->paragraph(),
            'status' => $this->faker->boolean(90),
        ];
    }
}
