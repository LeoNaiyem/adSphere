<script setup>
import { Link, usePage } from "@inertiajs/vue3";
import ChatIcon from "./ChatIcon.vue";
import LogoWhite from "./LogoWhite.vue";
import Tooltip from "./Tooltip.vue";
import WishlistIcon from "./WishlistIcon.vue";

const { auth } = usePage().props;
</script>

<template>
    <nav class="bg-primary-900 text-white shadow">
        <div class="max-w-screen-2xl mx-auto px-4 sm:px-6 lg:px-8">
            <div class="flex justify-between h-20 items-center">
                <!-- Logo -->
                <div class="flex-shrink-0">
                    <Link href="/" class="text-2xl font-bold text-blue-600">
                        <LogoWhite />
                    </Link>
                </div>

                <!-- Navigation Links -->
                <div class="hidden md:flex space-x-6">
                    <!-- Common Links -->
                    <Link href="/" class="hover:text-primary-300">Home</Link>

                    <!-- User Links -->
                    <template v-if="auth.user && auth.user.role !== 'admin'">
                        <Link
                            :href="route('wishlist.index')"
                            class="hover:text-primary-300"
                            >Wishlist</Link
                        >
                        <Link
                            :href="route('recently-viewed.index')"
                            class="hover:text-primary-300"
                            >Recently Viewed</Link
                        >
                        <Link
                            :href="route('dashboard')"
                            class="hover:text-primary-300"
                            >Dashboard</Link
                        >
                    </template>

                    <!-- Admin Links -->
                    <template v-if="auth.user && auth.user.role === 'admin'">
                        <Link
                            :href="route('dashboard')"
                            class="hover:text-primary-300"
                            >Admin Dashboard</Link
                        >
                        <Link
                            :href="route('categories.index')"
                            class="hover:text-primary-300"
                            >Categories</Link
                        >
                        <Link
                            :href="route('brands.index')"
                            class="hover:text-primary-300"
                            >Brands</Link
                        >
                        <Link
                            :href="route('products.index')"
                            class="hover:text-primary-300"
                            >Products</Link
                        >
                    </template>
                </div>

                <!-- User Menu -->
                <div class="flex items-center gap-5">
                    <!-- Common -->
                    <div class="flex space-x-5 items-center">
                        <Tooltip text="Chat">
                            <Link
                                :href="route('wishlist.index')"
                                class="hover:text-primary-300 flex gap-1 items-center font-bold"
                            >
                                <ChatIcon />
                            </Link>
                        </Tooltip>
                        <Tooltip text="Wishlist">
                            <Link
                                :href="route('wishlist.index')"
                                class="hover:text-primary-300 flex gap-1 items-center font-bold"
                            >
                                <WishlistIcon />
                            </Link>
                        </Tooltip>
                    </div>
                    <div v-if="!auth.user">
                        <div class="flex space-x-5">
                            <Link
                                :href="route('login')"
                                class=" hover:text-primary-300"
                                >Login</Link
                            >
                            <Link
                                :href="route('register')"
                                class=" hover:text-primary-300"
                                >Register</Link
                            >
                        </div>
                    </div>
                    <div v-else>
                        <div class="flex items-center space-x-5">
                            <Tooltip text="Dashboard">
                                <Link
                                    :href="route('dashboard')"
                                    class="hover:text-primary-300 flex gap-1 items-center font-bold"
                                >
                                    <i class="fa-regular fa-bell text-xl"></i>
                                </Link>
                            </Tooltip>
                            <Tooltip text="Profile">
                                <Link
                                    :href="route('profile.edit')"
                                    class="hover:text-primary-300 flex gap-1 items-center font-bold"
                                >
                                    <i class="fa-regular fa-user text-xl"></i>
                                </Link>
                            </Tooltip>
                            <span
                                class="hover:text-primary-300 flex gap-1 items-center font-bold"
                                >Hi, {{ auth.user.name }}
                            </span>

                            <Link
                                method="post"
                                as="button"
                                :href="route('logout')"
                                class="inline-flex items-center gap-2 rounded-md border border-red-600 px-4 py-2 text-sm font-semibold text-red-600 hover:bg-red-600 hover:text-white focus:outline-none focus:ring-2 focus:ring-red-500 focus:ring-offset-1 transition"
                            >
                                Logout
                            </Link>
                        </div>
                    </div>

                    <!-- Add Ad -->
                    <Link
                        :href="route('products.create')"
                        class="inline-flex items-center text-sm font-medium bg-primary-600 text-white px-4 py-2 rounded-md border border-transparent hover:bg-white hover:text-primary-300 hover:border-primary-600 transition"
                    >
                        Add Ad
                    </Link>
                </div>
            </div>
        </div>
    </nav>
</template>
