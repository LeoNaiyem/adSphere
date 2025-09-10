<script setup>
import { ref, watch } from "vue";
import AdminLayout from "@/Layouts/AdminLayout.vue";
import { Link, useForm } from "@inertiajs/vue3";

defineOptions({ layout: AdminLayout });

const props = defineProps({
  brand: { type: Object, default: null },
});

const form = useForm({
  name: props.brand?.name || "",
  description: props.brand?.description || "",
  logo: null, // file field
  _method: props.brand ? "PUT" : "POST",
});

// --- Preview state
const previewLogo = ref(props.brand?.logo ? `/storage/${props.brand.logo}` : null);

// Watch for file changes
watch(
  () => form.logo,
  (file) => {
    if (file instanceof File) {
      previewLogo.value = URL.createObjectURL(file);
    } else if (props.brand?.logo) {
      previewLogo.value = `/storage/${props.brand.logo}`;
    } else {
      previewLogo.value = null;
    }
  }
);

// Remove/reset logo
function removeLogo() {
  form.logo = null;
  previewLogo.value = props.brand?.logo ? `/storage/${props.brand.logo}` : null;
}

// Submit handler
function submit() {
  // Build payload manually
  const payload = {
    name: form.name,
    description: form.description,
    _method: props.brand ? "PUT" : "POST",
  };

  // ✅ Only add logo if user selected a new file
  if (form.logo && form.logo instanceof File) {
    payload.logo = form.logo;
  }

  const url = props.brand
    ? route("brands.update", props.brand.id)
    : route("brands.store");

  form.post(url, {
    preserveScroll: true,
    forceFormData: true,
    data: payload,
    onSuccess: () => form.reset("logo"),
  });
}


</script>

<template>
  <Head :title="brand ? 'Edit Brand' : 'Create Brand'" />

  <div class="p-6 space-y-6">
    <!-- Breadcrumb -->
    <nav class="flex items-center text-sm text-gray-500 space-x-2">
      <Link :href="route('dashboard')" class="hover:text-primary-600 flex items-center">
        <i class="fas fa-home mr-1 text-primary-500"></i> Dashboard
      </Link>
      <span>/</span>
      <Link :href="route('brands.index')" class="hover:text-primary-600 flex items-center">
        <i class="fas fa-tags mr-1 text-primary-500"></i> Brands
      </Link>
      <span>/</span>
      <span class="font-semibold text-gray-700">
        {{ brand ? "Edit" : "Create" }}
      </span>
    </nav>

    <!-- Header -->
    <h1 class="text-2xl font-bold text-gray-800 flex items-center">
      <i class="fas fa-tags mr-2 text-primary-600"></i>
      {{ brand ? "Edit Brand" : "Create Brand" }}
    </h1>

    <!-- Form Card -->
    <form
      @submit.prevent="submit"
      class="bg-white shadow max-w-2xl mx-auto rounded-xl p-6 space-y-5"
    >
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

      <!-- Description -->
      <div>
        <label class="block mb-1 font-medium">Description</label>
        <textarea
          v-model="form.description"
          rows="3"
          class="border rounded-lg w-full p-2 focus:ring focus:ring-primary-200"
        ></textarea>
        <span v-if="form.errors.description" class="text-red-500 text-sm">
          {{ form.errors.description }}
        </span>
      </div>

      <!-- Logo -->
      <div>
        <label class="block mb-1 font-medium">Logo</label>
        <input
          type="file"
          accept="image/*"
          @change="e => form.logo = e.target.files[0]"
          class="block w-full text-sm text-gray-600 border rounded-lg p-2"
        />
        <span v-if="form.errors.logo" class="text-red-500 text-sm">
          {{ form.errors.logo }}
        </span>

        <!-- Preview -->
        <div v-if="previewLogo" class="mt-3 relative inline-block">
          <img
            :src="previewLogo"
            alt="Brand Logo Preview"
            class="h-20 rounded shadow border"
          />
          <!-- Remove button -->
          <button
            type="button"
            @click="removeLogo"
            class="absolute -top-2 -right-2 bg-red-500 hover:bg-red-600 text-white rounded-full w-6 h-6 flex items-center justify-center shadow"
            title="Remove logo"
          >
            <i class="fas fa-times text-xs"></i>
          </button>
        </div>
      </div>

      <!-- Submit -->
      <div class="flex items-center justify-end gap-2">
        <button
          type="submit"
          class="bg-primary-600 text-sm hover:bg-primary-700 text-white px-4 py-2 rounded-lg shadow font-medium"
          :disabled="form.processing"
        >
          <i class="fas fa-save mr-1"></i>
          {{ brand ? "Update Brand" : "Save Brand" }}
        </button>
      </div>
    </form>
  </div>
</template>
