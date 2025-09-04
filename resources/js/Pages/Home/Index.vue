<script setup>
import Container from "@/Components/Container.vue";
import ProductCard from "@/Components/ProductCard.vue";
import SearchBox from "@/Components/SearchBox.vue";
import Title from "@/Components/Title.vue";
import MainLayout from "@/Layouts/MainLayout.vue";

defineOptions({
    layout: MainLayout,
});
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

const products = [
    {
        id: 1,
        title: "Rim flanges 5x127 / 5x114.3 / 5x130 71.6 25mm 30mm 35mm 40mm 50mm",
        price: 30,
        image: "https://via.placeholder.com/300",
        location: "Sofia city, 7th 11th kilometer",
        updated: "Updated on September 03, 2025",
        hasDelivery: false,
    },
    {
        id: 2,
        title: "Boiler 70kW Pellets Wood",
        price: 5200,
        image: "https://via.placeholder.com/300",
        location: "Sofia, Buxton",
        updated: "September 02, 2025",
        hasDelivery: true,
    },
    {
        id: 3,
        title: "Canister 20 l./30 l./40 l./50 l./120 l.",
        price: 5.09,
        image: "https://via.placeholder.com/300",
        location: "Varna, Western Industrial Zone",
        updated: "Updated on September 1, 2025",
        hasDelivery: false,
    },
    {
        id: 4,
        title: "Facade frame scaffolding for rent",
        price: 1.9,
        image: "https://via.placeholder.com/300",
        location: "Sofia, Druzhba 1",
        updated: "Updated Today at 02:01 AM.",
        hasDelivery: true,
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
    <Head title="Home" />
    <Container class="bg-primary-50">
        <SearchBox class="bg-white" />
    </Container>
    <Container class="bg-white">
        <div class="max-w-screen-xl mx-auto px-4">
            <Title class="text-center mb-6 text-2xl font-semibold"
                >Main Categories</Title
            >
            <div
                class="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 lg:grid-cols-5 xl:grid-cols-7 gap-4 items-center justify-center"
            >
                <div
                    v-for="(category, index) in categories"
                    :key="index"
                    class="flex flex-col p-2 items-center justify-center text-center hover:shadow-md transition"
                >
                    <div
                        class="w-24 h-24 rounded-full bg-white overflow-hidden mb-1 border"
                    >
                        <img
                            :src="category.image"
                            alt="category image"
                            class="w-full h-full object-cover"
                        />
                    </div>
                    <h2
                        class="font-medium text-primary-900 px-2 mt-2 leading-tight"
                    >
                        {{ category.name }}
                    </h2>
                </div>
            </div>
        </div>
    </Container>
    <Container class="bg-primary-50">
        <Title class="text-center my-8 text-2xl font-semibold">
            Promo Ads
        </Title>
        <div
            class="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 gap-4 max-w-screen-xl mx-auto mt-10 px-4"
        >
            <ProductCard
                v-for="(product, index) in products"
                :key="index"
                :product="product"
                @click="goToProduct"
                @wishlist="handleWishlist"
            />
        </div>
    </Container>
</template>
