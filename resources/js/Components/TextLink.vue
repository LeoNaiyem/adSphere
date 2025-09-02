<script setup>
defineProps({
    routeName: String,
    label: String,
});
</script>
<template>
    <Link
        class="text-blue-600 hover:text-blue-600 font-medium underline dark:text-blue-400 dark:hover:text-blue-500"
        :href="route(routeName)"
        >{{ label }}</Link
    >
</template>
