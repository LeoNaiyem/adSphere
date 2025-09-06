<script setup>
defineProps({
    routeName: String,
    componentName: String,
});
</script>

<template>
    <Link
        :href="route(routeName)"
        class="py-2 px-4 rounded hover:bg-primary-700"
        :class="{ 'bg-primary-700': $page.component === componentName }"
    >
        <slot />
    </Link>
</template>
