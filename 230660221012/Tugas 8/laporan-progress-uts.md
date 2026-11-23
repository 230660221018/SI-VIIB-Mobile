# Laporan Progress Project UTS (Milestone M4)

| | |
|:--|:--|
| **Nama** | Paizal Rizki Nugraha |
| **NIM** | 230660221012 |
| **Kelas** | [Isi: SI-VIIB / SI-VIIA] |
| **Domain SI** | Pencatatan pribadi dan aktivitas mahasiswa |
| **Judul Aplikasi** | APK Catatan |
| **Tautan Repository** | [Masukkan URL repository/folder pengumpulan di GitHub] |

---

## 1. Ringkasan Eksekutif Project

APK Catatan merupakan aplikasi mobile pada domain pencatatan pribadi dan aktivitas mahasiswa. Aplikasi ini dirancang untuk membantu mahasiswa maupun pengguna umum menyimpan dan mengelola informasi penting, seperti catatan perkuliahan, tugas, jadwal, ide, serta daftar kegiatan. Permasalahan yang ingin diselesaikan adalah catatan yang tersebar di buku, kertas, atau beberapa aplikasi sehingga berisiko hilang, sulit ditemukan kembali, dan terlupakan ketika dibutuhkan.

Solusi berbentuk aplikasi mobile dipilih karena smartphone umumnya dibawa pengguna dalam berbagai aktivitas. Dengan demikian, pengguna dapat mencatat atau membaca informasi ketika berada di kelas, perpustakaan, rumah, maupun saat bepergian. Fitur inti yang direncanakan meliputi membuat, melihat, mengubah, menghapus, dan mencari catatan.

## 2. Ketercapaian Milestone (M1 s.d. M3)

> **Catatan status:** Status di bawah disusun berdasarkan pekerjaan yang sudah tercatat pada Tugas 1–4. Progres Tugas 5–7 belum terkonfirmasi, sehingga M2 dan M3 ditandai sebagian dan perlu diperbarui jika implementasinya sudah selesai.

| Milestone | Deliverable | Status (Selesai / Sebagian) | Catatan / Bukti |
|:----------|:------------|:----------------------------|:----------------|
| **M1: Kebutuhan** | Dokumen kebutuhan + User Flow | **Selesai** | Tugas 4 menghasilkan `dokumen-kebutuhan.md`, `user-flow.png`, dan `README.md`. Dokumen memuat persona, kebutuhan fungsional/nonfungsional, prioritas MoSCoW, user flow, serta pemetaan kebutuhan ke halaman dan widget. |
| **M2: UI/UX** | Wireframe + Navigasi | **Sebagian** | Tugas 3 telah menyiapkan rancangan halaman APK Catatan dan susunan widget Flutter, termasuk `halaman_aplikasi.dart` serta `widget-tree.png`. Bukti wireframe/prototype dan navigasi dari Tugas 5–6 perlu ditambahkan atau dikonfirmasi. |
| **M3: MVP Awal** | Model data + CRUD lokal | **Sebagian** | Tugas 3 telah menggunakan data statis berupa daftar catatan dengan atribut nama, kategori, dan status. Implementasi model data serta operasi CRUD lokal dari Tugas 7 belum terkonfirmasi, sehingga perlu dilengkapi dengan bukti kode dan pengujian. |

## 3. Matriks Kebutuhan ke Implementasi

Matriks berikut menghubungkan kebutuhan fungsional dari dokumen M1 dengan halaman dan operasi data yang direncanakan. Kolom implementasi perlu diperbarui sesuai kode aplikasi terakhir.

| ID Kebutuhan | Deskripsi Kebutuhan | Prioritas MoSCoW | Halaman Pemenuh | Operasi Data Terkait |
|:-------------|:-------------------|:----------------:|:----------------|:---------------------|
| **F-01** | Pengguna dapat membuat catatan baru dengan mengisi judul dan isi catatan. | Must | Form Tambah Catatan | Create |
| **F-02** | Pengguna dapat melihat daftar catatan yang tersimpan. | Must | Beranda / Daftar Catatan | Read |
| **F-03** | Pengguna dapat membuka detail sebuah catatan. | Must | Detail Catatan | Read |
| **F-04** | Pengguna dapat mengubah judul atau isi catatan. | Must | Form Edit Catatan | Update |
| **F-05** | Pengguna dapat menghapus catatan yang dipilih setelah memberikan konfirmasi. | Must | Daftar Catatan / Detail Catatan | Delete |
| **F-06** | Pengguna dapat mencari catatan berdasarkan kata pada judul. | Should | Beranda / Daftar Catatan | Read / Search |
| **F-07** | Pengguna dapat mengelompokkan catatan berdasarkan kategori. | Should | Form Tambah/Edit dan Daftar Catatan | Create / Read / Update |
| **F-08** | Pengguna dapat membagikan isi catatan melalui fitur berbagi perangkat. | Could | Detail Catatan | Read / Share |
| **F-09** | Pengguna dapat menyinkronkan catatan antarperangkat. | Won't have (versi awal) | Pengaturan / Sinkronisasi (belum masuk cakupan) | Sinkronisasi data |

## 4. Tangkapan Layar Aplikasi Berjalan

Tambahkan minimal tiga tangkapan layar asli dari aplikasi yang sudah dijalankan. Jangan menggunakan gambar rancangan atau diagram widget sebagai pengganti screenshot aplikasi berjalan, Screenshots ada di folder terpisah "screenshots"


## 5. Kendala dan Solusi Teknis

1. **Pengaturan layout daftar catatan di dalam halaman utama.** Salah satu bagian yang menantang adalah menyusun `ListView.builder` di dalam `Column`. Jika batas ruang tidak ditentukan, daftar dapat mengalami masalah ukuran atau tidak memperoleh ruang gulir yang sesuai. Solusi yang digunakan pada rancangan Flutter adalah membungkus daftar dengan `Expanded` agar daftar mengambil ruang yang tersisa pada halaman dan dapat digulir.
2. **Kelengkapan bukti implementasi dan pengujian aplikasi.** Rancangan halaman dan widget tree sudah disiapkan, tetapi screenshot aplikasi berjalan serta bukti implementasi CRUD lokal belum tercatat pada progres yang tersedia. Solusinya adalah menjalankan aplikasi pada emulator/perangkat atau Chrome, menguji proses tambah, tampil, ubah, dan hapus data, lalu menyimpan screenshot setiap kondisi sebagai bukti. Sesuaikan bagian ini dengan kendala dan langkah yang benar-benar dialami selama pengerjaan.

## 6. Rencana Pengembangan Milestone M5 (REST API)

Pada Milestone M5, APK Catatan direncanakan dikembangkan agar dapat mengambil dan mengirim data melalui REST API. Data yang berpotensi dikelola melalui layanan backend meliputi:

- **Data catatan:** ID catatan, judul, isi, kategori, serta waktu dibuat dan diperbarui.
- **Data kategori:** ID kategori dan nama kategori untuk pengelompokan catatan.
- **Data pengguna (jika autentikasi diterapkan):** identitas akun dan relasi kepemilikan catatan agar data tiap pengguna terpisah.

Layanan backend yang dibutuhkan mencakup endpoint untuk mengambil daftar catatan (`GET`), mengambil detail catatan (`GET`), menambahkan catatan (`POST`), memperbarui catatan (`PUT` atau `PATCH`), dan menghapus catatan (`DELETE`). Jika fitur akun dan sinkronisasi antarperangkat diaktifkan, backend juga perlu menyediakan autentikasi serta otorisasi agar pengguna hanya dapat mengakses catatannya sendiri. Implementasi sinkronisasi antarperangkat tetap berada di luar cakupan versi awal sesuai prioritas M1.

## 7. Refleksi Pembelajaran Tengah Semester

Melalui pengerjaan project ini, saya memahami bahwa arsitektur Flutter dibangun dari susunan widget yang saling membentuk tampilan aplikasi, sehingga pemilihan dan penempatan widget berpengaruh terhadap hasil antarmuka. Saya juga mulai memahami bahwa pengelolaan state diperlukan agar perubahan data, seperti penambahan atau pengubahan catatan, dapat tercermin pada tampilan. Tantangan yang paling terasa adalah mengatur layout daftar menggunakan `ListView.builder` di dalam `Column` agar memperoleh batas ruang yang tepat dan tetap dapat digulir. Pada tahap berikutnya, saya perlu memperdalam pengelolaan state, penyimpanan data lokal, dan integrasi REST API agar aplikasi dapat digunakan dengan alur CRUD yang utuh.
