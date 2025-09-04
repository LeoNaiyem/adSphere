<script setup>
import { ref, watchEffect } from 'vue'

const props = defineProps({
  product: {
    type: Object,
    required: true
  }
})

const emit = defineEmits(['click', 'wishlist'])

const isWishlisted = ref(false)
const imageError = ref(false)

const loading = ref(false)

watchEffect(() => {
  loading.value = !props.product?.image || imageError.value
})

function toggleWishlist() {
  isWishlisted.value = !isWishlisted.value
  emit('wishlist', { product: props.product, wishlisted: isWishlisted.value })
}

function formatPrice(value) {
  return new Intl.NumberFormat('en-BG', {
    style: 'currency',
    currency: 'BGN',
    maximumFractionDigits: 2
  }).format(value)
}
console.log('Received product:', props.product)
console.log('Product ID:', props.product?.id)

</script>

<template>
  <Link :href="route('products.show', product.id)" class="block">
    <div
      class="relative bg-white rounded-lg shadow-sm overflow-hidden hover:shadow-md transition border border-gray-100"
    >
      <!-- Product Image -->
      <div class="relative w-full h-48 overflow-hidden bg-gray-100">
        <img
          v-if="!loading"
          :src="product.image"
          @error="imageError = true"
          alt="product image"
          class="w-full h-full object-cover"
        />
        <div
          v-else
          class="w-full h-full flex items-center justify-center text-gray-400 text-sm"
        >
          <i class="fas fa-image text-xl"></i>
        </div>

        <!-- Delivery Icon -->
        <div
          v-if="product.hasDelivery"
          class="absolute top-2 right-2 bg-white p-1 rounded-full shadow text-gray-700 text-sm"
        >
          <i class="fas fa-truck"></i>
        </div>
      </div>

      <!-- Product Details -->
      <div class="p-3 flex flex-col gap-1">
        <h3 class="text-sm text-gray-800 line-clamp-2">
          {{ product.title }}
        </h3>
        <p class="font-bold text-base text-black">{{ formatPrice(product.price) }}</p>
        <p class="text-xs text-gray-500">{{ product.location }}</p>
        <p class="text-xs text-gray-400">{{ product.updated }}</p>
      </div>

      <!-- Wishlist Icon -->
      <div
        class="absolute top-2 left-2 p-1 z-10"
        @click.stop="toggleWishlist"
      >
        <i
          :class="[
            isWishlisted ? 'fas text-red-500' : 'far text-gray-500',
            'fa-heart hover:text-red-500 cursor-pointer transition'
          ]"
        ></i>
      </div>
    </div>
  </Link>
</template>

