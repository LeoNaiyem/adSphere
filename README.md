# 🛍️ AdSphere – E-commerce Application

AdSphere is a modern e-commerce platform built with **Laravel**, **Inertia.js**, **Vue 3**, and **TailwindCSS**.  
It provides a smooth SPA-like user experience with role-based dashboards for **Admin** and **User**.

---

## 🌐 GitHub Repository
👉 [AdSphere Source Code](https://github.com/LeoNaiyem/adSphere)

---

## 🚀 Features

### 🔑 Authentication
- User registration & login
- Role-based access (**Admin / User**)

### 👤 User Dashboard
- **Quick Stats**: Total posted products, Wishlist count, Recently Viewed count
- **Wishlist Management**: Add/remove products with a toggle
- **Recently Viewed Products**: Tracks browsing history with timestamps
- Manage own products (create, edit, delete)

### 🛠️ Admin Dashboard
- Manage **Categories**, **Brands**, and **Products**
- Sidebar with collapsible menus
- Category-based **Dynamic Attributes** (extra fields on product creation/edit form)

### 📦 Product Management
- Upload multiple images per product
- Product details include title, brand, category, condition, description
- Dynamic category-specific fields
- Wishlist toggle
- Recently viewed tracker

### ❤️ Wishlist System
- Add/remove products with a single toggle
- Display wishlist on both **Dashboard** and **Wishlist Page**

### 👁️ Recently Viewed
- Tracks user activity
- Displays last 20 products with category, brand, and viewed time

### 📊 Home Page
- Shows **Most Viewed Products**
- Product cards with image, title, price, wishlist toggle

---

## 🛠️ Tech Stack
- **Backend:** Laravel 10+
- **Frontend:** Vue 3 + Inertia.js
- **Styling:** TailwindCSS + FontAwesome
- **Database:** MySQL (or PostgreSQL)
- **Auth:** Laravel Breeze / Jetstream

---

## ⚙️ Installation Guide

Follow these steps to run the project locally:

### 1️⃣ Clone Repository
```bash
git clone https://github.com/LeoNaiyem/adSphere.git
cd adsphere

2️⃣ Install Backend Dependencies
composer install

3️⃣ Install Frontend Dependencies
npm install

4️⃣ Environment Setup (Copy .env.example to .env)
cp .env.example .env

Configure:

Database (DB_DATABASE, DB_USERNAME, DB_PASSWORD)

APP_URL
MAIL CONFIGURATION

Storage link: php artisan storage:link

5️⃣ Generate App Key
php artisan key:generate

6️⃣ Run Migrations & Seeders
php artisan migrate --seed (If you encounter any issues with migration or seeding, utilize the DB.sql file to retrieve the data.)


This will create default roles, admin user, categories, and sample data.

7️⃣ Build Frontend Assets
npm run dev

8️⃣ Start Development Server
php artisan serve


Visit http://127.0.0.1:8000



👥 Default Credentials

After seeding, you’ll have:

Admin
Email: naiyem@gmail.com
Password: 11111111

User
Email: leo@gmail.com
Password: 11111111


📖 How It Works

Users can register, log in, browse products, add/remove from wishlist, and see recently viewed products.

Admins can manage categories (with dynamic fields), brands, and products.

Product forms dynamically show category-specific attributes.

Wishlist is toggle-based:

Click ❤️ → adds to wishlist

Click again → removes from wishlist

Recently viewed products are automatically tracked and displayed on dashboard + recently viewed page.

Dashboard shows quick stats and tables with the latest items.