```markdown
# Tugas 10: Integrasi Data dan Proses Bisnis — Pengaduan Fasilitas Kampus

* **Nama:** Nazwa Umaira Nanindia Ramdhani
* **NIM:** 230660221008
* **Kelas:** SI-VIIB
* **Domain Sistem Informasi:** Pengaduan Fasilitas Kampus

---

## 1. Endpoint dan Metode HTTP yang Digunakan

Aplikasi mengintegrasikan tiga sumber data dari REST API simulasi publik (`https://jsonplaceholder.typicode.com`):

| No. | Sumber Data | Metode HTTP | URL Endpoint | Peran dalam Proses Bisnis |
|:---:|:------------|:-----------:|:-------------|:--------------------------|
| 1 | Data Pengguna | `GET` | `https://jsonplaceholder.typicode.com/users` | Menyediakan profil mahasiswa/staf pelapor (`nama`, `email`) |
| 2 | Data Fasilitas | `GET` | `https://jsonplaceholder.typicode.com/comments` | Simulasi master data ruang dan gedung fasilitas kampus |
| 3 | Data Pengajuan | `GET` | `https://jsonplaceholder.typicode.com/posts` | Menyediakan tiket laporan kerusakan fasilitas beserta foreign key |

---

## 2. Pemetaan Field JSON ke Model Dart

### A. Model `DataPengguna` (`lib/models/data_pengguna.dart`)
| Field Dart | Tipe Dart | Key JSON (`GET /users`) | Nilai Default (`??`) |
|:-----------|:----------|:------------------------|:---------------------|
| `id` | `int` | `id` | `0` |
| `nama` | `String` | `name` | `'Pelapor Tidak Diketahui'` |
| `email` | `String` | `email` | `'-'` |
| `unitKerja` | `String` | `company.name` | `'Fakultas Teknologi Informasi'` |

### B. Model `DataFasilitas` (`lib/models/data_fasilitas.dart`)
| Field Dart | Tipe Dart | Key JSON (`GET /comments`) | Nilai Default (`??`) |
|:-----------|:----------|:---------------------------|:---------------------|
| `id` | `int` | `id` | `0` |
| `namaFasilitas` | `String` | `name` | `'Fasilitas Umum'` |
| `lokasiGedung` | `String` | *Turunan dari `id`* | `'Gedung Kuliah 1'` |

### C. Model `DataPengajuan` (`lib/models/data_pengajuan.dart`)
| Field Dart | Tipe Dart | Key JSON (`GET /posts`) | Nilai Default (`??`) |
|:-----------|:----------|:------------------------|:---------------------|
| `id` | `int` | `id` | `0` |
| `userId` | `int` | `userId` | `1` |
| `fasilitasId` | `int` | `fasilitasId` (turunan `id`) | `(id % 10) + 1` |
| `judulKendala` | `String` | `title` | `'Laporan Kerusakan Fasilitas'` |
| `detailKendala` | `String` | `body` | `'Tidak ada rincian kerusakan tambahan.'` |
| `status` | `StatusPengajuan` | `status` / aturan bisnis | `StatusPengajuan.menunggu` |

---

## 3. Identifier Penghubung dan Alasan Penggunaan `Future.wait`

* **Identifier Penghubung:**
  * **`userId`**: Menghubungkan atribut `userId` pada `DataPengajuan` dengan atribut `id` pada `DataPengguna` untuk menampilkan identitas lengkap pelapor.
  * **`fasilitasId`**: Menghubungkan atribut `fasilitasId` pada `DataPengajuan` dengan atribut `id` pada `DataFasilitas` untuk menampilkan nama ruangan dan gedung kampus.
* **Alasan Penggunaan `Future.wait`:**
  Ketiga request (`ambilDaftarPengguna`, `ambilDaftarFasilitas`, dan `ambilDaftarPengajuan`) **tidak saling bergantung satu sama lain** untuk membentuk URL request-nya. Dengan menggunakan `Future.wait`, ketiga request dieksekusi secara **paralel (bersamaan)** sehingga waktu tunggu pemuatan halaman hanya sepanjang durasi request yang paling lambat, bukan akumulasi waktu ketiganya.

---

## 4. Diagram Alur Request dan Response

Diagram lengkap tersedia pada berkas [`diagram-integrasi.md`](./diagram-integrasi.md).

```mermaid
flowchart LR
    H[HalamanIntegrasiPengaduan] --> S[IntegrasiService]
    S --> U[GET /users]
    S --> F[GET /comments]
    S --> P[GET /posts]
    U --> J[Penggabungan via userId & fasilitasId]
    F --> J
    P --> J
    J --> H