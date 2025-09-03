<?php

namespace App\Policies;

use App\Models\Product;
use App\Models\User;

class ProductPolicy
{
    /**
     * Admin check helper.
     */
    protected function isAdmin(User $user): bool
    {
        return $user->role === 'admin'; // adjust if you store role differently
    }

    /**
     * Any logged-in user can create a product.
     * Admin can too.
     */
    public function create(User $user): bool
    {
        return true; // allow both user + admin
    }

    /**
     * Update product: Admin or product owner.
     */
    public function update(User $user, Product $product): bool
    {
        return $this->isAdmin($user) || $user->id === $product->user_id;
    }

    /**
     * Delete product: Admin or product owner.
     */
    public function delete(User $user, Product $product): bool
    {
        return $this->isAdmin($user) || $user->id === $product->user_id;
    }

    /**
     * View product: Everyone (optional).
     */
    public function viewAny(?User $user): bool
    {
        return true;
    }

    public function view(?User $user, Product $product): bool
    {
        return true;
    }
}
