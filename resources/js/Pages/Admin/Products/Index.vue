<script setup>
import AdminLayout from "@/Layouts/AdminLayout.vue";
defineOptions({ layout: AdminLayout });
defineProps({ products: Object });
</script>

<template>
  <Head title="Products"/>
  <Navbar/>
  <div class="p-6">
    <h1 class="text-2xl font-bold mb-4">📦 Products</h1>

    <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
      <div v-for="product in products.data" :key="product.id" class="border p-4 rounded shadow">
        <h2 class="font-semibold">{{ product.title }}</h2>
        <p class="text-sm">💲 {{ product.price }}</p>
        <p class="text-sm">📂 {{ product.category?.name }} | 🏷 {{ product.brand?.name }}</p>
        <p class="text-xs text-gray-500">{{ product.condition }}</p>
        <Link :href="route('products.edit', product.id)" class="text-primary-600 mt-2 inline-block">Edit</Link>
      </div>
    </div>
  </div>
</template>
