<script setup>
import AdminLayout from "@/Layouts/AdminLayout.vue";
import {
  ArcElement,
  BarElement,
  CategoryScale,
  Chart as ChartJS,
  Legend,
  LinearScale,
  LineElement,
  PointElement,
  Title,
  Tooltip,
} from "chart.js";
import { defineProps } from "vue";
import { Bar, Line, Pie } from "vue-chartjs";
defineOptions({ layout: AdminLayout });

// Register Chart.js components
ChartJS.register(
    Title,
    Tooltip,
    Legend,
    ArcElement,
    CategoryScale,
    LinearScale,
    BarElement,
    LineElement,
    PointElement
);

const props = defineProps({
    stats: Object, // counts { users, categories, brands, products }
    chartData: Object, // datasets for charts
});

const summaryData = [
    {
        title: "Users",
        value: props.stats.users,
        desc: "Total registered users",
        gradient: "bg-gradient-to-r from-orange-500 to-yellow-400",
        icon: "fas fa-users",
    },
    {
        title: "Categories",
        value: props.stats.categories,
        desc: "Total product categories",
        gradient: "bg-gradient-to-r from-purple-600 to-blue-500",
        icon: "fas fa-list",
    },
    {
        title: "Brands",
        value: props.stats.brands,
        desc: "Total available brands",
        gradient: "bg-gradient-to-r from-pink-400 to-cyan-500",
        icon: "fas fa-tags",
    },
    {
        title: "Products",
        value: props.stats.products,
        desc: "Total listed products",
        gradient: "bg-gradient-to-r from-indigo-900 to-green-400",
        icon: "fas fa-box-open",
    },
];
</script>

<template>
  <Head title="Admin Dashboard"/>
    <div class="p-6 space-y-8">
        <h1 class="text-2xl font-bold mb-4">📊 Admin Dashboard</h1>

        <!-- Quick Stats -->
        <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6">
            <div
                v-for="card in summaryData"
                :key="card.title"
                class="rounded-2xl p-6 text-white shadow-lg transform transition-transform duration-300 hover:scale-105 cursor-pointer"
                :class="card.gradient"
            >
                <div class="flex items-center justify-between">
                    <div>
                        <h6 class="text-sm uppercase tracking-wide opacity-80">
                            {{ card.title }}
                        </h6>
                        <h3 class="text-3xl font-bold">{{ card.value }}</h3>
                        <p class="text-sm opacity-75 mt-1">{{ card.desc }}</p>
                    </div>
                    <div class="text-4xl opacity-80">
                        <i :class="card.icon"></i>
                    </div>
                </div>
            </div>
        </div>

        <!-- Charts -->
        <div class="grid grid-cols-1 lg:grid-cols-2 gap-6">
            <!-- Bar Chart -->
            <div class="bg-white p-4 rounded shadow h-[500px] flex flex-col">
                <h2 class="text-lg font-semibold mb-2">Products per Brand</h2>
                <div class="flex-1 flex items-center justify-center">
                    <Bar class="w-full h-full" :data="chartData.bar" />
                </div>
            </div>

            <!-- Pie Chart -->
            <div class="bg-white p-4 rounded shadow h-[500px] flex flex-col">
                <h2 class="text-lg font-semibold mb-2">Products by Category</h2>
                <div class="flex-1 flex items-center justify-center overflow-hidden">
                    <Pie class="w-full h-full" :data="chartData.pie" />
                </div>
            </div>

            <!-- Line Chart -->
            <div class="bg-white p-4 rounded shadow h-[500px] flex flex-col">
                <h2 class="text-lg font-semibold mb-2">New Users Over Time</h2>
                <div class="flex-1 flex items-center justify-center">
                    <Line class="w-full h-full" :data="chartData.line" />
                </div>
            </div>
            <!-- Line Chart -->
            <div class="bg-white p-4 rounded shadow h-[500px] flex flex-col">
                <h2 class="text-lg font-semibold mb-2">New Users Over Time</h2>
                <div class="flex-1 flex items-center justify-center">
                    <Line class="w-full h-full" :data="chartData.line" />
                </div>
            </div>
        </div>
    </div>
</template>
