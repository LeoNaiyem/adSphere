<script setup>
import MainLayout from '@/Layouts/MainLayout.vue';
import { router } from '@inertiajs/vue3';

defineOptions({
  layout:MainLayout,
});

const props = defineProps({
  product: Object,
  images: Array,
  inWishlist: Boolean,
  seller: Object, // pass seller info from backend
})

const toggleWishlist = () => {
  router.post(route('wishlist.store'), { product_id: props.product.id }, {
  preserveScroll: true,
})

  console.log(props.product.id);
}
</script>

<template>
  <Head title='Product Details'/>
  <div class="max-w-6xl mx-auto py-8 px-4 grid md:grid-cols-2 gap-8">
    <!-- Product Images -->
    <div>
      <div class="aspect-w-1 aspect-h-1 w-full bg-gray-100 rounded-2xl overflow-hidden shadow">
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

      <!-- Thumbnails -->
      <div v-if="images.length > 1" class="grid grid-cols-4 gap-4 mt-4">
        <img
          v-for="(img, i) in images"
          :key="i"
          :src="img"
          class="h-24 w-full object-cover rounded cursor-pointer border border-gray-200 hover:opacity-80"
        />
      </div>
    </div>

    <!-- Product Info -->
    <div class="flex flex-col justify-between">
      <div>
        <!-- Title + Wishlist -->
        <div class="flex justify-between items-center mb-4">
          <h1 class="text-2xl font-bold text-gray-800">{{ product.title }}</h1>
          <button
            @click="toggleWishlist"
            class="flex items-center gap-2 px-4 py-2 rounded-lg text-white shadow transition hover:scale-105"
            :class="inWishlist ? 'bg-red-500 hover:bg-red-600' : 'bg-primary-600 hover:bg-primary-700'"
          >
            <i :class="inWishlist ? 'fas fa-heart' : 'far fa-heart'"></i>
          </button>
        </div>

        <p class="text-3xl font-semibold text-primary-600 mb-4">${{ product.price }}</p>
        <p class="text-gray-700 mb-4">{{ product.description }}</p>

        <!-- Basic details -->
        <div class="space-y-2 text-gray-700">
          <p><span class="font-semibold">Category:</span> {{ product.category?.name }}</p>
          <p><span class="font-semibold">Brand:</span> {{ product.brand?.name }}</p>
          <p><span class="font-semibold">Condition:</span> {{ product.condition }}</p>
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

        <!-- Action buttons -->
        <div class="flex gap-4 mt-6">
          <button class="bg-primary-600 hover:bg-primary-700 text-white px-6 py-2 rounded-xl shadow flex items-center gap-2">
            <i class="fas fa-comment"></i> Message
          </button>
          <button class="border border-gray-400 hover:bg-gray-100 px-6 py-2 rounded-xl flex items-center gap-2">
            <i class="fas fa-phone"></i> Call
          </button>
        </div>
      </div>

      <!-- Seller Info -->
      <div class="border-t pt-6 mt-6">
        <div class="flex items-center gap-4">
          <img src="/images/logo.png" alt="Seller" class="w-12 h-12 rounded-full border" />
          <div>
            <p class="font-semibold">{{ seller?.name }}</p>
            <p class="text-sm text-gray-500">On OLX since {{ seller?.since }}</p>
            <p class="text-sm text-gray-500">Last online {{ seller?.last_online }}</p>
          </div>
        </div>
        <a href="#" class="mt-4 inline-block text-blue-600 hover:underline">
          All ads from this user
        </a>
      </div>
    </div>
  </div>
</template>
