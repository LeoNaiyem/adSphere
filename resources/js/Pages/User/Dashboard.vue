<script setup>
import Navbar from "@/Components/Navbar.vue";

defineProps({
    wishlist: Array,
    recentlyViewed: Array,
});
</script>

<template>
    <Navbar />
    <div class="p-6">
        <h1 class="text-2xl font-bold mb-6">User Dashboard</h1>

        <!-- Wishlist -->
        <section class="mb-8">
            <h2 class="text-xl font-semibold mb-2">❤️ Wishlist</h2>
            <ul>
                <li
                    v-for="item in wishlist"
                    :key="item.id"
                    class="border p-2 rounded mb-2"
                >
                    {{ item.title }} - {{ item.brand?.name }} ({{
                        item.category?.name
                    }})
                </li>
            </ul>
        </section>

        <!-- Recently Viewed -->
        <section>
            <h2 class="text-xl font-semibold mb-2">👀 Recently Viewed</h2>
            <ul>
                <li
                    v-for="item in recentlyViewed"
                    :key="item.id"
                    class="border p-2 rounded mb-2"
                >
                    {{ item.title }} - {{ item.brand?.name }} ({{
                        item.category?.name
                    }})
                </li>
            </ul>
        </section>
    </div>
</template>
