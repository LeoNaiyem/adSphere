<script setup>
import AdminLayout from "@/Layouts/AdminLayout.vue";
import UserLayout from "@/Layouts/UserLayout.vue";

defineProps({
  products: Object,
  role: String,
})
</script>

<script>

export default {
  layout: (h, page) => {
    const role = page.props.role
    const Layout = role === "admin" ? AdminLayout : UserLayout
    return h(Layout, null, () => page)
  },
}
</script>


<template>
    {{ console.log(role) }}
    <Container>
        <div class="w-9/12 mx-auto">
            <h1 class="text-xl font-bold mb-4">Products</h1>
            <table class="w-full border">
                <thead>
                    <tr class="bg-gray-100">
                        <th class="p-2">Title</th>
                        <th class="p-2">Category</th>
                        <th class="p-2">Brand</th>
                        <th class="p-2">Price</th>
                        <th class="p-2">Owner</th>
                    </tr>
                </thead>
                <tbody>
                    <tr
                        v-for="product in products.data"
                        :key="product.id"
                        class="border-t"
                    >
                        <td class="p-2">{{ product.title }}</td>
                        <td class="p-2">{{ product.category?.name }}</td>
                        <td class="p-2">{{ product.brand?.name }}</td>
                        <td class="p-2">{{ product.price }}</td>
                        <td class="p-2">{{ product.user?.name ?? "N/A" }}</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </Container>
</template>
