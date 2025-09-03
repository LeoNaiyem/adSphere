<script setup>
import { router } from '@inertiajs/vue3'

const props = defineProps({
  product: Object,
  images: Array,
  inWishlist: Boolean,
})

const toggleWishlist = () => {
  router.post(route('wishlist.toggle', props.product.id), {}, {
    preserveScroll: true,
  })
}
</script>

<template>
  <div class="max-w-6xl mx-auto py-8 px-4">
    <!-- Product Title & Wishlist -->
    <div class="flex justify-between items-center mb-6">
      <h1 class="text-3xl font-bold text-gray-800">{{ product.title }}</h1>
      <button
        @click="toggleWishlist"
        class="flex items-center gap-2 px-4 py-2 rounded-lg text-white shadow 
               transition hover:scale-105"
        :class="inWishlist ? 'bg-red-500 hover:bg-red-600' : 'bg-gray-600 hover:bg-gray-700'"
      >
        <i :class="inWishlist ? 'fas fa-heart' : 'far fa-heart'"></i>
        <span>{{ inWishlist ? 'Remove from Wishlist' : 'Add to Wishlist' }}</span>
      </button>
    </div>

    <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
      <!-- Product Images -->
      <div>
        <div class="aspect-w-1 aspect-h-1 w-full bg-gray-100 rounded-lg overflow-hidden">
          <img
            v-if="images.length"
            :src="images[0]"
            class="w-full h-full object-cover"
            alt="Main product image"
          />
          <div v-else class="flex items-center justify-center h-full text-gray-400">
            No Image Available
          </div>
        </div>

        <div class="grid grid-cols-4 gap-4 mt-4">
          <img
            v-for="(img, i) in images"
            :key="i"
            :src="img"
            class="h-24 w-full object-cover rounded cursor-pointer border border-gray-200 hover:opacity-80"
            @click="$refs.mainImage.src = img"
            ref="thumb"
          />
        </div>
      </div>

      <!-- Product Details -->
      <div class="space-y-4">
        <p class="text-lg text-gray-700">{{ product.description }}</p>

        <div class="space-y-2">
          <p><span class="font-semibold">Category:</span> {{ product.category?.name }}</p>
          <p><span class="font-semibold">Brand:</span> {{ product.brand?.name }}</p>
          <p><span class="font-semibold">Condition:</span> {{ product.condition }}</p>
          <p><span class="font-semibold">Price:</span> <span class="text-xl font-bold text-green-600">${{ product.price }}</span></p>
        </div>

        <!-- Dynamic details -->
        <div v-if="product.details?.length" class="mt-4">
          <h3 class="font-semibold mb-2">Details</h3>
          <ul class="list-disc list-inside text-gray-600 space-y-1">
            <li v-for="detail in product.details" :key="detail.id">
              {{ detail.category_field?.name }}: {{ detail.value }}
            </li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</template>
