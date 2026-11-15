# Refleksi Tugas 10 – Integrasi Data dan Proses Bisnis

Selama mengerjakan Tugas 10, bagian yang cukup menantang adalah menggabungkan data dari dua endpoint API menggunakan identifier yang sesuai. Saya menggunakan `Future.wait` agar kedua request dapat dijalankan secara bersamaan, kemudian mencocokkan `users.id` dengan `posts.userId`.

Untuk menangani kondisi data kosong dan error, saya menerapkan pengecekan pada `FutureBuilder` serta menyediakan tombol untuk mencoba kembali. Pemisahan model, service, dan tampilan juga membantu membuat kode lebih terstruktur dan mudah dipahami.

**Penggunaan AI:** Saya menggunakan AI sebagai alat bantu untuk memahami materi. Setiap bagian implementasi tetap saya pelajari dan sesuaikan dengan kebutuhan tugas.