<script setup>
import { Link, router } from '@inertiajs/vue3'

const props = defineProps({
  product: Object,
  inWishlist: Boolean,
})

const toggleWishlist = (id) => {
  router.post(route('wishlist.toggle', id), {}, { preserveScroll: true })
}
</script>

<template>
  <div
    class="relative bg-white rounded-xl border shadow-sm hover:shadow-md transition overflow-hidden"
  >
    <!-- Wishlist Icon -->
    <button
      @click.stop="toggleWishlist(product.id)"
      class="absolute top-3 right-3 z-10 p-2 rounded-full bg-white shadow hover:scale-110 transition"
    >
      <i
        :class="inWishlist ? 'fas fa-heart text-red-500' : 'far fa-heart text-gray-500'"
        class="text-lg"
      ></i>
    </button>

    <!-- Card with Link wrapper -->
    <Link :href="route('products.show', product.id)" class="block group">
      <!-- Product Image -->
      <div class="aspect-w-1 aspect-h-1 bg-gray-100">
        <img
          v-if="product.images?.length"
          :src="product.images[0]"
          alt="Product image"
          class="w-full h-full object-cover group-hover:scale-105 transition"
        />
        <div v-else class="flex items-center justify-center h-full text-gray-400">
          No Image
        </div>
      </div>

      <!-- Product Info -->
      <div class="p-4">
        <h3
          class="text-lg font-semibold text-gray-800 truncate group-hover:text-primary-600"
        >
          {{ product.title }}
        </h3>
        <p class="text-green-600 font-bold text-sm mt-1">
          ${{ product.price }}
        </p>
        <p class="text-sm text-gray-500">
          {{ product.category?.name }} · {{ product.brand?.name }}
        </p>
        <p class="text-xs text-gray-400">{{ product.condition }}</p>
      </div>
    </Link>
  </div>
</template>
