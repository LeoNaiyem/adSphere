<script setup>
import { useForm } from "@inertiajs/vue3";
import { defineEmits } from "vue";

const props = defineProps({
  show: Boolean,
  itemId: Number,
  routeName: String,
});

const emit = defineEmits(["close"]);

const form = useForm({});

const confirmDelete = () => {
  form.delete(route(props.routeName, props.itemId), {
    onSuccess: () => emit("close"),
  });
};
</script>

<template>
  <div
    v-if="show"
    class="fixed inset-0 flex items-center justify-center bg-black bg-opacity-50 z-50"
  >
    <div class="bg-white rounded-lg shadow-lg p-6 w-96">
      <h2 class="text-lg font-semibold mb-4">Confirm Delete</h2>
      <p class="text-gray-600 mb-6">
        Are you sure you want to delete this Item? This action cannot be undone.
      </p>

      <div class="flex justify-end gap-3">
        <button
          @click="emit('close')"
          class="px-4 py-2 border rounded text-gray-700 hover:bg-gray-100"
        >
          Cancel
        </button>
        <button
          @click="confirmDelete"
          class="px-4 py-2 bg-red-600 text-white rounded hover:bg-red-700"
          :disabled="form.processing"
        >
          Delete
        </button>
      </div>
    </div>
  </div>
</template>
