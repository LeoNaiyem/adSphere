<script setup>
import UserLayout from "@/Layouts/UserLayout.vue";
import { Link, useForm } from "@inertiajs/vue3";
defineOptions({layout:UserLayout})
defineProps({
  wishlist: Array,
});

const removeForm = useForm({});

function removeFromWishlist(productId) {
  removeForm.delete(route("wishlist.destroy", productId), { preserveScroll: true });
}
</script>

<template>
  {{console.log(wishlist)}}
  <Head title="My Wishlist" />
  <div class="p-6 max-w-7xl mx-auto">
    <h1 class="text-xl font-bold mb-6 flex items-center">
      <i class="fa fa-heart text-red-500 mr-2"></i>
      My Wishlist
    </h1>

    <!-- Empty State -->
    <div
      v-if="wishlist.length === 0"
      class="text-gray-600 text-center py-16"
    >
      <i class="fa fa-heart-broken text-5xl text-gray-400 mb-4"></i>
      <p class="text-lg font-medium">No products in your wishlist yet.</p>
    </div>

    <!-- Product Grid -->
    <div
      v-else
      class="grid grid-cols-2 sm:grid-cols-1 lg:grid-cols-3 xl:grid-cols-5 gap-4"
    >
      <div
        v-for="product in wishlist"
        :key="product.id"
        class="bg-white border rounded-xl shadow-sm hover:shadow-md transition flex flex-col overflow-hidden group"
      >
        <!-- Image -->
        <div class="relative h-36 bg-gray-100 overflow-hidden">
          <img
            v-if="product.images && product.images.length > 0"
            :src="`/storage/${product.images[0].path}`"
            alt="Product Image"
            class="object-cover h-full w-full group-hover:scale-105 transition"
          />
          <i
            v-else
            class="fa fa-box text-gray-400 text-2xl absolute top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-1/2"
          ></i>

          <!-- Remove from Wishlist -->
          <button
            @click="removeFromWishlist(product.id)"
            class="absolute top-2 right-2 w-7 h-7 rounded-full flex items-center justify-center text-white shadow-md transition hover:scale-110 text-xs bg-red-500 hover:bg-red-600"
            :disabled="removeForm.processing"
            title="Remove from wishlist"
          >
            <i class="fas fa-trash-alt"></i>
          </button>
        </div>

        <!-- Body -->
        <div class="p-3 flex flex-col flex-grow">
          <h2
            class="font-medium text-sm text-gray-800 truncate group-hover:text-primary-600 transition"
          >
            {{ product.title }}
          </h2>

          <p class="text-primary-600 font-semibold text-sm mt-1">
            ${{ Number(product.price).toFixed(2) }}
          </p>

          <p class="text-xs text-gray-500 mt-1 truncate">
            <i class="fa fa-tags mr-1"></i>
            {{ product.brand?.name ?? "No Brand" }}
          </p>

          <p class="text-[11px] text-gray-400 mt-1 capitalize">
            <i class="fa fa-info-circle mr-1"></i>
            {{ product.condition }}
          </p>

          <!-- Actions -->
          <div class="mt-auto pt-3">
            <Link
              :href="route('products.show', product.id)"
              class="inline-flex items-center justify-center w-full bg-primary-600 hover:bg-primary-700 text-white px-2 py-1.5 rounded-lg text-xs transition"
            >
              <i class="fa fa-eye mr-1"></i> View
            </Link>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
