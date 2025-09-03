<script setup>
defineProps({
  text: String,
});
</script>

<template>
  <div class="relative group">
    <slot />
    <div
      class="absolute left-full top-1/2 -translate-y-1/2 ml-2
             hidden group-hover:flex px-2 py-1 bg-gray-800 text-white text-xs rounded shadow-lg whitespace-nowrap z-50"
    >
      {{ text }}
    </div>
  </div>
</template>
