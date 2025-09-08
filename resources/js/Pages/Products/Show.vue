<script setup>
import MainLayout from '@/Layouts/MainLayout.vue';
import { router } from '@inertiajs/vue3';
import { onBeforeUnmount, onMounted, ref } from "vue";

defineOptions({ layout: MainLayout });

const props = defineProps({
  product: Object,
  images: Array,
  inWishlist: Boolean,
  seller: Object,
});

const selectedImage = ref(props.images.length ? props.images[0] : null);
const lightboxOpen = ref(false);
const currentIndex = ref(0);

onMounted(() => {
  router.post(route('recently-viewed.store'), {
    product_id: props.product.id,
  }, { preserveScroll: true });

  // Close on ESC
  window.addEventListener("keydown", handleKeydown);
});

onBeforeUnmount(() => {
  window.removeEventListener("keydown", handleKeydown);
});

const handleKeydown = (e) => {
  if (!lightboxOpen.value) return;
  if (e.key === "Escape") closeLightbox();
  if (e.key === "ArrowRight") nextImage();
  if (e.key === "ArrowLeft") prevImage();
};

const toggleWishlist = () => {
  router.post(route('wishlist.store'), { product_id: props.product.id }, {
    preserveScroll: true,
  });
};

const selectImage = (img, index) => {
  selectedImage.value = img;
  currentIndex.value = index;
};

const openLightbox = (index) => {
  currentIndex.value = index;
  selectedImage.value = props.images[index];
  lightboxOpen.value = true;
};

const closeLightbox = () => {
  lightboxOpen.value = false;
};

const nextImage = () => {
  if (props.images.length === 0) return;
  currentIndex.value = (currentIndex.value + 1) % props.images.length;
  selectedImage.value = props.images[currentIndex.value];
};

const prevImage = () => {
  if (props.images.length === 0) return;
  currentIndex.value =
    (currentIndex.value - 1 + props.images.length) % props.images.length;
  selectedImage.value = props.images[currentIndex.value];
};
</script>

<template>
  <Head title="Product Details"/>
  <div class="max-w-6xl mx-auto py-8 px-4 grid md:grid-cols-2 gap-10">
    <!-- Product Images -->
    <div>
      <div
        class="aspect-w-1 aspect-h-1 w-full bg-gray-100 rounded-2xl overflow-hidden shadow-lg cursor-pointer"
        @click="openLightbox(currentIndex)"
      >
        <img
          v-if="selectedImage"
          :src="selectedImage"
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
          class="h-24 w-full object-cover rounded cursor-pointer border-2 transition"
          :class="selectedImage === img ? 'border-primary-600' : 'border-gray-200'"
          @click="selectImage(img, i)"
        />
      </div>
    </div>

    <!-- Product Info -->
    <div class="flex flex-col justify-between">
      <!-- Title + Wishlist -->
      <div>
        <div class="flex justify-between items-center mb-4">
          <h1 class="text-3xl font-bold text-gray-800">{{ product.title }}</h1>
          <button
            @click="toggleWishlist"
            class="flex items-center gap-2 px-4 py-2 rounded-full text-white shadow transition hover:scale-110"
            :class="inWishlist ? 'bg-red-500 hover:bg-red-600' : 'bg-primary-600 hover:bg-primary-700'"
            :title="inWishlist ? 'Remove from wishlist' : 'Add to wishlist'"
          >
            <i :class="inWishlist ? 'fas fa-heart' : 'far fa-heart'"></i>
          </button>
        </div>

        <p class="text-3xl font-semibold text-primary-600 mb-4">${{ product.price }}</p>
        <p class="text-gray-700 mb-6 leading-relaxed">{{ product.description }}</p>

        <!-- Basic details -->
        <div class="bg-gray-50 rounded-xl p-4 mb-6">
          <p><span class="font-semibold">Category:</span> {{ product.category?.name }}</p>
          <p><span class="font-semibold">Brand:</span> {{ product.brand?.name }}</p>
          <p><span class="font-semibold">Condition:</span> {{ product.condition }}</p>
        </div>

        <!-- Dynamic details -->
        <div v-if="product.details?.length" class="mt-4">
          <h3 class="font-semibold mb-2">Additional Details</h3>
          <ul class="list-disc list-inside text-gray-600 space-y-1">
            <li v-for="detail in product.details" :key="detail.id">
              {{ detail.category_field?.name }}: {{ detail.value }}
            </li>
          </ul>
        </div>

        <!-- Action buttons -->
        <div class="flex gap-4 mt-8">
          <button class="bg-primary-600 hover:bg-primary-700 text-white px-6 py-2 rounded-xl shadow flex items-center gap-2">
            <i class="fas fa-comment"></i> Message
          </button>
          <button class="border border-gray-400 hover:bg-gray-100 px-6 py-2 rounded-xl flex items-center gap-2">
            <i class="fas fa-phone"></i> Call
          </button>
        </div>
      </div>

      <!-- Seller Info -->
      <div class="border-t pt-6 mt-8">
        <div class="flex items-center gap-4">
          <img
            :src="seller?.avatar ?? '/images/default-avatar.png'"
            alt="Seller"
            class="w-14 h-14 rounded-full border"
          />
          <div>
            <p class="font-semibold flex items-center gap-2">
              {{ seller?.name }}
              <i v-if="seller?.verified" class="fas fa-check-circle text-blue-500" title="Verified Seller"></i>
            </p>
            <p class="text-sm text-gray-500">On AdSphere since {{ seller?.since }}</p>
            <p class="text-sm text-gray-500">Last online {{ seller?.last_online }}</p>
          </div>
        </div>
        <a href="#" class="mt-4 inline-block text-primary-600 hover:underline font-medium">
          View all ads from this seller →
        </a>
      </div>
    </div>
  </div>

  <!-- Lightbox -->
  <div
    v-if="lightboxOpen"
    class="fixed inset-0 bg-black bg-opacity-90 flex items-center justify-center z-50"
  >
    <button
      class="absolute top-6 right-6 text-white text-3xl"
      @click="closeLightbox"
    >
      &times;
    </button>

    <button
      class="absolute left-6 text-white text-3xl"
      @click="prevImage"
    >
      <i class="fas fa-chevron-left"></i>
    </button>

    <img
      :src="selectedImage"
      alt="Large view"
      class="max-h-[90%] max-w-[90%] object-contain rounded-lg shadow-lg"
    />

    <button
      class="absolute right-6 text-white text-3xl"
      @click="nextImage"
    >
      <i class="fas fa-chevron-right"></i>
    </button>
  </div>
</template>
