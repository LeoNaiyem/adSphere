<script setup>
import UserLayout from "@/Layouts/UserLayout.vue";
import { Link } from "@inertiajs/vue3";

defineOptions({ layout: UserLayout });

defineProps({
  recentlyViewed: Array,
});
</script>

<template>
  <Head title="Recently viewed"/>
  <div class="p-6 max-w-6xl mx-auto">
    <h1 class="text-2xl font-bold mb-6 flex items-center">
      <i class="fa fa-eye text-primary-600 mr-2"></i>
      Recently Viewed
    </h1>

    <!-- Empty State -->
    <div v-if="recentlyViewed.length === 0" class="text-gray-600 text-center py-12">
      <i class="fa fa-clock text-4xl text-gray-400 mb-4"></i>
      <p class="text-lg">You haven’t viewed any products yet.</p>
    </div>

    <!-- Grid -->
    <div v-else class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">
      <div
        v-for="item in recentlyViewed"
        :key="item.id"
        class="bg-white border rounded-xl shadow hover:shadow-lg transition p-4 flex flex-col"
      >
        <!-- Product Image (if exists) -->
        <div class="h-40 w-full mb-4 overflow-hidden rounded-lg bg-gray-100 flex items-center justify-center">
          <img
            v-if="item.images && item.images.length > 0"
            :src="`/storage/${item.images[0].path}`"
            alt="Product Image"
            class="object-cover h-full w-full hover:scale-105 transition"
          />
          <i v-else class="fa fa-box text-gray-400 text-4xl"></i>
        </div>

        <!-- Product Info -->
        <h2 class="font-semibold text-lg truncate">{{ item.title }}</h2>
        <p class="text-sm text-gray-600 mt-1">
          <i class="fa fa-dollar-sign mr-1 text-green-500"></i>{{ item.price }}
        </p>
        <p class="text-sm mt-1">
          <i class="fa fa-folder mr-1 text-gray-500"></i>{{ item.category?.name ?? "Uncategorized" }}
        </p>
        <p class="text-sm mt-1">
          <i class="fa fa-tags mr-1 text-gray-500"></i>{{ item.brand?.name ?? "No Brand" }}
        </p>
        <p class="text-xs text-gray-500 mt-1 capitalize">
          <i class="fa fa-info-circle mr-1"></i>{{ item.condition }}
        </p>

        <!-- Viewed At -->
        <p class="text-xs text-gray-400 mt-3">
          <i class="fa fa-clock mr-1"></i>
          Viewed at: {{ new Date(item.pivot.viewed_at).toLocaleString() }}
        </p>

        <!-- Actions -->
        <div class="mt-4 flex justify-between items-center">
          <Link
            :href="route('products.show', item.id)"
            class="bg-primary-600 hover:bg-primary-700 text-white px-4 py-2 rounded text-sm transition"
          >
            <i class="fa fa-eye mr-1"></i> View Again
          </Link>
          <Link
            :href="route('wishlist.store', { product_id: item.id })"
            method="post"
            as="button"
            class="text-red-500 hover:text-red-600 text-sm"
          >
            <i class="fa fa-heart"></i>
          </Link>
        </div>
      </div>
    </div>
  </div>
</template>
