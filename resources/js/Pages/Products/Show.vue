<script setup>
import { useForm } from "@inertiajs/vue3";

defineProps({
  product: Object,   // product with category, brand, details, images
  inWishlist: Boolean, // passed from controller
});

const wishlistForm = useForm({
  product_id: product.id,
});

function addToWishlist() {
  wishlistForm.post(route("wishlist.store"), { preserveScroll: true });
}

function removeFromWishlist() {
  wishlistForm.delete(route("wishlist.destroy", product.id), { preserveScroll: true });
}
</script>

<template>
  <div class="p-6 max-w-4xl mx-auto">
    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
      <!-- Product Images -->
      <div>
        <img
          v-if="product.images && product.images.length"
          :src="product.images[0]"
          class="rounded shadow w-full"
        />
        <div class="flex space-x-2 mt-2">
          <img
            v-for="(img, i) in product.images"
            :key="i"
            :src="img"
            class="w-16 h-16 object-cover rounded cursor-pointer border"
          />
        </div>
      </div>

      <!-- Product Info -->
      <div>
        <h1 class="text-3xl font-bold mb-2">{{ product.title }}</h1>
        <p class="text-xl text-green-600 font-semibold mb-2">💲 {{ product.price }}</p>
        <p class="mb-2">📂 Category: {{ product.category?.name }}</p>
        <p class="mb-2">🏷 Brand: {{ product.brand?.name }}</p>
        <p class="mb-4">Condition: <span class="font-semibold">{{ product.condition }}</span></p>
        <p class="mb-4">{{ product.description }}</p>

        <!-- Attributes -->
        <div v-if="product.details?.length" class="mb-4">
          <h2 class="font-semibold mb-2">Details</h2>
          <ul class="list-disc pl-5">
            <li v-for="d in product.details" :key="d.id">
              {{ d.attribute_name }}: {{ d.attribute_value }}
            </li>
          </ul>
        </div>

        <!-- Wishlist button -->
        <div>
          <button
            v-if="!inWishlist"
            @click="addToWishlist"
            class="bg-red-500 text-white px-4 py-2 rounded"
            :disabled="wishlistForm.processing"
          >
            ❤️ Add to Wishlist
          </button>
          <button
            v-else
            @click="removeFromWishlist"
            class="bg-gray-600 text-white px-4 py-2 rounded"
            :disabled="wishlistForm.processing"
          >
            ❌ Remove from Wishlist
          </button>
        </div>
      </div>
    </div>
  </div>
</template>
