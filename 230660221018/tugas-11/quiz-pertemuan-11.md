# Quiz Pertemuan 11 — Fitur Perangkat Sesuai Kebutuhan

**Mata Kuliah:** Pemrograman Aplikasi Bergerak  
**Pertemuan:** 11 | **CPMK:** CPMK-3

### Soal 1 — Pemilihan Fitur

Pemilihan fitur perangkat perlu disesuaikan dengan tujuan pengguna dan proses bisnis aplikasi agar fitur yang diterapkan benar-benar memberikan manfaat. Pada aplikasi SIPORA, fitur pemilihan dokumen menggunakan package `file_picker` dipilih karena mahasiswa perlu menyertakan dokumen pendukung ketika mengajukan surat observasi atau penelitian akademik. Fitur ini relevan karena membantu pengguna memilih dokumen dari perangkat tanpa perlu menggunakan fitur perangkat lain yang tidak berkaitan dengan kebutuhan aplikasi.

### Soal 2 — Permission

Permission diperlukan agar aplikasi dapat mengakses sumber daya perangkat sesuai kebijakan sistem operasi dan platform yang digunakan. Ketika permission diminta, aplikasi perlu menangani kondisi izin diberikan, ditolak, atau akses tidak tersedia. Jika izin diberikan, fitur dapat dilanjutkan. Jika ditolak, aplikasi perlu memberikan informasi kepada pengguna dan tidak memaksakan akses. Jika akses tidak tersedia, aplikasi perlu menampilkan pesan yang sesuai atau menyediakan alternatif. Pada SIPORA, akses pemilihan dokumen dilakukan melalui mekanisme file picker pada browser sehingga tidak menggunakan permission kamera atau lokasi.

### Soal 3 — Pembatalan Pemilihan

Nilai `XFile?` yang bernilai `null` menunjukkan bahwa pengguna tidak menghasilkan file yang dipilih, misalnya karena membatalkan proses pemilihan gambar. Kondisi tersebut bukan merupakan error, melainkan kondisi pembatalan yang perlu ditangani. Aplikasi sebaiknya mempertahankan kondisi sebelumnya, tidak memproses file, dan tidak menampilkan pesan error yang tidak diperlukan.

### Soal 4 — Service Layer

Service layer bertanggung jawab mengelola proses penggunaan fitur perangkat, seperti pemanggilan package, pemrosesan hasil, serta penanganan kondisi yang berkaitan dengan fitur tersebut. Pemanggilan package sebaiknya tidak ditulis langsung di widget agar kode lebih terstruktur, mudah dipelihara, dan tidak mencampurkan logika fitur dengan tampilan antarmuka. Pada SIPORA, proses pemilihan dokumen dikelola melalui `dokumen_service.dart`, sedangkan widget form berfokus pada tampilan dan interaksi pengguna.

### Soal 5 — State Fitur Perangkat

State minimal yang perlu ditangani meliputi kondisi awal, proses, berhasil, dibatalkan, dan gagal atau akses ditolak.

- **Berhasil:** Hasil fitur perangkat diterima dan diproses sesuai kebutuhan aplikasi, misalnya menampilkan nama dokumen yang dipilih.
- **Dibatalkan:** Aplikasi tidak memproses hasil dan tetap mempertahankan kondisi sebelumnya tanpa menampilkan error yang tidak diperlukan.
- **Permission ditolak:** Aplikasi memberikan informasi mengenai akses yang ditolak dan tidak melanjutkan proses yang membutuhkan akses tersebut.

Penanganan state tersebut penting agar aplikasi tetap responsif, tidak mengalami kesalahan alur, serta memberikan pengalaman pengguna yang sesuai.