<script setup>
defineProps({ brands: Object });
</script>

<template>
  <div class="p-6">
    <h1 class="text-2xl font-bold mb-4">🏷 Brands</h1>

    <ul class="space-y-2">
      <li v-for="brand in brands.data" :key="brand.id" class="border p-3 rounded">
        <div class="flex justify-between">
          <span class="font-medium">{{ brand.name }}</span>
          <Link :href="route('brands.edit', brand.id)" class="text-blue-600">Edit</Link>
        </div>
        <p class="text-sm text-gray-500">{{ brand.description }}</p>
      </li>
    </ul>
  </div>
</template>
