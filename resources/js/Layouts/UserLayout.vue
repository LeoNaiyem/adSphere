<script setup>
import Logo from "@/Components/Logo.vue";
import { Link, usePage } from "@inertiajs/vue3";
import { onMounted, ref, watch } from "vue";

const { auth } = usePage().props;

// Sidebar states
const collapsed = ref(false);
const mobileOpen = ref(false);

// Persist collapse state
onMounted(() => {
  const saved = localStorage.getItem("user-sidebar-collapsed");
  if (saved !== null) collapsed.value = JSON.parse(saved);
});
watch(collapsed, (val) => {
  localStorage.setItem("user-sidebar-collapsed", JSON.stringify(val));
});

function toggleSidebar() {
  collapsed.value = !collapsed.value;
}
function toggleMobile() {
  mobileOpen.value = !mobileOpen.value;
}
</script>

<template>
  <div class="flex min-h-screen bg-gray-100">
    <!-- Sidebar -->
    <aside
      :class="[
        'bg-white shadow-md transition-all duration-300 fixed top-0 left-0 z-40 h-screen flex flex-col',
        collapsed ? 'w-20' : 'w-64',
        mobileOpen ? 'translate-x-0' : '-translate-x-full md:translate-x-0'
      ]"
    >
      <!-- Logo + Collapse -->
      <div class="flex items-center justify-between p-4 border-b">
        <Logo class="w-full" v-if="!collapsed"/>
        
        <!-- Desktop collapse -->
        <button @click="toggleSidebar" class="hidden md:block p-2 hover:bg-gray-100">
          <i :class="collapsed ? 'fa fa-chevron-right' : 'fa fa-chevron-left'"></i>
        </button>
        <!-- Mobile close -->
        <button @click="toggleMobile" class="md:hidden p-2 hover:bg-gray-100">
          <i class="fa fa-times"></i>
        </button>
      </div>

      <!-- Navigation -->
      <nav class="flex-1 mt-4 px-2 space-y-2 overflow-y-auto">
        <!-- Dashboard -->
        <Link
          :href="route('dashboard')"
          class="flex items-center px-3 py-2 rounded hover:bg-blue-100"
          :class="{ 'bg-blue-600 text-white': route().current('dashboard') }"
        >
          <i class="fa fa-home"></i>
          <span v-if="!collapsed" class="ml-2">Dashboard</span>
        </Link>

        <!-- Wishlist -->
        <Link
          :href="route('wishlist.index')"
          class="flex items-center px-3 py-2 rounded hover:bg-blue-100"
          :class="{ 'bg-blue-600 text-white': route().current('wishlist.*') }"
        >
          <i class="fa fa-heart"></i>
          <span v-if="!collapsed" class="ml-2">Wishlist</span>
        </Link>

        <!-- Recently Viewed -->
        <Link
          :href="route('recently-viewed.index')"
          class="flex items-center px-3 py-2 rounded hover:bg-blue-100"
          :class="{ 'bg-blue-600 text-white': route().current('recently-viewed.*') }"
        >
          <i class="fa fa-eye"></i>
          <span v-if="!collapsed" class="ml-2">Recently Viewed</span>
        </Link>

        <!-- Products -->
        <Link
          :href="route('products.index')"
          class="flex items-center px-3 py-2 rounded hover:bg-blue-100"
          :class="{ 'bg-blue-600 text-white': route().current('products.*') }"
        >
          <i class="fa fa-box"></i>
          <span v-if="!collapsed" class="ml-2">Products</span>
        </Link>
      </nav>
    </aside>

    <!-- Main Content Area -->
    <div :class="['flex-1 flex flex-col transition-all', collapsed ? 'md:ml-20' : 'md:ml-64']">
      <!-- Fixed Header -->
      <header class="fixed top-0 right-0 left-0 bg-white shadow px-6 py-[26px] flex justify-between items-center z-30"
        :class="collapsed ? 'md:ml-20' : 'md:ml-64'">
        <!-- Mobile sidebar toggle -->
        <button @click="toggleMobile" class="md:hidden p-2 hover:bg-gray-100">
          <i class="fa fa-bars"></i>
        </button>

        <span class="text-gray-700">Hi, {{ auth.user?.name }}</span>
        <div class="flex space-x-4">
          <Link :href="route('profile.edit')" class="text-sm hover:text-blue-600">Profile</Link>
          <Link method="post" as="button" :href="route('logout')" class="text-sm text-red-600">Logout</Link>
        </div>
      </header>

      <!-- Page Content -->
      <main class="flex-1 p-6 mt-16 mb-12 overflow-y-auto">
        <slot />
      </main>

      <!-- Fixed Footer -->
      <footer class="fixed bottom-0 right-0 left-0 bg-white shadow p-3 text-center text-sm text-gray-600 z-20"
        :class="collapsed ? 'md:ml-20' : 'md:ml-64'">
        © 2025 AdSphere
      </footer>
    </div>
  </div>
</template>
