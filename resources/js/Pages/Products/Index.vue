<script setup>
import Footer from "@/Components/Footer.vue";
import ItemCard from "@/Components/ItemCard.vue";
import Navbar from "@/Components/Navbar.vue";
import ProductCard from "@/Components/ProductCard.vue";
import { Link, useForm } from "@inertiajs/vue3";

const { products, categories, brands, filters } = defineProps({
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
    form.get(route("products.index"), {
        preserveState: true,
        preserveScroll: true,
    });
}
const clearFilters = () => {
    form.category_id = "";
    form.brand_id = "";
    form.condition = "";
    form.min_price = "";
    form.max_price = "";
    applyFilters();
};

console.log(products)
</script>

<template>
    <Head title="Home | Products" />
    <div class="p-6 grid grid-cols-1 md:grid-cols-4 gap-6">
        <!-- Sidebar Filters -->
        <aside class="bg-white rounded-2xl shadow-md p-6 space-y-6">
            <!-- Header with Clear -->
            <div class="flex items-center justify-between border-b pb-3">
                <h2 class="text-xl font-semibold flex items-center gap-2">
                    <i class="fas fa-filter text-gray-500"></i> Filters
                </h2>
                <button
                    @click="clearFilters"
                    class="text-sm text-gray-500 hover:text-red-500 transition"
                >
                    <i class="fas fa-times-circle"></i> Clear
                </button>
            </div>

            <!-- Category Filter -->
            <div>
                <label class="block text-sm font-medium text-gray-700 mb-1"
                    >Category</label
                >
                <select
                    v-model="form.category_id"
                    class="w-full rounded-lg border-gray-300 shadow-sm focus:border-primary-500 focus:ring-primary-500 text-gray-700"
                    @change="applyFilters"
                >
                    <option value="">All</option>
                    <option v-for="c in categories" :key="c.id" :value="c.id">
                        {{ c.name }}
                    </option>
                </select>
            </div>

            <!-- Brand Filter -->
            <div>
                <label class="block text-sm font-medium text-gray-700 mb-1"
                    >Brand</label
                >
                <select
                    v-model="form.brand_id"
                    class="w-full rounded-lg border-gray-300 shadow-sm focus:border-primary-500 focus:ring-primary-500 text-gray-700"
                    @change="applyFilters"
                >
                    <option value="">All</option>
                    <option v-for="b in brands" :key="b.id" :value="b.id">
                        {{ b.name }}
                    </option>
                </select>
            </div>

            <!-- Condition Filter -->
            <div>
                <label class="block text-sm font-medium text-gray-700 mb-1"
                    >Condition</label
                >
                <select
                    v-model="form.condition"
                    class="w-full rounded-lg border-gray-300 shadow-sm focus:border-primary-500 focus:ring-primary-500 text-gray-700"
                    @change="applyFilters"
                >
                    <option value="">All</option>
                    <option value="new">New</option>
                    <option value="used">Used</option>
                </select>
            </div>

            <!-- Price Range -->
            <div>
                <label class="block text-sm font-medium text-gray-700 mb-1"
                    >Price Range</label
                >
                <div class="flex space-x-2">
                    <input
                        v-model="form.min_price"
                        type="number"
                        placeholder="Min"
                        class="w-1/2 rounded-lg border-gray-300 shadow-sm focus:border-primary-500 focus:ring-primary-500 text-gray-700"
                        @keyup.enter="applyFilters"
                    />
                    <input
                        v-model="form.max_price"
                        type="number"
                        placeholder="Max"
                        class="w-1/2 rounded-lg border-gray-300 shadow-sm focus:border-primary-500 focus:ring-primary-500 text-gray-700"
                        @keyup.enter="applyFilters"
                    />
                </div>
                <button
                    @click="applyFilters"
                    class="mt-3 w-full bg-primary-600 hover:bg-primary-700 text-white px-4 py-2 rounded-lg shadow flex items-center justify-center gap-2"
                >
                    <i class="fas fa-check"></i> Apply
                </button>
            </div>
        </aside>

        <!-- Product Listing -->
        <section class="md:col-span-3">
            <h2 class="text-xl font-semibold mb-4">Products</h2>

            <div v-if="products.data.length === 0" class="text-gray-600">
                No products found.
            </div>

            <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">
  <ProductCard
    v-for="p in products.data"
    :key="p.id"
    :product="p"
    :in-wishlist="p.in_wishlist"
  />
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
                        :class="{ 'bg-primary-600 text-white': link.active }"
                    />
                </div>
            </div>
        </section>
    </div>
</template>
