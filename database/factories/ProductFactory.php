<?php

namespace Database\Factories;

use App\Models\User;
use Illuminate\Database\Eloquent\Factories\Factory;
use App\Models\Category;
use App\Models\Brand;

class ProductFactory extends Factory
{
    public function definition(): array
    {
        return [
            'user_id' => User::inRandomOrder()->first()->id ?? User::factory(),
            'category_id' => Category::inRandomOrder()->first()->id ?? Category::factory(),
            'brand_id' => Brand::inRandomOrder()->first()->id ?? Brand::factory(),
            'title' => $this->faker->words(3, true),
            'price' => $this->faker->randomFloat(2, 50, 5000),
            'condition' => $this->faker->randomElement(['new', 'used']),
            'description' => $this->faker->paragraph(),
            'status' => $this->faker->boolean(90),
        ];
    }
}
