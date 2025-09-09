<script setup>
import ManagePage from "@/Components/ManagePage.vue";
import AdminLayout from "@/Layouts/AdminLayout.vue";

defineOptions({ layout: AdminLayout });
defineProps({ brands: Object });
</script>

<template>
  <Head title="Brand List" />

  <ManagePage
    title="Brands"
    icon="fas fa-tags"
    breadcrumbIcon="fas fa-tags"
    breadcrumbLabel="Brands"
    addRoute="brands.create"
    addLabel="Add Brand"
    :data="brands"
    :columns="[
      { key: 'logo', label: 'Logo' },
      { key: 'name', label: 'Name' },
      { key: 'description', label: 'Description' },
      { key: 'created_at', label: 'Created At' },
      { key: 'actions', label: 'Actions' },
    ]"
    :routes="{
      view: 'brands.show',
      edit: 'brands.edit',
      destroy: 'brands.destroy'
    }"
  />
</template>
