<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;

    protected $fillable = [
        'title',
        'category_id',
        'brand_id',
        'price',
        'condition',
        'description',
        'status',
        'user_id'
    ];

    public function user(){
        return $this->belongsTo(User::class);
    }
    public function category()
    {
        return $this->belongsTo(Category::class);
    }

    public function brand()
    {
        return $this->belongsTo(Brand::class);
    }

    public function details()
    {
        return $this->hasMany(ProductDetail::class);
    }

    public function wishlistedBy()
    {
        return $this->belongsToMany(User::class, 'wishlists')->withTimestamps();
    }

    public function viewedBy()
    {
        return $this->belongsToMany(User::class, 'recently_viewed_products')
            ->withPivot('viewed_at')
            ->withTimestamps();
    }

    public function images()
    {
        return $this->hasMany(ProductImage::class);
    }

    public function recentlyViewedUsers()
    {
        return $this->belongsToMany(User::class, 'recently_viewed_products')
            ->withPivot('viewed_at')
            ->withTimestamps();
    }

}
