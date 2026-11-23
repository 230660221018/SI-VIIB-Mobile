# Catatan Integrasi API — Tugas 9 (CeriaReads)
**Nama:** Yelly Ambarwaty  
**NIM:** 230660221033  

## 1. Endpoint yang Digunakan

| Operasi | Metode HTTP | URL Endpoint | Payload Request |
|:--------|:-----------|:-------------|:----------------|
| Ambil daftar pengajuan | GET | `https://jsonplaceholder.typicode.com/posts` | — |
| Kirim pengajuan baru | POST | `https://jsonplaceholder.typicode.com/posts` | `{"title": "Judul Buku", "body": "Nama & Durasi", "userId": 1}` |

## 2. Struktur Model Data (`DataPengajuanApi`)

| Field | Tipe Dart | Key JSON | Sumber Nilai |
|:------|:----------|:---------|:-------------|
| `id` | `int` | `"id"` | Dihasilkan otomatis oleh Server |
| `judulBuku` | `String` | `"title"` | Input Form Pengguna / Server |
| `keteranganPinjam` | `String` | `"body"` | Input Form Pengguna / Server |

## 3. Penanganan Error (Error Handling)
1. **Isolasi dengan `try-catch`:** Seluruh pemanggilan `http.get` dan `http.post` di dalam kelas `CeriaReadsApiService` dibungkus blok `try-catch` agar kegagalan jaringan tidak menyebabkan aplikasi berhenti mendadak (*crash*).
2. **Batas Waktu (`timeout`):** Diterapkan `.timeout(const Duration(seconds: 10))` untuk mencegah indikator loading berputar tanpa henti apabila server tidak merespons.
3. **Pengecekan Status Code & Exception Spesifik:** Memeriksa kode status `200` (GET) dan `201` (POST), serta menangkap `SocketException` (internet mati) dan `TimeoutException` untuk dikonversi menjadi pesan error yang mudah dipahami pengguna disertai tombol **"Coba Lagi"** pada layar.