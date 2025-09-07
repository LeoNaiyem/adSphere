<script setup>
import Logo from "@/Components/Logo.vue";
import { Link, usePage } from "@inertiajs/vue3";
import { onMounted, ref, watch } from "vue";

const { auth } = usePage().props;

// Sidebar states
const collapsed = ref(false);
const mobileOpen = ref(false);

// Dropdowns
const categoryOpen = ref(false);
const brandOpen = ref(false);
const productOpen = ref(false);

// Auto-expand dropdowns if current route matches
onMounted(() => {
  if (route().current("categories.*")) categoryOpen.value = true;
  if (route().current("brands.*")) brandOpen.value = true;
  if (route().current("products.*")) productOpen.value = true;

  // Load collapsed state from localStorage
  const saved = localStorage.getItem("sidebar-collapsed");
  if (saved !== null) collapsed.value = JSON.parse(saved);
});

// Persist collapse state
watch(collapsed, (val) => {
  localStorage.setItem("sidebar-collapsed", JSON.stringify(val));
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
        <Link href="/">
          <Logo class="w-full hover:scale-105 transition-all duration-100" v-if="!collapsed"/>
        </Link>
        
        <!-- Desktop collapse -->
        <button @click="toggleSidebar" class="hidden md:block p-2 hover:bg-gray-100 hover:text-primary-900">
          <i :class="!collapsed ? 'fa fa-chevron-left' : 'fa-solid fa-bars-staggered text-xl'"></i>
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
          class="flex items-center px-3 py-2 rounded hover:bg-primary-100"
          :class="{ 'bg-primary-900 text-white': route().current('dashboard') }"
        >
          <i class="fa fa-chart-pie"></i>
          <span v-if="!collapsed" class="ml-2">Dashboard</span>
        </Link>

        <!-- Categories -->
        <div>
          <button
            @click="categoryOpen = !categoryOpen"
            class="w-full flex items-center justify-between px-3 py-2 rounded hover:bg-primary-100"
          >
            <div class="flex items-center">
              <i class="fa fa-folder"></i>
              <span v-if="!collapsed" class="ml-2">Categories</span>
            </div>
            <span v-if="!collapsed">
              <i :class="categoryOpen ? 'fa fa-chevron-up' : 'fa fa-chevron-down'"></i>
            </span>
          </button>
          <div v-show="categoryOpen && !collapsed" class="ml-6 mt-1 space-y-1">
            <Link
              :href="route('categories.create')"
              class="block px-3 py-1 rounded hover:bg-primary-100"
              :class="{ 'bg-primary-900 text-white': route().current('categories.create') }"
            >
              ➕ Create
            </Link>
            <Link
              :href="route('categories.index')"
              class="block px-3 py-1 rounded hover:bg-primary-100"
              :class="{ 'bg-primary-900 text-white': route().current('categories.index') }"
            >
              📂 Manage
            </Link>
          </div>
        </div>

        <!-- Brands -->
        <div>
          <button
            @click="brandOpen = !brandOpen"
            class="w-full flex items-center justify-between px-3 py-2 rounded hover:bg-primary-100"
          >
            <div class="flex items-center">
              <i class="fa fa-tags"></i>
              <span v-if="!collapsed" class="ml-2">Brands</span>
            </div>
            <span v-if="!collapsed">
              <i :class="brandOpen ? 'fa fa-chevron-up' : 'fa fa-chevron-down'"></i>
            </span>
          </button>
          <div v-show="brandOpen && !collapsed" class="ml-6 mt-1 space-y-1">
            <Link
              :href="route('brands.create')"
              class="block px-3 py-1 rounded hover:bg-primary-100"
              :class="{ 'bg-primary-900 text-white': route().current('brands.create') }"
            >
              ➕ Create
            </Link>
            <Link
              :href="route('brands.index')"
              class="block px-3 py-1 rounded hover:bg-primary-100"
              :class="{ 'bg-primary-900 text-white': route().current('brands.index') }"
            >
              🏷 Manage
            </Link>
          </div>
        </div>

        <!-- Products -->
        <div>
          <button
            @click="productOpen = !productOpen"
            class="w-full flex items-center justify-between px-3 py-2 rounded hover:bg-primary-100"
          >
            <div class="flex items-center">
              <i class="fa fa-box"></i>
              <span v-if="!collapsed" class="ml-2">Products</span>
            </div>
            <span v-if="!collapsed">
              <i :class="productOpen ? 'fa fa-chevron-up' : 'fa fa-chevron-down'"></i>
            </span>
          </button>
          <div v-show="productOpen && !collapsed" class="ml-6 mt-1 space-y-1">
            <Link
              :href="route('products.create')"
              class="block px-3 py-1 rounded hover:bg-primary-100"
              :class="{ 'bg-primary-900 text-white': route().current('products.create') }"
            >
              ➕ Create
            </Link>
            <Link
              :href="route('dashboard.products')"
              class="block px-3 py-1 rounded hover:bg-primary-100"
              :class="{ 'bg-primary-900 text-white': route().current('products.index') }"
            >
              📦 Manage
            </Link>
          </div>
        </div>
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
          <Link :href="route('profile.edit')" class="text-sm hover:text-primary-600">Profile</Link>
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
        © 2025 AdSphere Admin Panel
      </footer>
    </div>
  </div>
</template>
