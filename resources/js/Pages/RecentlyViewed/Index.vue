<script setup>
import UserLayout from "@/Layouts/UserLayout.vue";
import { Link, router } from "@inertiajs/vue3";
import { ref } from "vue";

defineOptions({ layout: UserLayout });

const props = defineProps({
  recentlyViewed: Array,
});

// toggle wishlist like in show.vue
function toggleWishlist(item) {
  if (item.in_wishlist) {
    router.delete(route("wishlist.destroy", item.id), {
      preserveScroll: true,
      onSuccess: () => (item.in_wishlist = false),
    });
  } else {
    router.post(
      route("wishlist.store"),
      { product_id: item.id },
      {
        preserveScroll: true,
        onSuccess: () => (item.in_wishlist = true),
      }
    );
  }
}
</script>

<template>
  <Head title="Recently viewed" />
  <div class="p-6 max-w-7xl mx-auto">
    <h1 class="text-xl font-bold mb-6 flex items-center">
      <i class="fa fa-eye text-primary-600 mr-2"></i>
      Recently Viewed
    </h1>

    <!-- Empty State -->
    <div
      v-if="recentlyViewed.length === 0"
      class="text-gray-600 text-center py-16"
    >
      <i class="fa fa-clock text-5xl text-gray-400 mb-4"></i>
      <p class="text-lg font-medium">You haven’t viewed any products yet.</p>
    </div>

    <!-- Product Grid -->
    <div
      v-else
      class="grid grid-cols-2 sm:grid-cols-1 lg:grid-cols-3 xl:grid-cols-5 gap-4"
    >
      <div
        v-for="item in recentlyViewed"
        :key="item.id"
        class="bg-white border rounded-xl shadow-sm hover:shadow-md transition flex flex-col overflow-hidden group"
      >
        <!-- Image -->
        <div class="relative h-36 bg-gray-100 overflow-hidden">
          <img
            v-if="item.images && item.images.length > 0"
            :src="`/storage/${item.images[0].path}`"
            alt="Product Image"
            class="object-cover h-full w-full group-hover:scale-105 transition"
          />
          <i
            v-else
            class="fa fa-box text-gray-400 text-2xl absolute top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-1/2"
          ></i>

          <!-- Wishlist Toggle -->
          <button
            @click="toggleWishlist(item)"
            class="absolute top-2 right-2 w-7 h-7 rounded-full flex items-center justify-center text-white shadow-md transition hover:scale-110 text-xs"
            :class="
              item.in_wishlist
                ? 'bg-red-500 hover:bg-red-600'
                : 'bg-primary-600 hover:bg-primary-700'
            "
            :title="item.in_wishlist ? 'Remove from wishlist' : 'Add to wishlist'"
          >
            <i :class="item.in_wishlist ? 'fas fa-heart' : 'far fa-heart'"></i>
          </button>
        </div>

        <!-- Body -->
        <div class="p-3 flex flex-col flex-grow">
          <h2
            class="font-medium text-sm text-gray-800 truncate group-hover:text-primary-600 transition"
          >
            {{ item.title }}
          </h2>

          <p class="text-primary-600 font-semibold text-sm mt-1">
            ${{ Number(item.price).toFixed(2) }}
          </p>

          <p class="text-xs text-gray-500 mt-1 truncate">
            <i class="fa fa-tags mr-1"></i>
            {{ item.brand?.name ?? "No Brand" }}
          </p>

          <!-- Viewed At -->
          <p class="text-[11px] text-gray-400 mt-1 truncate">
            Viewed At: {{ new Date(item.pivot.viewed_at).toLocaleString() }}
          </p>

          <!-- Actions -->
          <div class="mt-auto pt-3">
            <Link
              :href="route('products.show', item.id)"
              class="inline-flex items-center justify-center w-full bg-primary-600 hover:bg-primary-700 text-white px-2 py-1.5 rounded-lg text-xs transition"
            >
              <i class="fa fa-eye mr-1"></i> View
            </Link>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
