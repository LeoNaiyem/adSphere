<template>
  <footer class="bg-gray-50 text-gray-700 border-t">
    <div class="max-w-7xl mx-auto px-6 py-10 grid grid-cols-1 sm:grid-cols-2 md:grid-cols-4 gap-8">
      
      <!-- Brand / About -->
      <div>
        <h3 class="text-lg font-semibold mb-4">About Us</h3>
        <p class="text-sm text-gray-600">
          AdSphere is your trusted marketplace to buy and sell everything from electronics to cars.
        </p>
      </div>

      <!-- Quick Links -->
      <div>
        <h3 class="text-lg font-semibold mb-4">Quick Links</h3>
        <ul class="space-y-2">
          <li><a href="#" class="hover:text-primary-600 transition">Home</a></li>
          <li><a href="#" class="hover:text-primary-600 transition">Categories</a></li>
          <li><a href="#" class="hover:text-primary-600 transition">Post Ad</a></li>
          <li><a href="#" class="hover:text-primary-600 transition">Contact</a></li>
        </ul>
      </div>

      <!-- Support -->
      <div>
        <h3 class="text-lg font-semibold mb-4">Support</h3>
        <ul class="space-y-2">
          <li><a href="#" class="hover:text-primary-600 transition">Help Center</a></li>
          <li><a href="#" class="hover:text-primary-600 transition">Safety Tips</a></li>
          <li><a href="#" class="hover:text-primary-600 transition">Terms & Conditions</a></li>
          <li><a href="#" class="hover:text-primary-600 transition">Privacy Policy</a></li>
        </ul>
      </div>

      <!-- Social -->
      <div>
        <h3 class="text-lg font-semibold mb-4">Follow Us</h3>
        <div class="flex space-x-4">
          <a href="#" class="text-gray-500 hover:text-primary-600">
            <i class="fab fa-facebook-f"></i>
          </a>
          <a href="#" class="text-gray-500 hover:text-sky-500">
            <i class="fab fa-twitter"></i>
          </a>
          <a href="#" class="text-gray-500 hover:text-pink-500">
            <i class="fab fa-instagram"></i>
          </a>
          <a href="#" class="text-gray-500 hover:text-red-600">
            <i class="fab fa-youtube"></i>
          </a>
        </div>
      </div>
    </div>

    <!-- Bottom -->
    <div class="border-t text-center py-4 text-sm text-gray-500">
      © {{ new Date().getFullYear() }} AdSphere. All rights reserved.
    </div>
  </footer>
</template>
