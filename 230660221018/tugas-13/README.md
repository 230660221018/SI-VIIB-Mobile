# Tugas 13 — Testing dan Debugging SIPORA

**Nama:** Intan Kartika  
**NIM:** 230660221018  
**Nama Aplikasi:** SIPORA (Sistem Informasi Pengajuan Surat Observasi dan Riset Akademik)

## 1. Deskripsi

Tugas ini berfokus pada pengujian fungsional, widget testing, debugging, dan perbaikan bug pada aplikasi SIPORA. Pengujian dilakukan untuk memastikan fitur aplikasi berjalan sesuai kebutuhan dan hasil yang diharapkan.

## 2. Pengujian

Pengujian dilakukan menggunakan pengujian manual melalui Chrome dan widget testing menggunakan Flutter Test.

| Jenis Pengujian | Hasil |
|---|---|
| Pengujian manual | 11 test case berhasil |
| Widget testing | 4 test berhasil |
| Regression test | Berhasil |
| Flutter Analyze | No issues found! |

## 3. Perintah Pengujian

```bash
flutter pub get
flutter analyze
flutter test
flutter run -d chrome
```

## 4. Keterbatasan Pengujian

- Pengujian dilakukan pada lingkungan Flutter Web melalui Chrome.
- Widget test berfokus pada tampilan halaman utama dan navigasi.
- Data pengajuan masih menggunakan penyimpanan lokal aplikasi dan belum terhubung ke backend atau database server.
- Pengujian belum mencakup integrasi API, pengujian performa mendalam, maupun pengujian pada berbagai perangkat fisik.

## 5. Hasil

Pengujian manual dan widget testing berhasil dilakukan. Bug yang ditemukan selama pengujian berhasil diperbaiki dan pengujian regresi menunjukkan hasil yang lulus.
