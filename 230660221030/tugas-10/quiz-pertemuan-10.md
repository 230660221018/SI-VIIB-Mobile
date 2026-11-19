# Quiz Pertemuan 10 – Integrasi Data dan Proses Bisnis Sistem Informasi

**Nama:** Syifa Nur Insani  
**NIM:** 230660221030

### 1. Integrasi Data

Integrasi data adalah proses menggabungkan data dari beberapa sumber agar dapat digunakan secara bersamaan dalam aplikasi. Contohnya pada PustakaKu, data pengguna dari endpoint `/users` digabungkan dengan data peminjaman dari endpoint `/posts`. Kedua data tersebut dihubungkan menggunakan identifier `userId` pada data peminjaman dan `id` pada data pengguna.

### 2. Future.wait

`Future.wait` digunakan ketika terdapat beberapa request API yang tidak saling bergantung sehingga dapat dijalankan secara bersamaan. Contohnya pada PustakaKu, pengambilan data dari endpoint `/users` dan `/posts`. Sementara itu, request perlu dijalankan secara berurutan apabila request berikutnya membutuhkan hasil dari request sebelumnya.

### 3. Model dan fromJson

Model `DataPengajuan` membutuhkan field seperti `id` sebagai identitas pengajuan dan `userId` sebagai penghubung dengan data pengguna, serta field lain yang berisi informasi pengajuan. Metode `fromJson` digunakan untuk mengubah data JSON menjadi objek Dart. Jika terdapat field yang tidak tersedia pada response API, nilai default dapat diberikan agar proses pengolahan data tetap berjalan.

### 4. Service Layer

Service layer bertanggung jawab mengelola komunikasi dengan API, mulai dari request HTTP, menerima response, parsing JSON, hingga menggabungkan data. Sementara itu, widget bertugas menampilkan data dan mengatur tampilan aplikasi. Penggabungan data sebaiknya dilakukan di service agar kode lebih terstruktur, mudah dikelola, dan tidak mencampurkan proses pengolahan data dengan tampilan.

### 5. Status Halaman

Halaman integrasi data perlu menangani beberapa kondisi, yaitu loading saat data sedang dimuat, success ketika data berhasil ditampilkan, empty ketika data yang diterima kosong, error ketika terjadi kegagalan request, dan retry untuk mencoba mengambil data kembali. Kondisi data kosong harus dibedakan dari error karena data kosong menunjukkan request berhasil tetapi tidak menghasilkan data, sedangkan error menunjukkan adanya kegagalan dalam proses pengambilan data.