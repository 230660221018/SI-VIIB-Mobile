# Tugas 3 – Halaman Aplikasi Sederhana

## Identitas Mahasiswa

- **Nama:** Paizal Rizki Nugraha
- **NIM:** 230660221012
- **Mata Kuliah:** Pemrograman Aplikasi Bergerak

## Nama Aplikasi

**APK Catatan**

## Domain Sistem Informasi

Domain yang dipilih adalah **Sistem Informasi pencatatan pribadi/aktivitas mahasiswa**. Aplikasi ini membantu pengguna mencatat dan melihat informasi kegiatan, tugas kuliah, jadwal, serta keperluan sehari-hari.

## Deskripsi Halaman

Halaman beranda APK Catatan menampilkan sapaan kepada pengguna, ringkasan jumlah catatan dan jumlah catatan yang belum selesai, serta daftar catatan pribadi. Data ditulis secara statis di dalam kode dan terdiri dari nama catatan, kategori, serta status. Halaman disusun menggunakan `Column` untuk mengatur konten secara vertikal, `Row` untuk menampilkan dua kartu ringkasan secara horizontal, dan `ListView.builder` untuk menampilkan daftar catatan yang dapat digulir; `Padding` digunakan untuk memberikan jarak di sekitar konten. Aplikasi juga menyediakan AppBar dan tombol tambah sebagai elemen antarmuka.

## Widget Tree

- `widget-tree.png` merupakan hasil ekspor diagram widget tree.
- Diagram menunjukkan hierarki mulai dari `MaterialApp`, `Scaffold`, hingga komponen-komponen di dalam halaman.

## Cara Menjalankan dan Mengambil Screenshot

1. Buka proyek Flutter di komputer atau buka DartPad pada mode **Flutter**.
2. Salin isi `halaman_aplikasi.dart` ke file `lib/main.dart` pada proyek Flutter, atau tempelkan ke editor DartPad.
3. Jalankan aplikasi melalui Chrome dengan perintah `flutter run -d chrome`, atau tekan **Run** di DartPad.
4. Setelah halaman tampil, ambil tangkapan layar halaman aplikasi dari browser (misalnya menggunakan `Win + Shift + S` pada Windows).
5. Simpan tangkapan layar asli dengan nama `screenshot-halaman.png` di folder pengumpulan ini.

## Refleksi (Tepat 3 Kalimat)

Widget layout yang paling sulit saya rangkai adalah `ListView.builder` di dalam `Column`. Saya perlu menggunakan `Expanded` agar daftar dapat mengambil ruang yang tersedia dan bisa digulir tanpa menimbulkan konflik ukuran tampilan. Dari proses ini saya belajar bahwa pengaturan batas ruang dan susunan widget sangat penting dalam membuat layout Flutter.

## Struktur Folder Pengumpulan

```text
tugas-3/
└── 230660221012 - Paizal Rizki Nugraha/
    ├── halaman_aplikasi.dart
    ├── widget-tree.png
    ├── screenshot-halaman.png
    └── README.md
```
