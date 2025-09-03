<script setup>
import Navbar from '@/Components/Navbar.vue';

defineProps({
  productsCount: Number,
  categoriesCount: Number,
  brandsCount: Number,
});
</script>

<template>
  <Navbar/>
  <div class="p-6 grid grid-cols-1 md:grid-cols-3 gap-4">
    <div class="bg-white rounded shadow p-4 text-center">
      <h2 class="text-xl font-bold">{{ productsCount }}</h2>
      <p class="text-gray-600">Products</p>
    </div>
    <div class="bg-white rounded shadow p-4 text-center">
      <h2 class="text-xl font-bold">{{ categoriesCount }}</h2>
      <p class="text-gray-600">Categories</p>
    </div>
    <div class="bg-white rounded shadow p-4 text-center">
      <h2 class="text-xl font-bold">{{ brandsCount }}</h2>
      <p class="text-gray-600">Brands</p>
    </div>
  </div>
</template>
