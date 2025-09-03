<script setup>
import { Link, usePage } from "@inertiajs/vue3";

const { auth } = usePage().props;
</script>

<template>
  <nav class="bg-white shadow mb-6">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
      <div class="flex justify-between h-16 items-center">
        <!-- Logo -->
        <div class="flex-shrink-0">
          <Link href="/" class="text-2xl font-bold text-blue-600">AdSphere</Link>
        </div>

        <!-- Navigation Links -->
        <div class="hidden md:flex space-x-6">
          <Link href="/" class="hover:text-blue-600">Home</Link>
          <Link v-if="auth.user" :href="route('wishlist.index')" class="hover:text-blue-600">Wishlist</Link>
          <Link v-if="auth.user" :href="route('recently-viewed.index')" class="hover:text-blue-600">Recently Viewed</Link>
          <Link v-if="auth.user" :href="route('dashboard')" class="hover:text-blue-600">Dashboard</Link>
        </div>

        <!-- User Menu -->
        <div>
          <template v-if="auth.user">
            <div class="flex items-center space-x-4">
              <span class="text-gray-700">Hi, {{ auth.user.name }}</span>
              <Link
                :href="route('profile.edit')"
                class="text-sm text-gray-600 hover:text-blue-600"
              >
                Profile
              </Link>
              <Link
                method="post"
                as="button"
                :href="route('logout')"
                class="text-sm text-red-600"
              >
                Logout
              </Link>
            </div>
          </template>
          <template v-else>
            <div class="flex space-x-4">
              <Link :href="route('login')" class="text-sm hover:text-blue-600">Login</Link>
              <Link :href="route('register')" class="text-sm hover:text-blue-600">Register</Link>
            </div>
          </template>
        </div>
      </div>
    </div>
  </nav>
</template>
