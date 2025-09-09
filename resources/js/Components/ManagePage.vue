<script setup>
import DeleteModal from "@/Components/DeleteModal.vue";
import Pagination from "@/Components/Pagination.vue";
import { Link } from "@inertiajs/vue3";
import { ref } from "vue";

const props = defineProps({
  title: String, 
  icon: String, 
  addRoute: String, 
  addLabel: { type: String, default: "Add" },
  breadcrumbIcon: { type: String, default: "fas fa-folder-open" },
  breadcrumbLabel: String, 
  data: Object, 
  columns: Array, 
  routes: Object, 
});

const deleteOpen = ref(false);
const selectedId = ref(null);

const openDelete = (id) => {
  selectedId.value = id;
  deleteOpen.value = true;
};
</script>

<template>
  <div class="p-6 space-y-6">
    <!-- Breadcrumb -->
    <nav class="flex items-center text-sm text-gray-500 space-x-2">
      <Link :href="route('dashboard')" class="hover:text-primary-600 flex items-center">
        <i class="fas fa-home mr-1 text-primary-500"></i> Dashboard
      </Link>
      <span>/</span>
      <span class="flex items-center text-gray-700 font-semibold">
        <i :class="[breadcrumbIcon, 'mr-1 text-primary-500']"></i>
        {{ breadcrumbLabel }}
      </span>
    </nav>

    <!-- Header -->
    <div class="flex justify-between items-center">
      <h1 class="text-2xl font-bold text-gray-800 flex items-center">
        <i :class="[icon, 'mr-2 text-primary-600']"></i>
        {{ title }}
      </h1>
      <Link
        :href="route(addRoute)"
        class="bg-primary-600 text-sm hover:bg-primary-700 text-white px-4 py-2 rounded shadow flex items-center space-x-2"
      >
        <i class="fas fa-plus"></i>
        <span>{{ addLabel }}</span>
      </Link>
    </div>

    <!-- Table -->
    <div class="bg-white shadow rounded-xl overflow-hidden">
      <table class="w-full text-left">
        <thead class="bg-gray-50 text-gray-700 capitalize text-sm">
          <tr>
            <th
              v-for="col in columns"
              :key="col.key"
              class="px-4 py-3"
              :class="{ 'text-right': col.key === 'actions' }"
            >
              {{ col.label }}
            </th>
          </tr>
        </thead>
        <tbody class="divide-y">
          <tr
            v-for="item in data.data"
            :key="item.id"
            class="hover:bg-gray-50 transition"
          >
            <!-- columns -->
            <td
              v-for="col in columns"
              :key="col.key"
              class="px-4 py-3"
              :class="{ 'text-center': col.key === 'actions' }"
            >
              <!-- Status -->
              <template v-if="col.key === 'status'">
                <span
                  class="px-2 py-1 rounded-full text-xs font-semibold flex items-center w-fit"
                  :class="item.status ? 'bg-green-100 text-green-700' : 'bg-red-100 text-red-700'"
                >
                  <i
                    :class="item.status ? 'fas fa-check-circle mr-1' : 'fas fa-times-circle mr-1'"
                  ></i>
                  {{ item.status ? 'Active' : 'Inactive' }}
                </span>
              </template>

              <!-- Actions -->
              <template v-else-if="col.key === 'actions'">
                <div class="flex justify-end gap-2">
                  <Link
                    v-if="routes.view"
                    :href="route(routes.view, item.id)"
                    class="px-3 py-2 rounded bg-primary-50 text-primary-600 hover:bg-primary-600 hover:text-white transition text-xs font-medium flex items-center gap-1"
                  >
                    <i class="fas fa-eye"></i> View
                  </Link>
                  <Link
                    v-if="routes.edit"
                    :href="route(routes.edit, item.id)"
                    class="px-3 py-2 rounded bg-yellow-50 text-yellow-600 hover:bg-yellow-600 hover:text-white transition text-xs font-medium flex items-center gap-1"
                  >
                    <i class="fas fa-edit"></i> Edit
                  </Link>
                  <button
                    v-if="routes.destroy"
                    @click="openDelete(item.id)"
                    class="px-3 py-2 rounded bg-red-50 text-red-600 hover:bg-red-600 hover:text-white transition text-xs font-medium flex items-center gap-1"
                  >
                    <i class="fas fa-trash"></i> Delete
                  </button>
                </div>
              </template>

              
              <template v-else>
  
  <img
    v-if="col.key === 'logo'"
    :src="item.logo ? '/storage/' + item.logo : '/storage/images/default-brand.jpg'"
    alt="Brand Logo"
    class="h-10 w-10 object-cover rounded-full border-primary-500 border"
  />

  <!-- Created_at column -->
  <span v-else-if="col.key === 'created_at'">
    {{ new Date(item.created_at).toLocaleDateString() }}
  </span>

  <!-- Fallback: just print value -->
  <span v-else>
    {{ item[col.key] }}
  </span>
</template>
            </td>
          </tr>
        </tbody>
      </table>

      <!-- Delete Modal -->
      <DeleteModal
        :show="deleteOpen"
        :itemId="selectedId"
        :routeName="routes.destroy"
        @close="deleteOpen = false"
      />
    </div>

    <!-- Pagination -->
    <Pagination
      :links="data.links"
      :from="data.from"
      :to="data.to"
      :total="data.total"
    />
  </div>
</template>
