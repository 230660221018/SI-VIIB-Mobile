# Quiz Pertemuan 10 – Integrasi Data dan Proses Bisnis Sistem Informasi

**Nama:** Intan Kartika  
**NIM:** 230660221018  

## 1. Integrasi Data

Integrasi data merupakan proses menggabungkan informasi dari beberapa sumber agar dapat digunakan secara bersamaan dalam satu aplikasi. Contohnya pada project SIPORA, aplikasi mengambil data pengguna dari endpoint `/users` dan data posting simulasi dari endpoint `/posts`. Kedua data tersebut dihubungkan menggunakan identifier `users.id` dan `posts.userId`, sehingga informasi pengguna dapat ditampilkan bersama data yang dimilikinya.

## 2. Future.wait

`Future.wait` digunakan ketika beberapa request API tidak saling bergantung sehingga dapat dijalankan secara bersamaan. Pada SIPORA, endpoint `/users` dan `/posts` dapat diminta secara paralel karena masing-masing dapat diambil tanpa menunggu hasil endpoint lainnya. Sebaliknya, request harus dilakukan secara berurutan apabila request kedua membutuhkan data dari request pertama, misalnya membutuhkan ID pengguna yang baru diperoleh.

## 3. Model dan fromJson

Model `DataPengajuan` membutuhkan field `id`, `userId`, `judul`, `isi`, dan `namaPengguna`. Field `userId` digunakan untuk menghubungkan data pengajuan dengan pengguna, sedangkan `namaPengguna` diperoleh dari hasil pencocokan data pengguna. Method `fromJson` digunakan untuk mengubah JSON menjadi objek Dart. Jika field tidak tersedia atau bernilai null, model dapat memberikan nilai default menggunakan operator `??` agar proses pemetaan data tetap berjalan.

## 4. Service Layer

Service layer bertanggung jawab menangani komunikasi dengan API, mengambil response, mengubah JSON menjadi model, serta melakukan penggabungan data. Sementara itu, widget bertanggung jawab menampilkan data dan mengelola tampilan berdasarkan kondisi proses. Penggabungan data sebaiknya tidak ditulis langsung di dalam widget agar kode lebih terstruktur, mudah dipelihara, dan setiap bagian memiliki tanggung jawab yang jelas.

## 5. Status Halaman

Halaman integrasi data perlu menangani empat kondisi, yaitu loading, data berhasil, data kosong, dan error. Loading ditampilkan ketika aplikasi sedang mengambil data, data berhasil ketika informasi tersedia, data kosong ketika request berhasil tetapi tidak menghasilkan data, dan error ketika terjadi kegagalan seperti masalah koneksi atau respons server. Kondisi data kosong harus dibedakan dari error karena keduanya memiliki penyebab berbeda. Dengan demikian, pengguna dapat memahami keadaan aplikasi dan mengetahui tindakan yang perlu dilakukan, seperti memuat ulang data ketika terjadi error.