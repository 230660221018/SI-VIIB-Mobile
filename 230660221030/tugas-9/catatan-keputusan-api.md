# Catatan Interaksi API — PustakaKu

## 1. Tujuan
Dokumen ini menjelaskan proses integrasi REST API pada aplikasi PustakaKu menggunakan Flutter dan layanan JSONPlaceholder.

## 2. API yang Digunakan
- Nama API: JSONPlaceholder
- Base URL: `https://jsonplaceholder.typicode.com`
- Endpoint GET: `/posts`
- Endpoint POST: `/posts`

## 3. Implementasi GET
Metode GET digunakan untuk mengambil data dari server melalui endpoint `/posts`.

Data yang diterima berupa kumpulan postingan dengan atribut:
- `id`
- `userId`
- `title`
- `body`

Atribut `title` dipetakan menjadi judul, sedangkan `body` dipetakan menjadi deskripsi pada model `DataBuku`.

Hasil pengambilan data ditampilkan dalam bentuk daftar menggunakan widget `ListView.builder`.

## 4. Implementasi POST
Metode POST digunakan untuk mengirim data baru ke endpoint `/posts`.

Data yang dikirim meliputi:
- `userId`
- `title`
- `body`

Pengguna dapat memasukkan judul dan deskripsi melalui form Tambah Data API. Sebelum dikirim, aplikasi memeriksa agar kedua kolom tidak kosong.

Ketika proses pengiriman berlangsung, tombol Kirim dinonaktifkan sementara dan menampilkan indikator loading. Jika berhasil, aplikasi menampilkan notifikasi keberhasilan dan menambahkan respons API ke daftar sementara.

**Catatan:** JSONPlaceholder merupakan layanan API simulasi. Respons POST berhasil dikembalikan oleh server, tetapi data tidak disimpan secara permanen.

## 5. Penanganan Kondisi Aplikasi
| Kondisi | Respons aplikasi |
|---|---|
| Sedang mengambil data | Menampilkan CircularProgressIndicator |
| GET berhasil | Menampilkan daftar data |
| GET gagal | Menampilkan pesan error dan tombol Coba Lagi |
| Form kosong | Menampilkan peringatan |
| POST sedang berlangsung | Tombol Kirim dinonaktifkan dan menampilkan loading |
| POST berhasil | Menampilkan notifikasi berhasil |
| POST gagal | Menampilkan pesan kegagalan |

## 6. Pengujian
Pengujian dilakukan dengan beberapa skenario berikut:

1. Membuka halaman Data Buku dari REST API untuk mengambil data menggunakan GET.
2. Memeriksa apakah daftar data berhasil ditampilkan.
3. Menggunakan tombol muat ulang untuk mengambil data kembali.
4. Membuka form Tambah Data API dan mengisi judul serta deskripsi.
5. Mengirim data menggunakan POST.
6. Memeriksa notifikasi keberhasilan dan data respons yang ditambahkan ke daftar sementara.

## 7. Kesimpulan
Integrasi REST API pada aplikasi PustakaKu telah menerapkan metode GET dan POST. Aplikasi dapat mengambil data dari server, menampilkan hasilnya, serta mengirim data melalui form. Penanganan loading, error, validasi input, dan notifikasi juga diterapkan untuk mendukung interaksi pengguna.