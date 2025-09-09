<script setup>
import AdminLayout from '@/Layouts/AdminLayout.vue';
import { useForm } from '@inertiajs/vue3';

defineOptions({ layout: AdminLayout });

const form = useForm({
  name: '',
  description: '',
  logo: null,
});

function submit() {
  form.post(route('brands.store'));
}
</script>

<template>
  <div class="p-6 max-w-lg mx-auto">
    <h1 class="text-2xl font-bold mb-4">➕ Create Brand</h1>

    <form @submit.prevent="submit" class="space-y-4">
      <div>
        <label class="block mb-1">Name</label>
        <input v-model="form.name" type="text" class="border rounded w-full p-2" />
        <span class="text-red-500 text-sm" v-if="form.errors.name">{{ form.errors.name }}</span>
      </div>

      <div>
        <label class="block mb-1">Description</label>
        <textarea v-model="form.description" class="border rounded w-full p-2"></textarea>
      </div>

      <div>
        <label class="block mb-1">Logo</label>
        <input type="file" @change="e => form.logo = e.target.files[0]" />
      </div>

      <button type="submit" class="bg-primary-600 text-white px-4 py-2 rounded">
        Save
      </button>
    </form>
  </div>
</template>
