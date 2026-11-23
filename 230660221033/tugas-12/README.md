# Tugas 12: Security Checklist dan Validasi Project — CeriaReads
**Nama:** Yelly Ambarwaty  
**NIM:** 230660221033  
**Kelas:** SI-VIIB  

## 1. Dependency pada `pubspec.yaml`
Proyek ini menggunakan SDK Flutter bawaan (`flutter` dan `material`) tanpa penambahan *package* pihak ketiga berisiko tinggi untuk menjaga permukaan serangan (*attack surface*) tetap minimal.

## 2. Cara Menjalankan & Target Pengujian
Target verifikasi aplikasi menggunakan **Flutter Web (Google Chrome)**:
1. Masuk ke direktori `tugas-12`.
2. Jalankan `flutter pub get`.
3. Jalankan `flutter analyze` untuk memastikan tidak ada peringatan maupun error sintaks.
4. Jalankan aplikasi di peramban Chrome:
   ```bash
   flutter run -d chrome
   ```

## 3. Dokumentasi Hasil
<img width="1917" height="1007" alt="hasil tugas 12" src="https://github.com/user-attachments/assets/5c92ae42-afb1-44fa-b56a-59fca0d9c544" />
