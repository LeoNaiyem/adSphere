<script setup>
import UserLayout from "@/Layouts/UserLayout.vue";
import { Link } from "@inertiajs/vue3";

defineOptions({ layout: UserLayout });

defineProps({
  wishlist: Array,
  recentlyViewed: Array,
  products: Array,
  stats: Object,
});
</script>

<template>
  <Head title="Dashboard" />

  <div class="p-6 max-w-7xl mx-auto space-y-10">
    <!-- Page Title -->
    <h1 class="text-2xl font-bold mb-6 flex items-center">
      <i class="fa fa-user-circle text-primary-600 mr-2"></i>
      User Dashboard
    </h1>

    <!-- Quick Stats -->
    <div class="grid grid-cols-1 sm:grid-cols-3 gap-6">
      <div class="bg-white shadow rounded-xl p-6 flex items-center">
        <i class="fa fa-box text-primary-600 text-3xl mr-4"></i>
        <div>
          <p class="text-gray-500 text-sm">Posted Products</p>
          <p class="text-xl font-bold">{{ stats.product_count }}</p>
        </div>
      </div>
      <div class="bg-white shadow rounded-xl p-6 flex items-center">
        <i class="fa fa-heart text-red-500 text-3xl mr-4"></i>
        <div>
          <p class="text-gray-500 text-sm">Wishlist</p>
          <p class="text-xl font-bold">{{ stats.wishlist_count }}</p>
        </div>
      </div>
      <div class="bg-white shadow rounded-xl p-6 flex items-center">
        <i class="fa fa-eye text-primary-500 text-3xl mr-4"></i>
        <div>
          <p class="text-gray-500 text-sm">Recently Viewed</p>
          <p class="text-xl font-bold">{{ stats.recently_viewed_count }}</p>
        </div>
      </div>
    </div>

    <section class="grid grid-cols-1 lg:grid-cols-2 gap-6">
      <!-- Posted Products Table -->
      <div>
        <h2 class="text-lg font-semibold mb-3 flex items-center">
          <i class="fa fa-box mr-2 text-primary-600"></i>
          Latest Posted Products
        </h2>
        <div class="bg-white shadow rounded-xl overflow-hidden">
          <table class="w-full text-left text-sm">
            <thead class="bg-primary-50 text-gray-600 uppercase text-xs">
              <tr>
                <th class="px-4 py-3">Title</th>
                <th class="px-4 py-3">Brand</th>
                <th class="px-4 py-3">Brand</th>
                <th class="px-4 py-3">Price</th>
              </tr>
            </thead>
            <tbody>
              <tr
                v-for="item in products"
                :key="item.id"
                class="border-t hover:bg-gray-50"
              >
                <td class="px-4 py-3 font-medium">{{ item.title }}</td>
                <td class="px-4 py-3">{{ item.brand?.name }}</td>
                <td class="px-4 py-3">{{ item.category?.name }}</td>
                <td class="px-4 py-3 text-green-600 font-semibold">${{ item.price }}</td>
            
              </tr>
            </tbody>
          </table>
        </div>
      </div>

      <!-- Wishlist Table -->
      <div>
        <h2 class="text-lg font-semibold mb-3 flex items-center">
          <i class="fa fa-heart mr-2 text-red-500"></i>
          Latest Wishlist
        </h2>
        <div class="bg-white shadow rounded-xl overflow-hidden">
          <table class="w-full text-left text-sm">
            <thead class="bg-primary-50 text-gray-600 uppercase text-xs">
              <tr>
                <th class="px-4 py-3">Title</th>
                <th class="px-4 py-3">Brand</th>
                <th class="px-4 py-3">Category</th>
              </tr>
            </thead>
            <tbody>
              <tr
                v-for="item in wishlist"
                :key="item.id"
                class="border-t hover:bg-gray-50"
              >
                <td class="px-4 py-3 font-medium">{{ item.title }}</td>
                <td class="px-4 py-3">{{ item.brand?.name }}</td>
                <td class="px-4 py-3">{{ item.category?.name }}</td>
                
              </tr>
            </tbody>
          </table>
        </div>
      </div>

      <!-- Recently Viewed Table -->
      <div>
        <h2 class="text-lg font-semibold mb-3 flex items-center">
          <i class="fa fa-eye mr-2 text-primary-500"></i>
          Latest Recently Viewed
        </h2>
        <div class="bg-white shadow rounded-xl overflow-hidden">
          <table class="w-full text-left text-sm">
            <thead class="bg-primary-50 text-gray-600 uppercase text-xs">
              <tr>
                <th class="px-4 py-3">Title</th>
                <th class="px-4 py-3">Category</th>
                <th class="px-4 py-3">Viewed At</th>
              </tr>
            </thead>
            <tbody>
              <tr
                v-for="item in recentlyViewed"
                :key="item.id"
                class="border-t hover:bg-gray-50"
              >
                <td class="px-4 py-3 font-medium">{{ item.title }}</td>
                <td class="px-4 py-3">{{ item.category?.name }}</td>
                <td class="px-4 py-3 text-xs text-gray-500">
                  {{ new Date(item.pivot.viewed_at).toLocaleString() }}
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </section>
  </div>
</template>
