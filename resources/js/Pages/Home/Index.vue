<script setup>
import Container from "@/Components/Container.vue";
import ProductCard from "@/Components/ProductCard.vue";
import SearchBox from "@/Components/SearchBox.vue";
import Title from "@/Components/Title.vue";
import MainLayout from "@/Layouts/MainLayout.vue";

defineOptions({
    layout: MainLayout,
});

defineProps({products:Object, brands:Object});
const categories = [
    {
        name: "Sports, Books, Hobbies",
        image: "http://127.0.0.1:8000/storage/products/NkqHmZt9528PwndJTTGkJwxcZj310JSQo4mn5dMs.jpg",
    },
    {
        name: "Electronics",
        image: "http://127.0.0.1:8000/storage/products/NkqHmZt9528PwndJTTGkJwxcZj310JSQo4mn5dMs.jpg",
    },
    {
        name: "Vehicles",
        image: "http://127.0.0.1:8000/storage/products/NkqHmZt9528PwndJTTGkJwxcZj310JSQo4mn5dMs.jpg",
    },
    {
        name: "Home & Living",
        image: "http://127.0.0.1:8000/storage/products/NkqHmZt9528PwndJTTGkJwxcZj310JSQo4mn5dMs.jpg",
    },
    {
        name: "Jobs",
        image: "http://127.0.0.1:8000/storage/products/NkqHmZt9528PwndJTTGkJwxcZj310JSQo4mn5dMs.jpg",
    },
    {
        name: "Services",
        image: "http://127.0.0.1:8000/storage/products/NkqHmZt9528PwndJTTGkJwxcZj310JSQo4mn5dMs.jpg",
    },
    {
        name: "Pets & Animals",
        image: "http://127.0.0.1:8000/storage/products/NkqHmZt9528PwndJTTGkJwxcZj310JSQo4mn5dMs.jpg",
    },
    {
        name: "Fashion",
        image: "http://127.0.0.1:8000/storage/products/NkqHmZt9528PwndJTTGkJwxcZj310JSQo4mn5dMs.jpg",
    },
    {
        name: "Others",
        image: "http://127.0.0.1:8000/storage/products/NkqHmZt9528PwndJTTGkJwxcZj310JSQo4mn5dMs.jpg",
    },
];



function goToProduct(product) {
    console.log("Navigate to product:", product);
    // router.push(`/products/${product.id}`) — optionally use Vue Router
}

function handleWishlist({ product, wishlisted }) {
    console.log(
        `${wishlisted ? "Added to" : "Removed from"} wishlist:`,
        product
    );
}
</script>
<template>
    {{ 
console.log(brands)

     }}
    <Head title="Home" />
    <Container class="bg-primary-50 bg-opacity-60">
        <SearchBox class="bg-white" />
    </Container>
     <Container class="bg-gradient-to-b from-gray-50 to-white py-12">
        <div class="max-w-screen-xl mx-auto px-4">
            <!-- Section Title -->
            <h2 class="text-center text-3xl font-extrabold text-gray-800 mb-10">
                Trusted <span class="text-primary-600">Brands</span>
            </h2>

            <!-- Brand Grid -->
            <div
                class="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 lg:grid-cols-5 xl:grid-cols-7 gap-6"
            >
                <div
                    v-for="brand in brands"
                    :key="brand.id"
                    class="group flex flex-col items-center text-center"
                >
                    <!-- Logo Card -->
                    <div
                        class="relative w-32 h-32 flex items-center justify-center rounded-full bg-white shadow-md border border-gray-100 overflow-hidden transition-all duration-300 group-hover:scale-105 group-hover:shadow-xl"
                    >
                        <img
                            :src="brand.logo?`/storage/${brand.logo}`:'/storage/images/default-brand.jpg'"
                            :alt="brand.name"
                            class="w-24 h-24 object-cover rounded-full transition-transform duration-300 group-hover:scale-110"
                        />
                        <!-- subtle overlay -->
                        <div
                            class="absolute inset-0 bg-gradient-to-tr from-primary-500/10 to-transparent opacity-0 group-hover:opacity-100 transition"
                        ></div>
                    </div>

                    <!-- Brand Name -->
                    <h3
                        class="mt-3 text-sm font-semibold text-gray-700 group-hover:text-primary-600 transition"
                    >
                        {{ brand.name }}
                    </h3>
                </div>
            </div>
        </div>
    </Container>
    <Container class="bg-primary-50 bg-opacity-60">
        <Title class="text-center my-8 text-2xl font-semibold">
            Promo Ads
        </Title>
        <div
            class="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 gap-4 max-w-screen-xl mx-auto mt-10 px-4"
        >
            <ProductCard
                v-for="product in products"
                :key="product.id"
                :product="product"
                @click="goToProduct"
                @wishlist="handleWishlist"
            />
        </div>
    </Container>
</template>
