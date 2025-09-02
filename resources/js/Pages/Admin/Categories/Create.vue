<script setup>
import { useForm } from '@inertiajs/vue3';

const form = useForm({
  parent_id: null,
  name: '',
  slug: '',
  status: true,
});

function submit() {
  form.post(route('categories.store'));
}
</script>

<template>
  <div class="p-6 max-w-lg mx-auto">
    <h1 class="text-2xl font-bold mb-4">➕ Create Category</h1>

    <form @submit.prevent="submit" class="space-y-4">
      <div>
        <label class="block mb-1">Name</label>
        <input v-model="form.name" type="text" class="border rounded w-full p-2" />
        <span class="text-red-500 text-sm" v-if="form.errors.name">{{ form.errors.name }}</span>
      </div>

      <div>
        <label class="block mb-1">Slug</label>
        <input v-model="form.slug" type="text" class="border rounded w-full p-2" />
        <span class="text-red-500 text-sm" v-if="form.errors.slug">{{ form.errors.slug }}</span>
      </div>

      <div>
        <label class="inline-flex items-center">
          <input type="checkbox" v-model="form.status" class="mr-2" />
          Active
        </label>
      </div>

      <button type="submit" class="bg-blue-600 text-white px-4 py-2 rounded">
        Save
      </button>
    </form>
  </div>
</template>
