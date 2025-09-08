<script setup>
import MainLayout from "@/Layouts/MainLayout.vue";
import { useForm } from "@inertiajs/vue3";

defineOptions({ layout: MainLayout });

const props = defineProps({
  product: Object,
  categories: Array,
  brands: Array,
});


const form = useForm({
  title: props.product.title,
  category_id: props.product.category_id,
  brand_id: props.product.brand_id,
  price: props.product.price,
  condition: props.product.condition,
  description: props.product.description,
  images: null, 
});

const submit = () => {
  form.post(route("products.update", props.product.id), {
    method: "put",
    forceFormData: true, 
    onSuccess: () => {
      alert("✅ Product updated successfully!");
    },
  });
};
</script>

<template>
  <div class="max-w-4xl mx-auto py-8 px-6">
    <h1 class="text-2xl font-bold mb-6">Edit Product</h1>

    <form @submit.prevent="submit" class="space-y-6">
      <!-- Title -->
      <div>
        <label class="block font-medium">Title</label>
        <input
          v-model="form.title"
          type="text"
          class="mt-1 block w-full border rounded p-2"
        />
        <div v-if="form.errors.title" class="text-red-600 text-sm">
          {{ form.errors.title }}
        </div>
      </div>

      <!-- Category -->
      <div>
        <label class="block font-medium">Category</label>
        <select
          v-model="form.category_id"
          class="mt-1 block w-full border rounded p-2"
        >
          <option value="">-- Select --</option>
          <option v-for="cat in categories" :key="cat.id" :value="cat.id">
            {{ cat.name }}
          </option>
        </select>
        <div v-if="form.errors.category_id" class="text-red-600 text-sm">
          {{ form.errors.category_id }}
        </div>
      </div>

      <!-- Brand -->
      <div>
        <label class="block font-medium">Brand</label>
        <select
          v-model="form.brand_id"
          class="mt-1 block w-full border rounded p-2"
        >
          <option value="">-- Select --</option>
          <option v-for="brand in brands" :key="brand.id" :value="brand.id">
            {{ brand.name }}
          </option>
        </select>
        <div v-if="form.errors.brand_id" class="text-red-600 text-sm">
          {{ form.errors.brand_id }}
        </div>
      </div>

      <!-- Price -->
      <div>
        <label class="block font-medium">Price</label>
        <input
          v-model="form.price"
          type="number"
          step="0.01"
          class="mt-1 block w-full border rounded p-2"
        />
        <div v-if="form.errors.price" class="text-red-600 text-sm">
          {{ form.errors.price }}
        </div>
      </div>

      <!-- Condition -->
      <div>
        <label class="block font-medium">Condition</label>
        <select v-model="form.condition" class="mt-1 block w-full border rounded p-2">
          <option value="new">New</option>
          <option value="used">Used</option>
        </select>
        <div v-if="form.errors.condition" class="text-red-600 text-sm">
          {{ form.errors.condition }}
        </div>
      </div>

      <!-- Description -->
      <div>
        <label class="block font-medium">Description</label>
        <textarea
          v-model="form.description"
          rows="5"
          class="mt-1 block w-full border rounded p-2"
        ></textarea>
        <div v-if="form.errors.description" class="text-red-600 text-sm">
          {{ form.errors.description }}
        </div>
      </div>

      <!-- Images -->
      <div>
        <label class="block font-medium">Upload New Images</label>
        <input
          type="file"
          multiple
          @change="(e) => (form.images = e.target.files)"
          class="mt-1 block w-full border"
        />
        <div v-if="form.errors.images" class="text-red-600 text-sm">
          {{ form.errors.images }}
        </div>
      </div>

      <!-- Submit -->
      <button
        type="submit"
        class="bg-primary-600 text-white px-6 py-2 rounded hover:bg-primary-700"
        :disabled="form.processing"
      >
        Save Changes
      </button>
    </form>
  </div>
</template>
