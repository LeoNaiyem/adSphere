<script setup>
import Footer from '@/Components/Footer.vue';
import Navbar from '@/Components/Navbar.vue';
import Toast from "@/Components/Toast.vue";
import { usePage } from "@inertiajs/vue3";
import { ref, watch } from "vue";

const page = usePage();

// Toast state
const toastShow = ref(false);
const toastMessage = ref("");
const toastType = ref("success");

// React when flash changes
watch(
  () => page.props.flash,
  (flash) => {
    if (flash?.success) {
      toastMessage.value = flash.success;
      toastType.value = "success";
      toastShow.value = true;
    }
    if (flash?.error) {
      toastMessage.value = flash.error;
      toastType.value = "error";
      toastShow.value = true;
    }
  },
  { immediate: true }
);
</script>

<template>
  <div class="flex flex-col min-h-screen">
    <!-- Navbar -->
    <Navbar />

    <!-- Main Content -->
    <main class="flex-grow bg-gray-50">
      <slot />
    </main>

    <!-- Toast Notification -->
    <Toast
      :show="toastShow"
      :message="toastMessage"
      :type="toastType"
      @close="toastShow = false"
    />

    <!-- Footer -->
    <Footer />
  </div>
</template>
