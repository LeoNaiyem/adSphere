<script setup>
import Container from "@/Components/Container.vue";
import DeleteModal from "@/Components/DeleteModal.vue";
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
    <Container>
        <!-- Breadcrumb + Back -->
        <div class="flex items-center gap-2 text-sm text-gray-500 mb-6">
            <Link
                :href="route('dashboard')"
                class="hover:text-primary-600 flex items-center gap-1"
            >
                <i class="fas fa-arrow-left"></i> Back
            </Link>
            <span>/</span>
            <span class="text-gray-700 font-medium">Products</span>
        </div>

        <div class="w-11/12 mx-auto">
            <!-- Header -->
            <div class="flex justify-between items-center mb-4">
                <h1 class="text-xl font-bold text-gray-800">Products</h1>
                <Link
                    :href="route('products.create')"
                    class="inline-flex items-center gap-2 px-4 py-2 rounded bg-primary-500 text-white text-sm font-medium shadow hover:bg-primary-600 transition"
                >
                    <i class="fas fa-plus"></i> Create New Product
                </Link>
            </div>

            <!-- Products Table -->
            <div class="overflow-x-auto bg-white shadow rounded-lg">
                <table class="w-full text-sm text-left text-gray-600">
                    <thead class="bg-gray-100 text-gray-700 text-xs uppercase">
                        <tr>
                            <th class="px-4 py-3">Title</th>
                            <th class="px-4 py-3">Category</th>
                            <th class="px-4 py-3">Brand</th>
                            <th class="px-4 py-3">Price</th>
                            <th class="px-4 py-3">Owner</th>
                            <th class="px-4 py-3 text-right">Actions</th>
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
                                    class="px-3 py-2 rounded-lg bg-primary-50 text-primary-600 hover:bg-primary-600 hover:text-white transition text-xs font-medium flex items-center gap-1"
                                >
                                    <i class="fas fa-eye"></i> View
                                </Link>
                                <Link
                                    :href="route('products.edit', product.id)"
                                    class="px-3 py-2 rounded-lg bg-yellow-50 text-yellow-600 hover:bg-yellow-600 hover:text-white transition text-xs font-medium flex items-center gap-1"
                                >
                                    <i class="fas fa-edit"></i> Edit
                                </Link>
                                <button
                                    @click="openDelete(product.id)"
                                    class="px-3 py-2 rounded-lg bg-red-50 text-red-600 hover:bg-red-600 hover:text-white transition text-xs font-medium flex items-center gap-1"
                                >
                                    <i class="fas fa-trash"></i> Delete
                                </button>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <DeleteModal
                    :show="deleteOpen"
                    :productId="selectedProductId"
                    @close="deleteOpen = false"
                />
            </div>

            <!-- Pagination (if available) -->
            <!-- <div class="mt-4">
        <Pagination :links="products.links" />
      </div> -->
        </div>
    </Container>
</template>
