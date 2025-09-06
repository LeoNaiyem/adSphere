<script setup>
import { onMounted, onUnmounted, ref, watchEffect } from 'vue'

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

// For slider
const currentIndex = ref(0)
let interval = null

watchEffect(() => {
  loading.value = (!props.product?.images?.length && !props.product?.image) || imageError.value
})

// Toggle wishlist
function toggleWishlist() {
  isWishlisted.value = !isWishlisted.value
  emit('wishlist', { product: props.product, wishlisted: isWishlisted.value })
}

// Price formatter
function formatPrice(value) {
  return new Intl.NumberFormat('en-BG', {
    style: 'currency',
    currency: 'BGN',
    maximumFractionDigits: 2
  }).format(value)
}

// Manual navigation
function prevImage() {
  if (props.product.images?.length) {
    currentIndex.value =
      (currentIndex.value - 1 + props.product.images.length) % props.product.images.length
  }
}

function nextImage() {
  if (props.product.images?.length) {
    currentIndex.value = (currentIndex.value + 1) % props.product.images.length
  }
}

// Auto-slide
onMounted(() => {
  if (props.product.images && props.product.images.length > 1) {
    interval = setInterval(() => {
      nextImage()
    }, 10000) // slide every 3s
  }
})

onUnmounted(() => {
  if (interval) clearInterval(interval)
})
</script>

<template>
  <Link :href="route('products.show', product.id)" class="block">
  <div
    class="relative bg-white rounded-2xl shadow-md overflow-hidden hover:shadow-lg transition border border-gray-100"
  >
    <!-- Product Image Slider -->
    <div class="relative w-full h-52 overflow-hidden bg-gray-100">
      <img
        v-if="!loading"
        :src="product.images?.length
          ? '/storage/' + product.images[currentIndex]?.path
          : product.image || '/default-product.png'"
        @error="imageError = true"
        alt="product image"
        class="w-full h-full object-cover transition duration-500"
      />

      <div
        v-else
        class="w-full h-full flex items-center justify-center text-gray-400 text-sm"
      >
        <i class="fas fa-image text-xl"></i>
      </div>

      <!-- Delivery Badge -->
      <div
        v-if="product.hasDelivery"
        class="absolute top-3 right-3 bg-green-500 text-white px-2 py-1 rounded-md text-xs shadow"
      >
        <i class="fas fa-truck mr-1"></i> Delivery
      </div>

      <!-- Wishlist Icon -->
      <div
        class="absolute top-3 left-3 p-2 rounded-full bg-white/80 backdrop-blur-sm shadow cursor-pointer"
        @click.stop="toggleWishlist"
      >
        <i
          :class="[isWishlisted ? 'fas text-red-500' : 'far text-gray-600',
                   'fa-heart text-lg']"
        ></i>
      </div>

      <!-- Navigation Arrows -->
      <button
        v-if="product.images && product.images.length > 1"
        @click.stop.prevent="prevImage"
        class="absolute left-2 top-1/2 -translate-y-1/2 h-8 w-8 flex items-center justify-center bg-black/40 text-white rounded-full hover:bg-black/60 transition"
      >
        <i class="fas fa-chevron-left text-xs"></i>
      </button>
      <button
        v-if="product.images && product.images.length > 1"
        @click.stop.prevent="nextImage"
        class="absolute right-2 top-1/2 -translate-y-1/2 h-8 w-8 flex items-center justify-center bg-black/40 text-white rounded-full hover:bg-black/60 transition"
      >
        <i class="fas fa-chevron-right text-xs"></i>
      </button>

      <!-- Dots Indicator -->
      <div
        v-if="product.images && product.images.length > 1"
        class="absolute bottom-3 left-1/2 transform -translate-x-1/2 flex space-x-1"
      >
        <span
          v-for="(img, i) in product.images"
          :key="i"
          class="w-2 h-2 rounded-full"
          :class="i === currentIndex ? 'bg-white' : 'bg-gray-400 opacity-70'"
        ></span>
      </div>
    </div>

    <!-- Product Details -->
    <div class="p-4 space-y-2">
      <h3 class="text-base font-semibold text-gray-800 line-clamp-2">
        {{ product.title }}
      </h3>
      <p class="text-lg font-bold text-primary-600">
        {{ formatPrice(product.price) }}
      </p>

      <!-- Meta Info Grid -->
      <div class="grid grid-cols-2 gap-2 text-xs text-gray-600">
        <p><span class="font-semibold">Condition:</span> {{ product.condition }}</p>
        <p><span class="font-semibold">Category:</span> {{ product.category?.name }}</p>
        <p><span class="font-semibold">Brand:</span> {{ product.brand?.name }}</p>
        <p>
          <span class="font-semibold">Updated:</span>
          {{ new Date(product.updated_at).toLocaleDateString() }}
        </p>
      </div>

      <!-- Seller Info -->
      <div class="flex items-center gap-3 pt-3 border-t border-gray-100">
        <div
          class="h-9 w-9 flex items-center justify-center rounded-full bg-primary-100 text-primary-600 font-semibold"
        >
          {{ product.user?.name?.charAt(0).toUpperCase() }}
        </div>
        <div>
          <p class="text-sm font-medium text-gray-800">
            {{ product.user?.name }}
          </p>
          <p class="text-xs text-gray-500">Seller</p>
        </div>
      </div>
    </div>
  </div>
</Link>

</template>
