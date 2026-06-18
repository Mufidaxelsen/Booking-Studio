# 🎸 Sistem Informasi Manajemen Studio Musik (Studio-Fi)

[![Laravel Version](https://img.shields.io/badge/Laravel-13.x-red.svg)](https://laravel.com)
[![PHP Version](https://img.shields.io/badge/PHP-8.5.7-blue.svg)](https://php.net)
[![Filament Version](https://img.shields.io/badge/Filament-v5-orange.svg)](https://filamentphp.com)

Sistem Informasi Manajemen Studio Musik adalah aplikasi berbasis web mutakhir yang dirancang khusus untuk mendigitalisasi dan memodernisasi seluruh alur operasional bisnis studio musik dari hulu ke hilir. Proyek ini dibangun menggunakan kombinasi teknologi terbaru di tahun 2026: **PHP 8.5.7**, **Laravel 13**, dan admin panel berbasis TALL Stack yaitu **Filament v5**.

---

## ✨ Fitur Utama

* **Role-Based Access Control (RBAC):** Pemisahan hak akses yang ketat antara **Admin (Owner)** dan **Kasir** menggunakan integrasi *Spatie Permission*.
* **Sistem Penjadwalan Real-time:** Mengunci slot waktu sewa secara akurat pada sistem basis data guna mencegah terjadinya jadwal bentrok (*double-booking*).
* **Transaksi Booking Terintegrasi:** Form transaksi kasir yang mendukung relasi *Many-to-Many* untuk penyewaan ruangan sekaligus instrumen musik tambahan dalam satu waktu.
* **Kalkulasi Biaya Otomatis:** Sistem otomatis menghitung akumulasi total harga sewa studio dan alat musik pendukung secara instan guna menghindari *human error*.
* **Pencatatan Keuangan & Log Audit:** Melacak riwayat pembayaran (*payments*) serta mencatat perubahan status transaksi melalui *booking status logs*.

---

## 🛠️ Spesifikasi Teknologi

* **Language:** PHP v8.5.7
* **Framework:** Laravel v13.x
* **Admin Panel Framework:** Filament v5 (TALL Stack: Tailwind CSS, Alpine.js, Laravel, Livewire)
* **Database:** MariaDB / MySQL v10.4.32 (Managed via Laragon & HeidiSQL)

---

## 🚀 Langkah Instalasi (Local Deployment)

Ikuti langkah-langkah berikut untuk menjalankan proyek ini di komputer lokal Anda:

1. **Clone Repositori**
   ```bash
   git clone https://github.com/Mufidaxelsen/Booking-Studio
2. composerr install
3. cp .env.example .env
4. php artisan key:generate
5. php artisan migrate:fresh --seed
6. php artisan serve



