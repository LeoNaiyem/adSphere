<script setup>
defineProps({ categories: Object });
</script>

<template>
  <div class="p-6">
    <h1 class="text-2xl font-bold mb-4">📂 Categories</h1>

    <table class="w-full border">
      <thead class="bg-gray-100">
        <tr>
          <th class="p-2">Name</th>
          <th class="p-2">Slug</th>
          <th class="p-2">Status</th>
          <th class="p-2">Actions</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="cat in categories.data" :key="cat.id" class="border-t">
          <td class="p-2">{{ cat.name }}</td>
          <td class="p-2">{{ cat.slug }}</td>
          <td class="p-2">{{ cat.status ? 'Active' : 'Inactive' }}</td>
          <td class="p-2">
            <Link :href="route('categories.edit', cat.id)" class="text-blue-600">Edit</Link>
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</template>
