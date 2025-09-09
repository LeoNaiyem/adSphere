<script setup>
import DeleteModal from "@/Components/DeleteModal.vue";
import Pagination from "@/Components/Pagination.vue";
import AdminLayout from "@/Layouts/AdminLayout.vue";
import UserLayout from "@/Layouts/UserLayout.vue";
import { ref } from "vue";

defineProps({
    products: Object,
    role: String,
});


const deleteOpen = ref(false);
const selectedProductId = ref(null);

const openDelete = (id) => {
  selectedProductId.value = id;
  deleteOpen.value = true;
};
</script>

<script>
export default {
    layout: (h, page) => {
        const role = page.props.role;
        const Layout = role === "admin" ? AdminLayout : UserLayout;
        return h(Layout, null, () => page);
    },
};
</script>

<template>
    <Head title="Products List" />
    <div class="space-y-6 p-6">
        
        <!-- Breadcrumb -->
    <nav class="flex items-center text-sm text-gray-500 space-x-2">
      <Link :href="route('dashboard')" class="hover:text-primary-600 flex items-center">
        <i class="fas fa-home mr-1 text-primary-500"></i> Dashboard
      </Link>
      <span>/</span>
      <span class="flex items-center text-gray-700 font-semibold">
        <i class="fa fa-boxes mr-1 text-primary-500"></i>
        Products
      </span>
    </nav>

        <div class="flex justify-between items-center">
      <h1 class="text-2xl font-bold text-gray-800 flex items-center">
        <i class="fas fa-box mr-2 text-primary-600"></i>
        Products List
      </h1>
      <Link
        :href="route('products.create')"
        class="bg-primary-600 text-sm hover:bg-primary-700 text-white px-4 py-2 rounded shadow flex items-center space-x-2"
      >
        <i class="fas fa-plus"></i>
        <span>Add Product</span>
      </Link>
    </div>

            <!-- Products Table -->
            <div class="overflow-x-auto bg-white shadow rounded-xl">
                <table class="bg-gray-50 text-left text-gray-700 capitalize text-sm w-full">
                    <thead class="bg-gray-100 text-gray-700 text-xs uppercase">
                        <tr>
                            <th class="px-4 py-3">Title</th>
                            <th class="px-4 py-3">Category</th>
                            <th class="px-4 py-3">Brand</th>
                            <th class="px-4 py-3">Price</th>
                            <th class="px-4 py-3">Owner</th>
                            <th class="px-4 py-3 text-center">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr
                            v-for="product in products.data"
                            :key="product.id"
                            class="border-t hover:bg-gray-50 transition"
                        >
                            <td class="px-4 py-3 font-medium text-gray-900">
                                {{ product.title }}
                            </td>
                            <td class="px-4 py-3">
                                {{ product.category?.name ?? "—" }}
                            </td>
                            <td class="px-4 py-3">
                                {{ product.brand?.name ?? "—" }}
                            </td>
                            <td class="px-4 py-3 font-semibold text-gray-800">
                                {{ product.price }}
                            </td>
                            <td class="px-4 py-3">
                                {{ product.user?.name ?? "N/A" }}
                            </td>
                            <td class="px-4 py-3 flex justify-end gap-2">
                                <Link
                                    :href="route('products.show', product.id)"
                                    class="px-3 py-2 rounded bg-primary-50 text-primary-600 hover:bg-primary-600 hover:text-white transition text-xs font-medium flex items-center gap-1"
                                >
                                    <i class="fas fa-eye"></i> View
                                </Link>
                                <Link
                                    :href="route('products.edit', product.id)"
                                    class="px-3 py-2 rounded bg-yellow-50 text-yellow-600 hover:bg-yellow-600 hover:text-white transition text-xs font-medium flex items-center gap-1"
                                >
                                    <i class="fas fa-edit"></i> Edit
                                </Link>
                                <button
                                    @click="openDelete(product.id)"
                                    class="px-3 py-2 rounded bg-red-50 text-red-600 hover:bg-red-600 hover:text-white transition text-xs font-medium flex items-center gap-1"
                                >
                                    <i class="fas fa-trash"></i> Delete
                                </button>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <DeleteModal
                    :show="deleteOpen"
                    :itemId="selectedProductId"
                    routeName="products.destroy"
                    @close="deleteOpen = false"
                />
            </div>

            <!-- Pagination -->
    <Pagination
      :links="products.links"
      :from="products.from"
      :to="products.to"
      :total="products.total"
    />
    </div>
</template>
