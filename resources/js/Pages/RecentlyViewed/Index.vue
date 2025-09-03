<script setup>
import UserLayout from "@/Layouts/UserLayout.vue";
import { Link } from "@inertiajs/vue3";
defineOptions({layout:UserLayout});
defineProps({
  recentlyViewed: Array, // Products with brand + category + pivot.viewed_at
});
</script>

<template>
  <div class="p-6 max-w-5xl mx-auto">
    <h1 class="text-2xl font-bold mb-6">👀 Recently Viewed</h1>

    <div v-if="recentlyViewed.length === 0" class="text-gray-600">
      You haven’t viewed any products yet.
    </div>

    <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4">
      <div
        v-for="item in recentlyViewed"
        :key="item.id"
        class="border rounded p-4 shadow hover:shadow-md"
      >
        <!-- Product Info -->
        <h2 class="font-semibold text-lg">{{ item.title }}</h2>
        <p class="text-sm text-gray-600">💲 {{ item.price }}</p>
        <p class="text-sm">📂 {{ item.category?.name }}</p>
        <p class="text-sm">🏷 {{ item.brand?.name }}</p>
        <p class="text-xs text-gray-500">{{ item.condition }}</p>

        <!-- Viewed At -->
        <p class="text-xs text-gray-400 mt-2">
          Viewed at: {{ new Date(item.pivot.viewed_at).toLocaleString() }}
        </p>

        <!-- Actions -->
        <div class="mt-3">
          <Link
            :href="route('products.show', item.id)"
            class="bg-blue-600 text-white px-3 py-1 rounded text-sm"
          >
            View Again
          </Link>
        </div>
      </div>
    </div>
  </div>
</template>
