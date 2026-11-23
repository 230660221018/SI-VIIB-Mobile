# Catatan Keputusan Data — Sistem Informasi Pengajuan Peminjaman

Dokumen ini mencatat berbagai keputusan perancangan data lokal yang disesuaikan dengan kebutuhan pengguna pada dokumen Tugas 4.

| Keputusan | Pilihan Anda | Alasan (merujuk kebutuhan) |
| :--- | :--- | :--- |
| **Field model** | Menggunakan field `id`, `ruang`, `tanggal`, `jam`, dan `status` pada entitas `DataPengajuan`. | Seluruh field diturunkan langsung dari kebutuhan F-01 (mengisi form pengajuan peminjaman) dan F-03 (melihat status) agar data yang dikelola sesuai dengan proses bisnis. |
| **Kunci data (`id`)** | Menggunakan `id` unik berbasis waktu (`DateTime.now().millisecondsSinceEpoch.toString()`). | Diperlukan sebagai kunci yang stabil dan aman untuk operasi pembaruan (*Update*) serta penghapusan (*Delete*), guna menghindari kesalahan acuan indeks daftar[cite: 4]. |
| **Operasi CRUD per kebutuhan** | Create (F-01), Read (F-03), Update (F-02), dan Delete (F-01/perbaikan data). | Memastikan setiap kebutuhan *Must have* pada dokumen analisis memiliki fungsi CRUD lokal yang mengeksekusinya secara langsung[cite: 4]. |
| **Keputusan persistensi** | Menggunakan `List` in-memory dengan `setState` (tanpa package tambahan). | Memenuhi cakupan MVP awal untuk berjalan secara responsif di DartPad atau browser tanpa konfigurasi tambahan yang rumit[cite: 4]. |