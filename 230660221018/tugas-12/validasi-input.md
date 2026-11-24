# Dokumentasi Validasi Input SIPORA

## 1. Tujuan

Validasi input diterapkan untuk memastikan data pengajuan surat yang dimasukkan pengguna memenuhi aturan dasar sebelum diproses. Validasi dilakukan pada sisi client untuk membantu mengurangi kesalahan pengisian dan memberikan pesan kesalahan yang jelas kepada pengguna.

## 2. Daftar Validasi Input

| Input | Aturan Validasi Client | Pemeriksaan Server | Pesan Error |
|---|---|---|---|
| Nama mahasiswa | Wajib diisi, minimal 3 dan maksimal 100 karakter. | Memeriksa keberadaan data dan panjang nama. | Nama minimal 3 karakter. |
| NIM/NPM | Wajib diisi, hanya angka, panjang 6–20 digit. | Memeriksa format dan keunikan NIM/NPM jika tersedia. | NIM/NPM harus berupa 6–20 digit angka. |
| Semester | Wajib diisi, rentang 1–14, menerima format angka atau Semester diikuti angka. | Memeriksa tipe data dan rentang semester. | Semester harus berada pada rentang 1–14. |
| WhatsApp | Wajib diisi, panjang 9–15 digit dengan karakter format nomor yang diizinkan. | Memeriksa format dan kelayakan nomor kontak. | Masukkan nomor WhatsApp yang valid. |
| Topik | Wajib diisi, minimal 5 dan maksimal 500 karakter. | Memeriksa keberadaan dan batas panjang topik. | Topik minimal 5 karakter. |
| Tempat penelitian/observasi | Wajib diisi dan minimal 2 karakter. | Memeriksa keberadaan dan batas panjang data. | Kolom ini wajib diisi. |

## 3. Implementasi

Validasi input diterapkan pada `form-interaksi.dart` menggunakan validator pada komponen form Flutter. Pemeriksaan dilakukan sebelum pengguna melanjutkan proses konfirmasi pengajuan.

## 4. Batasan Validasi

Validasi saat ini dilakukan pada sisi client aplikasi. SIPORA masih menggunakan simulasi pengajuan dan belum memiliki backend yang melakukan validasi server. Oleh karena itu, pemeriksaan server pada tabel merupakan aturan yang direncanakan apabila sistem dikembangkan dengan backend.