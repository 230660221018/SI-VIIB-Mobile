# PustakaKu — Tugas 9 Integrasi REST API

## Deskripsi

PustakaKu merupakan aplikasi perpustakaan sederhana berbasis Flutter yang dikembangkan sebagai proyek mata kuliah Pemrograman Aplikasi Bergerak.

Pada Tugas 9, aplikasi dikembangkan dengan menambahkan fitur integrasi REST API menggunakan metode GET dan POST melalui layanan JSONPlaceholder.

## Fitur Tugas 9

- Mengambil data dari REST API menggunakan metode GET.
- Menampilkan data API dalam bentuk daftar.
- Menampilkan indikator loading ketika mengambil data.
- Menangani kesalahan pengambilan data dan menyediakan tombol coba lagi.
- Mengirim data melalui metode POST menggunakan form.
- Melakukan validasi input sebelum pengiriman data.
- Menampilkan notifikasi keberhasilan atau kegagalan pengiriman.

## Teknologi

- Flutter
- Dart
- HTTP Package
- JSONPlaceholder REST API

## Endpoint API

**Base URL:**

`https://jsonplaceholder.typicode.com`

| Metode | Endpoint | Fungsi |
|---|---|---|
| GET | `/posts` | Mengambil daftar data |
| POST | `/posts` | Mengirim data baru |

## Cara Menjalankan Aplikasi

1. Pastikan Flutter dan Visual Studio Code atau Android Studio sudah terpasang