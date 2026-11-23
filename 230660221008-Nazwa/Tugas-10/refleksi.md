```markdown
# Refleksi Pembelajaran dan Deklarasi AI — Tugas 10

* **Nama:** Nazwa Umaira Nanindia Ramdhani
* **NIM:** 230660221008
* **Kelas:** SI-VIIB

---

## 1. Bagian Integrasi Data yang Paling Sulit

Bagian integrasi data yang paling menantang adalah menyelaraskan struktur respons dari tiga endpoint simulasi yang berbeda ke dalam satu model tampilan terpadu (`DataPengajuanRingkas`) menggunakan `Future.wait`. Karena API simulasi tidak menyediakan seluruh kolom domain kampus seperti `fasilitasId` dan `status`, perancangan `fromJson` harus menggunakan nilai *default* yang aman agar tidak terjadi kegagalan tipe data (*null type error*) saat menggabungkan relasi `userId` dan `fasilitasId` melalui struktur `Map`.

## 2. Cara Menangani Response Kosong atau Error

Aplikasi memisahkan secara tegas antara **response kosong** (`HTTP 200 OK` dengan daftar data kosong `[]`) dan **error jaringan/server** (`TimeoutException`, `ClientException`, atau kode status `404`/`500`). Ketika daftar data kosong, halaman menampilkan antarmuka status kosong (*empty state*) yang informatif beserta tombol muat ulang tanpa menganggapnya sebagai kerusakan sistem, sedangkan ketika terjadi kegagalan jaringan di dalam blok `try-catch`, aplikasi menampilkan pesan kesalahan yang ramah pengguna disertai tombol **Coba Lagi** untuk memicu request ulang.

## 3. Alasan Pemisahan Service dan Widget

Seluruh pemanggilan `http.get`, eksekusi paralel `Future.wait`, penguraian `jsonDecode`, penggabungan identifier, serta aturan penetapan status proses ditempatkan pada `IntegrasiService` agar method `build()` pada widget tetap ringan dan fokus merender tampilan. Pemisahan ini mencegah terjadinya request jaringan berulang tanpa kendali saat Flutter melakukan *rebuild* UI sekaligus memudahkan pengujian maupun penyesuaian apabila endpoint backend berubah di masa mendatang.

---

## Deklarasi Penggunaan AI

Deklarasi penggunaan AI: Gemini (Google AI) — membantu menjelaskan arsitektur eksekusi paralel `Future.wait`, pemetaan identifier antar-model pada `IntegrasiService`, serta perancangan empat state halaman; implementasi kode, verifikasi `flutter analyze`, pengujian pada target web, dan penyusunan dokumentasi dilakukan serta diverifikasi oleh penulis.