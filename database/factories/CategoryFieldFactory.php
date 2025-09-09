<?php

namespace Database\Factories;

use App\Models\CategoryField;
use Illuminate\Database\Eloquent\Factories\Factory;

class CategoryFieldFactory extends Factory
{
    protected $model = CategoryField::class;

    public function definition(): array
    {
        $types = ['text', 'number', 'select'];

        return [
            'category_id' => $this->faker->numberBetween(1, 3),
            'name' => $this->faker->randomElement([
                'Model',
                'Warranty',
                'Color',
                'Year',
                'Mileage',
                'Fuel Type',
                'Bedrooms',
                'Square Footage',
                'Furnished'
            ]),
            'type' => $this->faker->randomElement($types),
        ];
    }
}
