# Dokumentasi Validasi Input — CeriaReads (Tugas 12)
**Nama:** Yelly Ambarwaty  
**NIM:** 230660221033  

## 1. Tabel Matriks Validasi Client & Server

| Input | Aturan client | Pemeriksaan server | Pesan error |
|:------|:--------------|:-------------------|:------------|
| **Nama Peminjam** | Wajib diisi (`trim()`), panjang minimal 3 karakter dan maksimal 60 karakter. | Validasi tipe data string, panjang karakter, dan sanitasi karakter berbahaya sebelum simpan ke DB. | `"Nama peminjam wajib diisi."` / `"Nama minimal terdiri dari 3 karakter."` |
| **Email Anggota** | Wajib diisi dan harus sesuai pola *regular expression* email standar. | Verifikasi format email, pengecekan keunikan akun pada tabel anggota, dan status keaktifan anggota. | `"Format email tidak valid (contoh: anggota@domain.com)."` |
| **Judul Buku** | Wajib diisi (`trim()`) dan panjang maksimal 100 karakter. | Validasi ketersediaan stok buku di katalog Panti Baca Ceria serta validasi ID buku. | `"Judul buku wajib diisi."` / `"Judul buku maksimal 100 karakter."` |
| **Durasi Peminjaman** | Wajib berupa angka bulat positif dalam rentang 1 hingga 14 hari. | Validasi aturan kebijakan maksimal hari peminjaman perpustakaan dan pengecekan denda keterlambatan. | `"Durasi peminjaman hanya diperbolehkan antara 1 hingga 14 hari."` |
| **Foto Kondisi Buku** | File wajib dipilih, ekstensi terbatas `.jpg`/`.jpeg`/`.png`, ukuran maksimal 5 MB. | Pemeriksaan *MIME type* asli file di server, batas ukuran unggahan, dan pemindaian keamanan berkas. | `"Format file tidak didukung. Gunakan format JPG, JPEG, atau PNG."` / `"Ukuran file melebihi batas maksimal 5 MB."` |

## 2. Lokasi Validator dan Cara Pengujian
- **Lokasi Kode Validator:** Terisolasi di dalam kelas `CeriaReadsValidator` pada berkas `lib/utils/form_validator.dart` dan dihubungkan ke widget `TextFormField` pada `lib/main.dart`.
- **Cara Menguji:**
  1. Jalankan aplikasi melalui `flutter run -d chrome`.
  2. Tekan tombol **"Validasi & Kirim Pengajuan"** dalam kondisi kolom kosong untuk memverifikasi penolakan *field* wajib.
  3. Masukkan email tanpa tanda `@` dan durasi angka `20` hari untuk memverifikasi penolakan format dan rentang nilai.
  4. Gunakan tombol *chip* simulasi pada kartu lampiran untuk menguji penolakan ekstensi `.exe` dan ukuran file di atas 5 MB.