<script setup>
import ManagePage from "@/Components/ManagePage.vue";
import AdminLayout from "@/Layouts/AdminLayout.vue";

defineOptions({ layout: AdminLayout });

const props = defineProps({ categories: Object });
</script>

<template>
  <Head title="Manage Categories" />
  <ManagePage
    title="Categories"
    icon="fas fa-layer-group"
    breadcrumbIcon="fas fa-folder-open"
    breadcrumbLabel="Categories"
    addRoute="categories.create"
    addLabel="Add Category"
    :data="categories"
    :columns="[
      { key: 'name', label: 'Name' },
      { key: 'slug', label: 'Slug' },
      { key: 'status', label: 'Status' },
      { key: 'actions', label: 'Actions' },
    ]"
    :routes="{
      view: 'categories.show',
      edit: 'categories.edit',
      destroy: 'categories.destroy'
    }"
  />
</template>
