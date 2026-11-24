# Tugas 7: MVP Awal dengan Data Lokal

Identitas

Nama: Nabila Apriliani

NIM: 230660221126

Domain Sistem: Peminjaman Ruangan / Pengajuan Layanan Laboratorium

# Deskripsi Singkat

Aplikasi ini merupakan implementasi MVP (Minimum Viable Product) awal berbasis Flutter yang mengelola data lokal menggunakan StatefulWidget dan setState. Aplikasi mendukung operasi CRUD secara utuh, meliputi pembuatan pengajuan peminjaman ruang baru (Create), menampilkan daftar pengajuan (Read), memperbarui status pengajuan (Update), serta menghapus pengajuan yang disertai dialog konfirmasi AlertDialog (Delete).

# Berkas Pengumpulan

README.md — Deskripsi singkat proyek, refleksi, dan deklarasi penggunaan AI.

model-data.md — Dokumentasi entitas dan struktur data yang diturunkan dari kebutuhan Tugas 4.

catatan-keputusan-data.md — Tabel keputusan perancangan data lokal dan alasannya.

crud-lokal.dart — Kode implementasi CRUD lokal Flutter tanpa package tambahan.

screenshot-daftar.png — Bukti tangkapan layar antarmuka daftar pengajuan.

screenshot-hapus.png — Bukti tangkapan layar dialog konfirmasi hapus data.

# Refleksi

Bagian yang paling sulit dipertahankan konsistensinya adalah memastikan setiap field pada model data benar-benar merujuk pada kebutuhan dokumen Tugas 4 tanpa menambahkan variabel yang tidak diperlukan. Selain itu, menyelaraskan logika pembaharuan state menggunakan id unik pada operasi update dan delete memerlukan ketelitian agar tampilan antarmuka selalu sinkron dengan daftar data lokal. Hal ini disebabkan oleh pentingnya menjaga alur data agar tetap sesuai dengan batasan MVP in-memory tanpa menggunakan pustaka pihak ketiga.

# Deklarasi Penggunaan AI

Deklarasi penggunaan AI: Gemini — membantu menyusun draf dokumentasi Markdown (model-data.md, catatan-keputusan-data.md, dan README.md) serta struktur logika CRUD in-memory pada file crud-lokal.dart; penyesuaian logika visual antarmuka dan verifikasi seluruh kode dilakukan secara mandiri oleh penulis.