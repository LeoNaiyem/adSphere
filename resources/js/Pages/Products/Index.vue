<script setup>
import Navbar from "@/Components/Navbar.vue";
import { Link, useForm } from "@inertiajs/vue3";

const {products,categories,brands,filters} =defineProps({
  products: Object,
  categories: Array,
  brands: Array,
  filters: Object,
});

const form = useForm({
  category_id: filters?.category_id || "",
  brand_id: filters?.brand_id || "",
  condition: filters?.condition || "",
  min_price: filters?.min_price || "",
  max_price: filters?.max_price || "",
});

function applyFilters() {
  form.get(route("products.index"), { preserveState: true, preserveScroll: true });
}
</script>

<template>
  <Head title="Home | Products"/>
  <Navbar/>
  <div class="p-6 grid grid-cols-1 md:grid-cols-4 gap-6">
    <!-- Sidebar Filters -->
    <aside class="space-y-4">
      <h2 class="text-xl font-semibold">Filters</h2>

      <!-- Category Filter -->
      <div>
        <label class="block mb-1">Category</label>
        <select v-model="form.category_id" class="border rounded w-full p-2" @change="applyFilters">
          <option value="">All</option>
          <option v-for="c in categories" :key="c.id" :value="c.id">{{ c.name }}</option>
        </select>
      </div>

      <!-- Brand Filter -->
      <div>
        <label class="block mb-1">Brand</label>
        <select v-model="form.brand_id" class="border rounded w-full p-2" @change="applyFilters">
          <option value="">All</option>
          <option v-for="b in brands" :key="b.id" :value="b.id">{{ b.name }}</option>
        </select>
      </div>

      <!-- Condition Filter -->
      <div>
        <label class="block mb-1">Condition</label>
        <select v-model="form.condition" class="border rounded w-full p-2" @change="applyFilters">
          <option value="">All</option>
          <option value="new">New</option>
          <option value="used">Used</option>
        </select>
      </div>

      <!-- Price Range -->
      <div>
        <label class="block mb-1">Price Range</label>
        <div class="flex space-x-2">
          <input v-model="form.min_price" type="number" placeholder="Min" class="border rounded w-1/2 p-2" @keyup.enter="applyFilters" />
          <input v-model="form.max_price" type="number" placeholder="Max" class="border rounded w-1/2 p-2" @keyup.enter="applyFilters" />
        </div>
        <button @click="applyFilters" class="mt-2 bg-blue-600 text-white px-3 py-1 rounded">
          Apply
        </button>
      </div>
    </aside>

    <!-- Product Listing -->
    <section class="md:col-span-3">
      <h2 class="text-xl font-semibold mb-4">Products</h2>

      <div v-if="products.data.length === 0" class="text-gray-600">No products found.</div>

      <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4">
        <div
          v-for="product in products.data"
          :key="product.id"
          class="border rounded p-4 shadow hover:shadow-md"
        >
          <h3 class="font-bold">{{ product.title }}</h3>
          <p class="text-sm text-gray-600">💲 {{ product.price }}</p>
          <p class="text-sm">📂 {{ product.category?.name }} | 🏷 {{ product.brand?.name }}</p>
          <p class="text-xs text-gray-500">{{ product.condition }}</p>
          <Link :href="route('products.show', product.id)" class="text-blue-600 mt-2 inline-block">View</Link>
        </div>
      </div>

      <!-- Pagination -->
      <div class="mt-6">
        <div class="flex space-x-2">
          <Link
            v-for="link in products.links"
            :key="link.label"
            :href="link.url || '#'"
            v-html="link.label"
            class="px-3 py-1 border rounded"
            :class="{ 'bg-blue-600 text-white': link.active }"
          />
        </div>
      </div>
    </section>
  </div>
</template>
