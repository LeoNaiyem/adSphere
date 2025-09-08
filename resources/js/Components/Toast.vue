<script setup>
import { ref, watch } from "vue";

const props = defineProps({
  message: String,
  type: {
    type: String,
    default: "success",
  },
  show: Boolean,
});

const emit = defineEmits(["close"]);

const visible = ref(props.show);

watch(
  () => props.show,
  (newVal) => {
    visible.value = newVal;

    if (newVal) {
      setTimeout(() => {
        emit("close");
      }, 3000); 
    }
  }
);
</script>

<template>
  <transition name="fade">
    <div
      v-if="visible"
      class="fixed top-5 right-5 px-4 py-3 rounded-lg shadow-lg text-white z-50 flex items-center gap-2"
      :class="{
        'bg-green-600': type === 'success',
        'bg-red-600': type === 'error',
        'bg-blue-600': type === 'info',
      }"
    >
      <i v-if="type === 'success'" class="fas fa-check-circle"></i>
      <i v-if="type === 'error'" class="fas fa-exclamation-circle"></i>
      <i v-if="type === 'info'" class="fas fa-info-circle"></i>
      <span>{{ message }}</span>
    </div>
  </transition>
</template>

<style scoped>
.fade-enter-active,
.fade-leave-active {
  transition: opacity 0.3s ease;
}
.fade-enter-from,
.fade-leave-to {
  opacity: 0;
}
</style>
