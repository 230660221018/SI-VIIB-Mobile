# Jawaban Quiz Pertemuan 10 — Integrasi Data dan Proses Bisnis SI

| | |
|:--|:--|
| **Nama** | Yelly Ambarwaty |
| **NIM** | 230660221033 |
| **Kelas** | SI-VIIB |
| **Project Acuan** | CeriaReads (Sistem Layanan Peminjaman Buku Panti Baca Ceria) |

---

## Soal 1 — Integrasi Data
Integrasi data pada aplikasi mobile merupakan proses menggabungkan informasi dari beberapa *endpoint* REST API yang terpisah ke dalam satu kesatuan tampilan proses bisnis yang utuh[cite: 15, 16]. Dalam perancangan basis data Sistem Informasi yang ternormalisasi, tabel master dan tabel transaksi selalu dipisah agar tidak terjadi duplikasi data (*redundancy*), sehingga *backend* pun menyediakan *endpoint* yang terpisah.

Pada aplikasi **CeriaReads** yang saya kembangkan, data profil anggota peminjam diambil dari *endpoint* `/users`, sedangkan data riwayat transaksi peminjaman buku diambil dari *endpoint* `/posts`. Kedua sumber data ini dihubungkan melalui *foreign key* atau *identifier* berupa **`userId`** yang tercatat pada data peminjaman untuk dicocokkan dengan **`id`** pada data anggota. Hasil penggabungan ini membuat aplikasi bisa menampilkan nama asli peminjam beserta judul buku yang dipinjam dalam satu kartu informasi yang mudah dibaca petugas maupun anggota.

## Soal 2 — `Future.wait`
`Future.wait` digunakan ketika aplikasi perlu mengeksekusi dua atau lebih *HTTP request* secara paralel (bersamaan) karena permintaan-permintaan tersebut bersifat independen dan tidak saling menunggu satu sama lain[cite: 15]. Pada CeriaReads, pemanggilan `GET /users` dan `GET /posts` dibungkus menggunakan `Future.wait` karena URL `/posts` tidak membutuhkan parameter dari hasil `/users` terlebih dahulu. Dengan cara ini, waktu muat layar jauh lebih efisien dibandingkan harus menunggu request pertama selesai baru menjalankan request kedua.

Sebaliknya, request wajib dijalankan secara berurutan (sekuensial dengan `await` satu per satu) apabila output dari request pertama dibutuhkan sebagai parameter input untuk membentuk request kedua[cite: 15]. Sebagai contoh, jika sistem mewajibkan login terlebih dahulu untuk mendapatkan token atau ID pengguna aktif, lalu nilai `userId` tersebut baru dipakai untuk memanggil *endpoint* spesifik seperti `GET /users/{userId}/peminjaman`.

## Soal 3 — Model dan `fromJson`
Untuk menghubungkan data pengguna dan transaksi peminjaman, model `DataPeminjaman` minimal membutuhkan atribut `id` (sebagai kunci utama transaksi), `userId` (sebagai *identifier* relasi ke tabel pengguna), `judulBuku` (informasi objek yang dipinjam), serta `status` (untuk melacak alur proses bisnis seperti menunggu, disetujui, atau ditolak)[cite: 15, 16].

Di dalam *factory constructor* `fromJson`, setiap atribut dipetakan menggunakan *type casting* eksplisit yang dipadukan dengan operator *null-coalescing* (`??`) untuk menetapkan nilai bawaan (*default value*)[cite: 14, 15]. Misalnya dengan menulis `userId: json['userId'] as int? ?? 0` atau `status: json['status'] as String? ?? 'menunggu'`[cite: 15]. Pendekatan ini sangat krusial untuk mencegah *runtime error* (*type cast exception*) apabila server sewaktu-waktu mengirimkan nilai `null` atau ada *field* yang terlewat pada *payload* JSON[cite: 14, 15].

## Soal 4 — Service Layer
Lapisan *service* (`IntegrasiService`) memegang tanggung jawab penuh di balik layar, mulai dari mengeksekusi permintaan jaringan (`http.get`), menerapkan batas waktu (*timeout*), menangani pengecualian (*try-catch*), mengurai string JSON menjadi objek model Dart, hingga menggabungkan relasi antar-model[cite: 14, 15]. Sementara itu, lapisan *widget* UI hanya fokus mengatur tata letak visual, merespons interaksi pengguna, dan merender ulang tampilan berdasarkan *state* akhir yang disuplai oleh *service*[cite: 15].

Logika penggabungan data tidak boleh ditulis langsung di dalam *widget* (apalagi di dalam method `build`) karena melanggar prinsip *Separation of Concerns*[cite: 14, 15]. Method `build` pada Flutter dapat tereksekusi berulang kali setiap kali ada perubahan *state* kecil di layar; jika pemanggilan API dan perulangan pencocokan data ditaruh di sana, aplikasi akan melakukan request berulang kali yang memboroskan kuota dan membuat antarmuka *lag*. Selain itu, pemisahan ini memudahkan proses *maintenance*—jika struktur JSON dari *backend* berubah, perbaikan cukup dilakukan di satu file *service* tanpa mengganggu kode tampilan.

## Soal 5 — Status Halaman
Halaman yang menampilkan data hasil integrasi API wajib mengelola empat kondisi utama, yaitu **Loading** (saat request sedang berjalan), **Sukses** (saat data berhasil dimuat dan siap ditampilkan), **Data Kosong** (saat koneksi berhasil namun tidak ada baris data yang ditemukan), dan **Error** (saat terjadi kegagalan jaringan atau *server down*)[cite: 14, 15].

Kondisi **data kosong** harus dibedakan secara tegas dari kondisi **error** karena keduanya merepresentasikan situasi sistem yang bertolak belakang[cite: 15, 16]. Data kosong berarti komunikasi client–server berjalan normal (status HTTP `200 OK`), hanya saja memang belum ada riwayat peminjaman yang masuk atau sesuai dengan filter pengguna. Sebaliknya, kondisi error menandakan adanya gangguan teknis seperti internet terputus, *timeout*, atau kesalahan server (`500`)[cite: 15]. Jika keduanya disamakan, pengguna akan kebingungan karena mengira aplikasi sedang rusak padahal datanya memang belum tersedia, atau sebaliknya pengguna tidak diberikan tombol **"Coba Lagi"** (*retry*) saat koneksi internet mereka sebenarnya sedang bermasalah[cite: 14, 15].