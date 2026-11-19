# Tugas 10 — Integrasi API PustakaKu

## 1. Deskripsi
PustakaKu merupakan aplikasi perpustakaan sederhana berbasis Flutter. Pada Tugas 10, aplikasi dikembangkan dengan mengintegrasikan dua endpoint API untuk menggabungkan data anggota dan data peminjaman.

Integrasi dilakukan agar informasi peminjaman dapat ditampilkan bersama identitas anggota yang terkait.

## 2. Endpoint API

| Endpoint | Method | Fungsi |
|---|---|---|
| `https://jsonplaceholder.typicode.com/users` | GET | Mengambil data anggota |
| `https://jsonplaceholder.typicode.com/posts` | GET | Mengambil data peminjaman simulasi |

API menggunakan JSONPlaceholder sebagai sumber data simulasi.

## 3. Model Data

### DataPengguna
Data anggota diambil dari endpoint `/users` dan dipetakan ke model `DataPengguna`.

| Field API | Atribut Model |
|---|---|
| `id` | `id` |
| `name` | `nama` |
| `email` | `email` |
| `phone` | `telepon` |

### DataPeminjaman
Data peminjaman simulasi diambil dari endpoint `/posts` dan dipetakan ke model `DataPeminjaman`.

| Field API | Atribut Model |
|---|---|
| `id` | `id` |
| `userId` | `userId` |
| `title` | `judulBuku` |
| `body` | `deskripsi` |
| `status` | `status` |

Atribut `status` menggunakan nilai default `Menunggu` karena endpoint `/posts` tidak menyediakan informasi status peminjaman.

## 4. Proses Integrasi Data

Integrasi dilakukan dengan menggabungkan data anggota dan peminjaman berdasarkan identifier `userId`.

- Data anggota diperoleh dari endpoint `/users`.
- Data peminjaman diperoleh dari endpoint `/posts`.
- Kedua permintaan dijalankan menggunakan `Future.wait` karena tidak saling bergantung.
- Nilai `userId` pada data peminjaman dicocokkan dengan `id` pada data anggota.
- Hasil penggabungan ditampilkan pada halaman Integrasi Data Peminjaman.

### Diagram Alur Integrasi

```text
             Mulai
               |
       Meminta data API
               |
       +-------+-------+
       |               |
     /users          /posts
       |               |
   DataPengguna    DataPeminjaman
       |               |
       +-------+-------+
               |
       Pencocokan ID
       userId dengan id
               |
       Penggabungan Data
               |
       Menampilkan Data
               |
            Selesai
```

## 5. Penanganan Kondisi

Aplikasi menyediakan beberapa kondisi tampilan:

- Loading: ditampilkan ketika aplikasi sedang mengambil data.
- Success: ditampilkan ketika data berhasil diperoleh dan digabungkan.
- Empty: ditampilkan ketika tidak terdapat data.
- Error: ditampilkan ketika terjadi kegagalan permintaan atau pengolahan data.
- Retry: pengguna dapat mencoba kembali mengambil data melalui tombol Coba Lagi.

Permintaan API menggunakan pemeriksaan status respons, penanganan kesalahan, dan batas waktu permintaan (*timeout*).

## 6. Struktur File

```text
lib/
├── models/
│   ├── data-pengguna.dart
│   └── data-peminjaman.dart
├── services/
│   └── integrasi-api.dart
├── halaman-interaksi.dart
├── halaman-api.dart
├── service-api.dart
└── main.dart
```

## 7. Cara Menjalankan Aplikasi

1. Pastikan Flutter dan Dart sudah terpasang.
2. Buka terminal pada folder proyek.
3. Jalankan perintah:

```bash
flutter pub get
```

4. Jalankan aplikasi:

```bash
flutter run
```

5. Buka halaman Integrasi Data Peminjaman melalui tombol Integrasi API pada aplikasi.

## 8. Keterbatasan API Simulasi

JSONPlaceholder merupakan API simulasi sehingga data yang ditampilkan bukan data peminjaman asli perpustakaan. Data pada endpoint `/posts` digunakan sebagai representasi data peminjaman, sedangkan status peminjaman menggunakan nilai default `Menunggu`.

Dengan demikian, integrasi ini bertujuan untuk menunjukkan proses pengambilan, pemetaan, dan penggabungan data dari dua endpoint API.