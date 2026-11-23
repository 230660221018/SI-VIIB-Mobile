# Refleksi Tugas 11 — Integrasi Fitur Perangkat
**Nama:** Yelly Ambarwaty  
**NIM:** 230660221033  

## Alasan Teknis Pemilihan Fitur
Pemilihan fitur kamera dan galeri melalui `image_picker` didasarkan pada kebutuhan riil proses bisnis Panti Baca Ceria untuk mendokumentasikan kondisi fisik buku sebelum dipinjamkan kepada anggota. Dibandingkan fitur lokasi atau notifikasi, bukti visual berupa foto jauh lebih relevan untuk meminimalkan risiko perselisihan terkait kerusakan buku antara petugas dan peminjam.

## Kesulitan Konfigurasi dan Penanganannya
Tantangan teknis utama yang ditemui adalah perbedaan cara kerja pembacaan file gambar antara platform Android dan target pengujian Flutter Web (Chrome), di mana widget `Image.file` tidak dapat digunakan di peramban karena keterbatasan akses *path* sistem file lokal. Masalah ini diatasi pada lapisan `LampiranFotoService` dengan membaca data gambar menjadi biner (`readAsBytes()`) sehingga bisa dirender secara universal menggunakan `Image.memory`, sekaligus memisahkan penanganan nilai `null` (pembatalan oleh pengguna) agar tidak tertukar dengan error penolakan izin (`PlatformException`).

---
Deklarasi penggunaan AI: Tidak ada. Seluruh analisis kebutuhan fitur perangkat, isolasi service `LampiranFotoService`, penanganan state antarmuka, dan skenario pengujian disusun serta diverifikasi secara mandiri oleh penulis.