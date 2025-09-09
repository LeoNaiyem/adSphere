<script setup>
import AdminLayout from "@/Layouts/AdminLayout.vue";
import { Link, useForm } from "@inertiajs/vue3";

defineOptions({ layout: AdminLayout });

const props = defineProps({
  category: { type: Object, default: null }, // null for create, object for edit
  categories: { type: Array, default: () => [] }, // list of categories for parent dropdown
});

const form = useForm({
  parent_id: props.category?.parent_id || null,
  name: props.category?.name || "",
  slug: props.category?.slug || "",
  status: props.category?.status ?? 1,
});

function submit() {
  if (props.category) {
    form.put(route("categories.update", props.category.id), { method: "put" });
  } else {
    form.post(route("categories.store"));
  }
}
</script>

<template>
  <Head :title="category ? 'Edit Category' : 'Create Category'" />

  <div class="p-6  space-y-6">
    <!-- Breadcrumb -->
    <nav class="flex items-center text-sm text-gray-500 space-x-2">
      <Link :href="route('dashboard')" class="hover:text-primary-600 flex items-center">
        <i class="fas fa-home mr-1 text-primary-500"></i> Dashboard
      </Link>
      <span>/</span>
      <Link :href="route('categories.index')" class="hover:text-primary-600 flex items-center">
        <i class="fas fa-layer-group mr-1 text-primary-500"></i> Categories
      </Link>
      <span>/</span>
      <span class="font-semibold text-gray-700">
        {{ category ? "Edit" : "Create" }}
      </span>
    </nav>

    <!-- Header -->
    <h1 class="text-2xl font-bold text-gray-800 flex items-center">
      <i class="fas fa-layer-group mr-2 text-primary-600"></i>
      {{ category ? "Edit Category" : "Create Category" }}
    </h1>

    <!-- Form Card -->
    <form
      @submit.prevent="submit"
      class="bg-white shadow max-w-2xl mx-auto rounded-xl p-6 space-y-5"
    >
      <!-- Parent Category -->
      <div>
        <label class="block mb-1 font-medium">Parent Category</label>
        <select
          v-model="form.parent_id"
          class="border rounded-lg w-full p-2 focus:ring focus:ring-primary-200"
        >
          <option :value="null">None</option>
          <option
            v-for="cat in categories"
            :key="cat.id"
            :value="cat.id"
          >
            {{ cat.name }}
          </option>
        </select>
        <span v-if="form.errors.parent_id" class="text-red-500 text-sm">
          {{ form.errors.parent_id }}
        </span>
      </div>

      <!-- Name -->
      <div>
        <label class="block mb-1 font-medium">Name</label>
        <input
          v-model="form.name"
          type="text"
          class="border rounded-lg w-full p-2 focus:ring focus:ring-primary-200"
        />
        <span v-if="form.errors.name" class="text-red-500 text-sm">
          {{ form.errors.name }}
        </span>
      </div>

      <!-- Slug -->
      <div>
        <label class="block mb-1 font-medium">Slug</label>
        <input
          v-model="form.slug"
          type="text"
          class="border rounded-lg w-full p-2 focus:ring focus:ring-primary-200"
        />
        <span v-if="form.errors.slug" class="text-red-500 text-sm">
          {{ form.errors.slug }}
        </span>
      </div>

      <!-- Status -->
      <div>
        <label class="block mb-1 font-medium">Status</label>
        <select
          v-model="form.status"
          class="border rounded-lg w-full p-2 focus:ring focus:ring-primary-200"
        >
          <option :value="1">Active</option>
          <option :value="0">Inactive</option>
        </select>
        <span v-if="form.errors.status" class="text-red-500 text-sm">
          {{ form.errors.status }}
        </span>
      </div>

      <!-- Submit -->
      <div class="flex items-center justify-end">
        <button
          type="submit"
          class="bg-primary-600 text-sm hover:bg-primary-700 text-white px-4 py-2 rounded-lg shadow font-medium"
          :disabled="form.processing"
        >
          <i class="fas fa-save mr-1"></i>
          {{ category ? "Update Category" : "Save Category" }}
        </button>
      </div>
    </form>
  </div>
</template>
