# Refleksi Tugas 10 — Integrasi API PustakaKu

## 1. Bagian Paling Menantang

Bagian yang paling menantang dalam pengerjaan Tugas 10 adalah menggabungkan data dari dua endpoint API yang berbeda. Data anggota dari endpoint `/users` perlu dicocokkan dengan data peminjaman dari endpoint `/posts` menggunakan identifier `userId`.

Selain itu, diperlukan pemahaman mengenai proses pemetaan JSON ke dalam model Dart agar data dapat digunakan dan ditampilkan dengan baik pada aplikasi Flutter.

## 2. Penanganan Kondisi Data Kosong dan Error

Untuk menangani kondisi data kosong, aplikasi menampilkan informasi bahwa data belum tersedia. Sementara itu, apabila permintaan API mengalami kegagalan, aplikasi menampilkan pesan kesalahan dan menyediakan tombol Coba Lagi.

Penanganan tersebut membantu pengguna mengetahui kondisi aplikasi ketika proses pengambilan data berlangsung maupun ketika terjadi kendala koneksi.

## 3. Alasan Memisahkan Service dan Widget

Service dan widget dipisahkan agar kode program lebih terstruktur dan mudah dikelola.

Service bertanggung jawab untuk melakukan permintaan HTTP, memeriksa respons API, mengolah JSON, dan menggabungkan data. Sementara itu, widget bertanggung jawab untuk menampilkan data serta mengatur tampilan loading, success, empty, dan error.

Dengan pemisahan tersebut, proses pengolahan data tidak bercampur dengan kode tampilan aplikasi.

## 4. Penggunaan AI

Dalam pengerjaan tugas ini, AI digunakan sebagai alat bantu untuk memahami materi integrasi API, menyusun model data, membantu penulisan kode, serta mengidentifikasi dan memperbaiki kesalahan program.

Seluruh implementasi tetap diperiksa dan diuji secara langsung menggunakan aplikasi Flutter agar sesuai dengan kebutuhan tugas.