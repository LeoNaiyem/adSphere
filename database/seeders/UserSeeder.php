<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // Admin user
        User::factory()->create([
            'name' => 'Naiyem',
            'email' => 'naiyem@gmail.com',
            'password' => bcrypt('11111111'),
            'role' => 'admin',
        ]);

        // Regular users
        User::factory(10)->create();
    }
}
