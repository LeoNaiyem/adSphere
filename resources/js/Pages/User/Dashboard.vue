<script setup>
import UserLayout from "@/Layouts/UserLayout.vue";
import { Link } from "@inertiajs/vue3";

defineOptions({ layout: UserLayout });

defineProps({
  wishlist: Array,
  recentlyViewed: Array,
});
</script>

<template>
  <Head title="Dashboard" />

  <div class="p-6 max-w-6xl mx-auto">
    <!-- Page Title -->
    <h1 class="text-2xl font-bold mb-6 flex items-center">
      <i class="fa fa-user-circle text-primary-600 mr-2"></i>
      User Dashboard
    </h1>

    <!-- Quick Stats -->
    <div class="grid grid-cols-1 sm:grid-cols-2 gap-6 mb-10">
      <div class="bg-white shadow rounded-xl p-6 flex items-center">
        <i class="fa fa-heart text-red-500 text-3xl mr-4"></i>
        <div>
          <p class="text-gray-500 text-sm">Wishlist Items</p>
          <p class="text-xl font-bold">{{ wishlist.length }}</p>
        </div>
      </div>
      <div class="bg-white shadow rounded-xl p-6 flex items-center">
        <i class="fa fa-eye text-primary-500 text-3xl mr-4"></i>
        <div>
          <p class="text-gray-500 text-sm">Recently Viewed</p>
          <p class="text-xl font-bold">{{ recentlyViewed.length }}</p>
        </div>
      </div>
    </div>

    <!-- Wishlist Section -->
    <section class="mb-12">
      <h2 class="text-xl font-semibold mb-4 flex items-center">
        <i class="fa fa-heart text-red-500 mr-2"></i>
        Wishlist
      </h2>

      <div v-if="wishlist.length === 0" class="text-gray-500 text-center py-6">
        <i class="fa fa-box-open text-3xl mb-2"></i>
        <p>No products in your wishlist yet.</p>
      </div>

      <div v-else class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">
        <div
          v-for="item in wishlist"
          :key="item.id"
          class="bg-white border rounded-xl shadow hover:shadow-md transition p-4"
        >
          <h3 class="font-semibold text-lg truncate">{{ item.title }}</h3>
          <p class="text-sm text-gray-600 mt-1">
            <i class="fa fa-tags mr-1 text-gray-400"></i>{{ item.brand?.name }}
          </p>
          <p class="text-sm text-gray-600">
            <i class="fa fa-folder mr-1 text-gray-400"></i>{{ item.category?.name }}
          </p>
          <div class="mt-3">
            <Link
              :href="route('products.show', item.id)"
              class="bg-primary-600 hover:bg-primary-700 text-white px-4 py-2 rounded text-sm transition"
            >
              <i class="fa fa-eye mr-1"></i> View
            </Link>
          </div>
        </div>
      </div>
    </section>

    <!-- Recently Viewed Section -->
    <section>
      <h2 class="text-xl font-semibold mb-4 flex items-center">
        <i class="fa fa-eye text-primary-500 mr-2"></i>
        Recently Viewed
      </h2>

      <div v-if="recentlyViewed.length === 0" class="text-gray-500 text-center py-6">
        <i class="fa fa-history text-3xl mb-2"></i>
        <p>No recently viewed products.</p>
      </div>

      <div v-else class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">
        <div
          v-for="item in recentlyViewed"
          :key="item.id"
          class="bg-white border rounded-xl shadow hover:shadow-md transition p-4"
        >
          <h3 class="font-semibold text-lg truncate">{{ item.title }}</h3>
          <p class="text-sm text-gray-600 mt-1">
            <i class="fa fa-tags mr-1 text-gray-400"></i>{{ item.brand?.name }}
          </p>
          <p class="text-sm text-gray-600">
            <i class="fa fa-folder mr-1 text-gray-400"></i>{{ item.category?.name }}
          </p>
          <p class="text-xs text-gray-400 mt-2">
            <i class="fa fa-clock mr-1"></i>
            {{ new Date(item.pivot.viewed_at).toLocaleString() }}
          </p>
          <div class="mt-3">
            <Link
              :href="route('products.show', item.id)"
              class="bg-primary-600 hover:bg-primary-700 text-white px-4 py-2 rounded text-sm transition"
            >
              <i class="fa fa-eye mr-1"></i> View Again
            </Link>
          </div>
        </div>
      </div>
    </section>
  </div>
</template>
