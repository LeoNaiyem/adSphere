<script setup>
defineProps({
    routeName: String,
    label: String,
});
</script>
<template>
    <Link
        class="text-primary-600 text-sm hover:text-primary-600 font-medium underline dark:text-primary-400 dark:hover:text-primary-500"
        :href="route(routeName)"
        >{{ label }}</Link
    >
</template>
