# PustakaKu — Aplikasi Perpustakaan Kampus

## Identitas

| Keterangan | Detail |
|---|---|
| Nama | Syifa Nur Insani |
| NIM | 230660221030 |
| Program Studi/Kelas | Sistem Informasi / SI-VIIB |
| Mata Kuliah | Pemrograman Aplikasi Bergerak |
| Domain | Perpustakaan Kampus |
| Framework | Flutter |
| Bahasa Pemrograman | Dart |

## Deskripsi Proyek

PustakaKu merupakan aplikasi perpustakaan kampus berbasis mobile yang dikembangkan menggunakan Flutter. Aplikasi ini dirancang untuk membantu pengguna melihat daftar buku serta mengelola data peminjaman buku melalui antarmuka yang sederhana.

Pengembangan aplikasi dilakukan secara bertahap, mulai dari analisis kebutuhan, perancangan antarmuka, implementasi navigasi, hingga pengelolaan data menggunakan fitur CRUD (Create, Read, Update, Delete).

## Fitur yang Dikembangkan

1. **Daftar Buku**  
   Menampilkan katalog buku yang tersedia pada aplikasi PustakaKu.

2. **Form Peminjaman**  
   Menyediakan formulir untuk memasukkan data peminjaman buku.

3. **Daftar Peminjaman**  
   Menampilkan data peminjaman yang telah dimasukkan.

4. **Pengelolaan Data (CRUD)**  
   Memungkinkan pengguna untuk menambahkan, melihat, mengubah, dan menghapus data peminjaman.

## Teknologi yang Digunakan

- Flutter
- Dart
- Visual Studio Code
- Git dan GitHub

## Implementasi Tugas 8

Pada Tugas 8, pengembangan aplikasi difokuskan pada implementasi pengelolaan data lokal menggunakan konsep CRUD.

Data dikelola menggunakan struktur data `List` dan diperbarui melalui mekanisme `setState()`. Dengan implementasi ini, pengguna dapat melakukan pengelolaan data peminjaman secara langsung melalui aplikasi.

**Catatan:** Penyimpanan data pada tahap ini masih bersifat lokal di dalam memori aplikasi dan belum menggunakan database maupun REST API.

## Dokumentasi Screenshot

Dokumentasi hasil implementasi Tugas 8 terdiri dari:

| File | Keterangan |
|---|---|
| `screenshot-daftar.png` | Tampilan daftar data |
| `screenshot-form.png` | Tampilan formulir pengisian data |
| `screenshot-hapus.png` | Tampilan setelah proses penghapusan data |

## Struktur Folder

```text
Tugas-8/
└── 230660221030-SyifaNurInsani/
    ├── README.md
    ├── laporan-progress-uts.md
    ├── screenshot-daftar.png
    ├── screenshot-form.png
    ├── screenshot-hapus.png
    └── tes-konsep-uts.md
```

## Cara Menjalankan Aplikasi

1. Pastikan Flutter SDK sudah terpasang.
2. Buka folder proyek PustakaKu melalui Visual Studio Code.
3. Buka terminal pada direktori proyek.
4. Jalankan perintah berikut untuk mengambil dependensi:

```bash
flutter pub get
```

5. Jalankan aplikasi menggunakan perintah:

```bash
flutter run
```

## Pengembangan Selanjutnya

Pengembangan PustakaKu akan dilanjutkan dengan penerapan integrasi REST API untuk mempelajari proses pengambilan dan pengiriman data melalui layanan web. Pengembangan tersebut menjadi materi lanjutan pada pertemuan berikutnya.

## Pernyataan Penggunaan AI

AI digunakan sebagai alat bantu dalam memahami materi, memperoleh arahan teknis, dan membantu mengatasi kendala selama proses pengembangan aplikasi. Seluruh implementasi tetap disesuaikan dengan kebutuhan proyek dan materi perkuliahan.

