<script setup>
import ErrorMessages from '@/Components/ErrorMessages.vue';
import { useForm } from '@inertiajs/vue3';
import { ref } from 'vue';
// const { errors } = usePage().props;
// console.log(errors);

const props = defineProps({
  categories: Array,
  brands: Array,
})

// Form
const form = useForm({
  title: '',
  category_id: '',
  brand_id: '',
  price: '',
  condition: 'new',
  status:1,
  description: '',
  attributes: {},
  images: [],
})


// Local preview for images
const previews = ref([])

const handleFiles = (event) => {
  form.images = event.target.files
  previews.value = Array.from(event.target.files).map(file =>
    URL.createObjectURL(file)
  )
}

const submit = () => {
  form.post(route('products.store'), {
    forceFormData: true,
  })
}
</script>

<template>
  <Head title="Create | Ad"/>
  
  <div class="max-w-5xl mx-auto bg-white p-6 rounded-xl shadow-md">
    <h1 class="text-2xl font-bold mb-6">Create Product</h1>
    <ErrorMessages :errors="form.errors"/>
    <form @submit.prevent="submit" class="space-y-6" enctype="multipart/form-data">
      <!-- Title -->
      <div>
        <label class="block text-sm font-medium mb-1">Title</label>
        <input v-model="form.title" type="text" class="w-full border rounded-lg p-2" placeholder="Product title" />
        <div v-if="form.errors.title" class="text-red-500 text-sm">{{ form.errors.title }}</div>
      </div>

      <!-- Category -->
      <div>
        <label class="block text-sm font-medium mb-1">Category</label>
        <select v-model="form.category_id" class="w-full border rounded-lg p-2">
          <option value="">-- Select Category --</option>
          <option v-for="c in categories" :key="c.id" :value="c.id">{{ c.name }}</option>
        </select>
        <div v-if="form.errors.category_id" class="text-red-500 text-sm">{{ form.errors.category_id }}</div>
      </div>

      <!-- Brand -->
      <div>
        <label class="block text-sm font-medium mb-1">Brand</label>
        <select v-model="form.brand_id" class="w-full border rounded-lg p-2">
          <option value="">-- Select Brand --</option>
          <option v-for="b in brands" :key="b.id" :value="b.id">{{ b.name }}</option>
        </select>
        <div v-if="form.errors.brand_id" class="text-red-500 text-sm">{{ form.errors.brand_id }}</div>
      </div>

      <!-- Price & Condition -->
      <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
        <div>
          <label class="block text-sm font-medium mb-1">Price</label>
          <input v-model="form.price" type="number" class="w-full border rounded-lg p-2" placeholder="Price" />
          <div v-if="form.errors.price" class="text-red-500 text-sm">{{ form.errors.price }}</div>
        </div>
        <div>
          <label class="block text-sm font-medium mb-1">Condition</label>
          <select v-model="form.condition" class="w-full border rounded-lg p-2">
            <option value="new">New</option>
            <option value="used">Used</option>
          </select>
          <div v-if="form.errors.condition" class="text-red-500 text-sm">{{ form.errors.condition }}</div>
        </div>
      </div>

      <!-- Description -->
      <div>
        <label class="block text-sm font-medium mb-1">Description</label>
        <textarea v-model="form.description" class="w-full border rounded-lg p-2" rows="4" placeholder="Product description"></textarea>
        <div v-if="form.errors.description" class="text-red-500 text-sm">{{ form.errors.description }}</div>
      </div>

      <!-- Attributes -->
    <div v-if="Object.keys(form.attributes).length">
      <div v-for="(val, key) in form.attributes" :key="key">
        <label>{{ key }}</label>
        <input v-model="form.attributes[key]" type="text" class="input" />
      </div>
    </div>

      <!-- Image Upload -->
      <div>
        <label class="block text-sm font-medium mb-1">Product Images</label>
        <input type="file" multiple @change="handleFiles" class="w-full border rounded-lg p-2" />
        <div class="grid grid-cols-2 md:grid-cols-4 gap-4 mt-4">
          <div v-for="(src, i) in previews" :key="i" class="relative">
            <img :src="src" class="w-full h-32 object-cover rounded-lg shadow" />
          </div>
        </div>
        <div v-if="form.errors.images" class="text-red-500 text-sm">{{ form.errors.images }}</div>
      </div>

      <!-- Submit -->
      <div class="flex justify-end">
        <button type="submit" 
          class="px-6 py-2 bg-blue-600 text-white font-semibold rounded-lg shadow hover:bg-blue-700 transition">
          Save Product
        </button>
      </div>
    </form>
  </div>
</template>
