<script setup>
import { Link } from '@inertiajs/vue3'

const props = defineProps({
  links: { type: Array, required: true }, // paginator links
  from: { type: Number, required: true }, // first item number
  to: { type: Number, required: true },   // last item number
  total: { type: Number, required: true } // total items
})

// Replace labels for Previous / Next
const formatLabel = (label) => {
  if (label.includes('Previous')) {
    return `<i class="fas fa-angle-left"></i>`
  }
  if (label.includes('Next')) {
    return `<i class="fas fa-angle-right"></i>`
  }
  return label
}
</script>

<template>
  <div v-if="links.length > 3" class="mt-6 flex flex-col sm:flex-row sm:items-center sm:justify-between">
    
    <!-- Pagination links -->
    <div class="flex items-center space-x-1">
      <Link
        v-for="(link, index) in links"
        :key="index"
        :href="link.url || ''"
        v-html="formatLabel(link.label)"
        class="w-8 justify-center h-8 border rounded-full flex items-center text-sm"
        :class="[
          link.active ? 'bg-primary-600 text-white border-primary-600' : 'hover:bg-gray-100',
          !link.url ? 'cursor-not-allowed text-gray-400' : ''
        ]"
      />
    </div>
    <!-- Showing result count -->
    <div class="text-sm text-gray-600 mb-3 sm:mb-0">
      Showing <span class="font-semibold">{{ from }}</span> 
      to <span class="font-semibold">{{ to }}</span> 
      of <span class="font-semibold">{{ total }}</span> results
    </div>
  </div>
</template>
