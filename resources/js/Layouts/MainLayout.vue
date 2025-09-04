<script setup>
import Footer from '@/Components/Footer.vue';
import Navbar from '@/Components/Navbar.vue';

const props = defineProps({
  title: String,
})
</script>

<template>
  <div class="flex flex-col min-h-screen">
    <!-- Navbar -->
    <Navbar />

    <!-- Main Content -->
    <main class="flex-grow bg-gray-50">
      <slot />
    </main>

    <!-- Footer -->
    <Footer />
  </div>
</template>
