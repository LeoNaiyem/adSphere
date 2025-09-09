<script setup>
import AdminLayout from "@/Layouts/AdminLayout.vue";
import { Link, useForm } from "@inertiajs/vue3";
import { ref } from "vue";

defineOptions({ layout: AdminLayout });

const props = defineProps({
  category: Object,
  fields: Array,
});

const form = useForm({
  name: "",
  type: "text",
});

const showForm = ref(false);

function submit() {
  form.post(route("categories.fields.store", props.category.id), {
    preserveScroll: true,
    onSuccess: () => {
      form.reset("name");
      form.type = "text";
      showForm.value = false;
    },
  });
}
</script>

<template>
  <div class="max-w-3xl mx-auto p-6 bg-white shadow rounded">
    <h1 class="text-2xl font-bold mb-6">
      Manage Fields for {{ category.name }}
    </h1>

    <!-- Add Field Button -->
    <button
      @click="showForm = !showForm"
      class="mb-4 bg-primary-600 hover:bg-primary-700 text-white px-4 py-2 rounded"
    >
      <i class="fa fa-plus"></i>
      <span class="ml-1">Add Field</span>
    </button>

    <!-- Add Field Form -->
    <form
      v-if="showForm"
      @submit.prevent="submit"
      class="mb-6 border p-4 rounded bg-gray-50"
    >
      <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
        <div>
          <label class="block font-medium">Field Name</label>
          <input
            v-model="form.name"
            type="text"
            class="w-full border p-2 rounded"
            placeholder="e.g. Model, Warranty"
          />
          <div v-if="form.errors.name" class="text-red-500 text-sm">
            {{ form.errors.name }}
          </div>
        </div>

        <div>
          <label class="block font-medium">Type</label>
          <select v-model="form.type" class="w-full border p-2 rounded">
            <option value="text">Text</option>
            <option value="number">Number</option>
            <option value="select">Select</option>
          </select>
          <div v-if="form.errors.type" class="text-red-500 text-sm">
            {{ form.errors.type }}
          </div>
        </div>
      </div>

      <div class="mt-4">
        <button
          type="submit"
          class="bg-green-600 hover:bg-green-700 text-white px-4 py-2 rounded"
          :disabled="form.processing"
        >
          Save
        </button>
      </div>
    </form>

    <!-- Existing Fields -->
    <div>
      <h2 class="text-xl font-semibold mb-2">Existing Fields</h2>
      <div v-if="fields.length === 0" class="text-gray-500">
        No fields yet for this category.
      </div>
      <ul class="space-y-2">
        <li
          v-for="field in fields"
          :key="field.id"
          class="flex items-center justify-between border rounded p-3"
        >
          <div>
            <span class="font-medium">{{ field.name }}</span>
            <span class="text-gray-500 text-sm ml-2">({{ field.type }})</span>
          </div>

          <!-- Delete -->
          <Link
            :href="route('categories.fields.destroy', field.id)"
            method="delete"
            as="button"
            class="text-red-600 hover:text-red-800"
          >
            <i class="fa fa-trash"></i>
          </Link>
        </li>
      </ul>
    </div>
  </div>
</template>
