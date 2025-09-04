<script setup>
import { ref } from 'vue';

const selectedDivision = ref('')

const divisions = [
  'Dhaka',
  'Chattogram',
  'Rajshahi',
  'Khulna',
  'Barisal',
  'Sylhet',
  'Rangpur',
  'Mymensingh'
]
</script>

<template>
  <form
    class="flex rounded-md shadow-sm overflow-hidden border border-gray-200 w-full max-w-6xl items-center mx-auto"
  >
    <!-- Search input -->
    <div class="flex items-center px-4 py-3 w-2/3 border-r border-gray-200">
      <i class="fas fa-search text-primary-900 mr-2 text-2xl"></i>
      <input
        type="text"
        placeholder="What are you looking for?"
        class="w-full text-primary-900 placeholder:text-primary-900 border-none focus:ring-0 focus:outline-none"
      />
    </div>

    <!-- Right section: location + button -->
    <div class="flex w-1/3 h-full">
      <!-- Location dropdown -->
      <div class="flex items-center px-4 py-3 w-full border-r border-gray-200">
        <i class="fas fa-map-marker-alt text-primary-900 mr-2 text-xl"></i>
        <select
          v-model="selectedDivision"
          class="w-full bg-transparent border-none text-sm text-primary-900 focus:ring-0 focus:outline-none appearance-none"
        >
          <option value="">The whole country</option>
          <option v-for="division in divisions" :key="division" :value="division">
            {{ division }}
          </option>
        </select>
      </div>

      <!-- Search button (full height) -->
      <button
        type="submit"
        class="flex items-center py-5 justify-center px-6 bg-primary-900 text-white font-semibold hover:bg-primary-800 transition"
      >
        <span class="mr-2">Search</span>
        <i class="fas fa-search"></i>
      </button>
    </div>
  </form>
</template>

