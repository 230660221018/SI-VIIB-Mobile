# Tugas 10: Integrasi Data dan Proses Bisnis — CeriaReads
**Nama:** Yelly Ambarwaty  
**NIM:** 230660221033  
**Kelas:** SI-VIIB  

## 1. Endpoint dan Metode HTTP yang Digunakan
| Kebutuhan Proses Bisnis | Metode HTTP | URL Endpoint | Keterangan |
|:---|:---|:---|:---|
| Mengambil data peminjam/anggota | `GET` | `https://jsonplaceholder.typicode.com/users` | Mengambil profil anggota (`id`, `name`, `email`). |
| Mengambil data transaksi pinjam | `GET` | `https://jsonplaceholder.typicode.com/posts` | Mengambil riwayat pengajuan buku (`id`, `userId`, `title`). |

## 2. Tabel Pemetaan Field JSON ke Model Dart
| Model Dart | Field Dart | Tipe Data | Key JSON API | Nilai Default (`??`) |
|:---|:---|:---|:---|:---|
| `DataAnggota` | `id` | `int` | `"id"` | `0` |
| `DataAnggota` | `nama` | `String` | `"name"` | `'Anggota Tanpa Nama'` |
| `DataAnggota` | `email` | `String` | `"email"` | `'-'` |
| `DataPeminjaman` | `id` | `int` | `"id"` | `0` |
| `DataPeminjaman` | `userId` | `int` | `"userId"` | `0` |
| `DataPeminjaman` | `judulBuku` | `String` | `"title"` | `'Judul Buku Tidak Diketahui'` |
| `DataPeminjaman` | `status` | `StatusPeminjaman` | *(Aturan Bisnis)* | `StatusPeminjaman.menunggu` |

## 3. Identifier Penggabungan Data & Penggunaan `Future.wait`
- **Identifier Penghubung:** `userId` pada `DataPeminjaman` dicocokkan dengan `id` pada `DataAnggota` di dalam `IntegrasiService` untuk membentuk objek gabungan `PeminjamanRingkas`.
- **Alasan Penggunaan `Future.wait`:** Request ke `/users` dan `/posts` bersifat independen (tidak saling menunggu hasil satu sama lain untuk membentuk URL). Dengan `Future.wait`, kedua HTTP request dijalankan secara paralel bersamaan sehingga waktu tunggu pemuatan layar berkurang drastis dibanding pemanggilan berurutan.

## 4. Diagram Alur Request dan Response
```mermaid
flowchart TD
    UI[HalamanPeminjamanTerintegrasi] -->|Memanggil| SVC[IntegrasiService]
    SVC -->|Future.wait Paralel| API1[GET /users]
    SVC -->|Future.wait Paralel| API2[GET /posts]
    API1 -->|JSON List| M1[List DataAnggota]
    API2 -->|JSON List| M2[List DataPeminjaman]
    M1 & M2 -->|Gabung via userId + Aturan Status| VM[List PeminjamanRingkas]
    VM -->|Render UI| UI

## 5. Dokumentasi Hasil
<img width="1917" height="1016" alt="screenshot-hasil tugas 10" src="https://github.com/user-attachments/assets/e1f6c70c-4982-456e-afd1-df6576fe3ab5" />

