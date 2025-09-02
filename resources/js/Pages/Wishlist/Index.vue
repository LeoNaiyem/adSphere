<script setup>
import { Link, useForm } from "@inertiajs/vue3";

defineProps({
  wishlist: Array, // List of products with brand + category
});

const removeForm = useForm({});

function removeFromWishlist(productId) {
  removeForm.delete(route("wishlist.destroy", productId), { preserveScroll: true });
}
</script>

<template>
  <div class="p-6 max-w-5xl mx-auto">
    <h1 class="text-2xl font-bold mb-6">❤️ My Wishlist</h1>

    <div v-if="wishlist.length === 0" class="text-gray-600">
      No products in your wishlist yet.
    </div>

    <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4">
      <div
        v-for="product in wishlist"
        :key="product.id"
        class="border rounded p-4 shadow hover:shadow-md"
      >
        <!-- Product Info -->
        <h2 class="font-semibold text-lg">{{ product.title }}</h2>
        <p class="text-sm text-gray-600">💲 {{ product.price }}</p>
        <p class="text-sm">📂 {{ product.category?.name }}</p>
        <p class="text-sm">🏷 {{ product.brand?.name }}</p>
        <p class="text-xs text-gray-500">{{ product.condition }}</p>

        <!-- Actions -->
        <div class="mt-3 flex space-x-2">
          <Link
            :href="route('products.show', product.id)"
            class="bg-blue-600 text-white px-3 py-1 rounded text-sm"
          >
            View
          </Link>
          <button
            @click="removeFromWishlist(product.id)"
            class="bg-red-500 text-white px-3 py-1 rounded text-sm"
            :disabled="removeForm.processing"
          >
            Remove
          </button>
        </div>
      </div>
    </div>
  </div>
</template>
