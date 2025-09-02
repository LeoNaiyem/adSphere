<script setup>
import { useForm } from '@inertiajs/vue3';

defineProps({
  categories: Array,
  brands: Array,
});

const form = useForm({
  title: '',
  category_id: '',
  brand_id: '',
  price: '',
  condition: 'new',
  description: '',
  status: true,
  images: [],
  attributes: {}, // dynamic fields
});

function handleImages(e) {
  form.images = Array.from(e.target.files);
}

function submit() {
  form.post(route('products.store'));
}
</script>

<template>
  <div class="p-6 max-w-2xl mx-auto">
    <h1 class="text-2xl font-bold mb-4">➕ Create Product</h1>

    <form @submit.prevent="submit" class="space-y-4">
      <div>
        <label class="block mb-1">Title</label>
        <input v-model="form.title" type="text" class="border rounded w-full p-2" />
        <span class="text-red-500 text-sm" v-if="form.errors.title">{{ form.errors.title }}</span>
      </div>

      <div>
        <label class="block mb-1">Category</label>
        <select v-model="form.category_id" class="border rounded w-full p-2">
          <option v-for="c in categories" :value="c.id" :key="c.id">{{ c.name }}</option>
        </select>
      </div>

      <div>
        <label class="block mb-1">Brand</label>
        <select v-model="form.brand_id" class="border rounded w-full p-2">
          <option v-for="b in brands" :value="b.id" :key="b.id">{{ b.name }}</option>
        </select>
      </div>

      <div>
        <label class="block mb-1">Price</label>
        <input v-model="form.price" type="number" class="border rounded w-full p-2" />
      </div>

      <div>
        <label class="block mb-1">Condition</label>
        <select v-model="form.condition" class="border rounded w-full p-2">
          <option value="new">New</option>
          <option value="used">Used</option>
        </select>
      </div>

      <div>
        <label class="block mb-1">Description</label>
        <textarea v-model="form.description" class="border rounded w-full p-2"></textarea>
      </div>

      <div>
        <label class="inline-flex items-center">
          <input type="checkbox" v-model="form.status" class="mr-2" />
          Active
        </label>
      </div>

      <div>
        <label class="block mb-1">Images</label>
        <input type="file" multiple @change="handleImages" />
      </div>

      <!-- Example dynamic attributes -->
      <div>
        <label class="block mb-1">Attributes</label>
        <input v-model="form.attributes.Model" placeholder="Model" class="border rounded w-full p-2 mb-2" />
        <input v-model="form.attributes.Color" placeholder="Color" class="border rounded w-full p-2 mb-2" />
      </div>

      <button type="submit" class="bg-blue-600 text-white px-4 py-2 rounded">
        Save
      </button>
    </form>
  </div>
</template>
