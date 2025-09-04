<script setup>
defineProps({
  text: String,
});
</script>

<template>
  <div class="relative group">
    <slot />
    <div
      class="absolute right-0 bottom-full translate-x-1/3
             hidden group-hover:flex px-2 py-1 bg-white text-primary-900 text-xs rounded shadow-lg whitespace-nowrap z-50"
    >
      {{ text }}
    </div>
  </div>
</template>
