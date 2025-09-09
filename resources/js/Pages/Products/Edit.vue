<script setup>
import AdminLayout from "@/Layouts/AdminLayout.vue";
import { useForm } from "@inertiajs/vue3";
import { ref, watch } from "vue";

defineOptions({ layout: AdminLayout });

const props = defineProps({
    product: Object,
    categories: Array,
    brands: Array,
});

const form = useForm({
    title: props.product.title,
    category_id: props.product.category_id,
    brand_id: props.product.brand_id,
    price: props.product.price,
    condition: props.product.condition,
    description: props.product.description,
    status: props.product.status ?? 1,
    images: [],
    attributes: Object.fromEntries(
        props.product.details.map((d) => [d.attribute_name, d.attribute_value])
    ),
});

const selectedCategory = ref(
    props.categories.find((c) => c.id === props.product.category_id) || null
);

watch(
    () => form.category_id,
    (id) => {
        selectedCategory.value =
            props.categories.find((c) => c.id === id) || null;
        form.attributes = {};
    }
);

function submit() {
  form.put(route("products.update", props.product.id), {
    preserveScroll: true,
    forceFormData: true,
    onSuccess: () => {
      form.reset("images");
    },
  });
}
</script>

<template>
    <div class="max-w-4xl mx-auto bg-white p-8 rounded-xl shadow-lg">
        <h1 class="text-2xl font-bold mb-6">Edit Product</h1>

        <form @submit.prevent="submit" class="space-y-6">
            <!-- Title -->
            <div>
                <label class="block font-semibold mb-1">Title</label>
                <input
                    v-model="form.title"
                    type="text"
                    class="w-full border rounded-lg p-2 focus:ring focus:ring-primary-300"
                />
                <p v-if="form.errors.title" class="text-red-500 text-sm mt-1">
                    {{ form.errors.title }}
                </p>
            </div>

            <!-- Category -->
            <div>
                <label class="block font-semibold mb-1">Category</label>
                <select
                    v-model="form.category_id"
                    class="w-full border rounded-lg p-2 focus:ring focus:ring-primary-300"
                >
                    <option value="">Select Category</option>
                    <option v-for="c in categories" :key="c.id" :value="c.id">
                        {{ c.name }}
                    </option>
                </select>
            </div>

            <!-- Brand -->
            <div>
                <label class="block font-semibold mb-1">Brand</label>
                <select
                    v-model="form.brand_id"
                    class="w-full border rounded-lg p-2 focus:ring focus:ring-primary-300"
                >
                    <option value="">Select Brand</option>
                    <option v-for="b in brands" :key="b.id" :value="b.id">
                        {{ b.name }}
                    </option>
                </select>
            </div>

            <!-- Price -->
            <div>
                <label class="block font-semibold mb-1">Price</label>
                <input
                    v-model="form.price"
                    type="number"
                    class="w-full border rounded-lg p-2 focus:ring focus:ring-primary-300"
                />
            </div>

            <!-- Condition -->
            <div>
                <label class="block font-semibold mb-1">Condition</label>
                <select
                    v-model="form.condition"
                    class="w-full border rounded-lg p-2 focus:ring focus:ring-primary-300"
                >
                    <option value="new">New</option>
                    <option value="used">Used</option>
                </select>
            </div>

            <!-- Status -->
            <div>
                <label class="block font-semibold mb-1">Status</label>
                <select
                    v-model="form.status"
                    class="w-full border rounded-lg p-2 focus:ring focus:ring-primary-300"
                >
                    <option :value="1">Active</option>
                    <option :value="0">Inactive</option>
                </select>
            </div>

            <!-- Description -->
            <div>
                <label class="block font-semibold mb-1">Description</label>
                <textarea
                    v-model="form.description"
                    rows="4"
                    class="w-full border rounded-lg p-2 focus:ring focus:ring-primary-300"
                ></textarea>
            </div>

            <!-- Dynamic Fields -->
            <div v-if="selectedCategory" class="border-t pt-4">
                <h2 class="text-lg font-semibold mb-3">Extra Fields</h2>
                <div
                    v-for="field in selectedCategory.fields"
                    :key="field.id"
                    class="mb-4"
                >
                    <label class="block font-medium mb-1">{{
                        field.name
                    }}</label>

                    <!-- Input types -->
                    <input
                        v-if="field.type === 'text'"
                        v-model="form.attributes[field.name]"
                        type="text"
                        class="w-full border rounded-lg p-2 focus:ring focus:ring-primary-300"
                    />

                    <input
                        v-else-if="field.type === 'number'"
                        v-model="form.attributes[field.name]"
                        type="number"
                        class="w-full border rounded-lg p-2 focus:ring focus:ring-primary-300"
                    />

                    <select
                        v-else-if="field.type === 'select'"
                        v-model="form.attributes[field.name]"
                        class="w-full border rounded-lg p-2 focus:ring focus:ring-primary-300"
                    >
                        <option disabled value="">
                            Select {{ field.name }}
                        </option>
                    </select>
                </div>
            </div>

            <!-- Images -->
            <div>
                <label class="block font-semibold mb-1">Add Images</label>
                <input
                    type="file"
                    multiple
                    @change="(e) => (form.images = e.target.files)"
                />
            </div>

            <!-- Submit -->
            <div class="flex justify-end">
                <button
                    type="submit"
                    class="bg-primary-600 text-white px-6 py-2 rounded-lg shadow hover:bg-primary-700 transition"
                    :disabled="form.processing"
                >
                    Update Product
                </button>
            </div>
        </form>
    </div>
</template>
