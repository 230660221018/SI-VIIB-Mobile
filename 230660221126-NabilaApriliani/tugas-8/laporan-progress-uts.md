---

### 2. Buat file: `laporan-progress-uts.md`
Salin seluruh isi ini ke dalam file `laporan-progress-uts.md`:

```markdown
# Laporan Progress Project UTS (Milestone M4)

| | |
|:--|:--|
| **Nama** | Nabila Apriliani |
| **NIM** | [230660221126] |
| **Kelas** | SI-VIIB |
| **Domain SI** | Sistem Informasi Pengajuan Peminjaman Ruang Laboratorium |
| **Judul Aplikasi** | Aplikasi Mobile Pengajuan Peminjaman Ruang |
| **Tautan Repository** | Folder `tugas-8` di repository GitHub kelas |

---

## 1. Ringkasan Eksekutif Project
Aplikasi ini dikembangkan untuk mendigitalisasi proses pengajuan peminjaman ruangan atau laboratorium di lingkungan kampus yang sebelumnya masih berjalan secara manual melalui pengisian formulir fisik di loket. Pengguna utama aplikasi ini adalah mahasiswa yang ingin mengajukan jadwal peminjaman secara cepat dan transparan. Solusi berbasis *mobile* dipilih agar mahasiswa dapat mengajukan permohonan dan memantau status verifikasi langsung melalui gawai mereka kapan saja dan di mana saja.

## 2. Ketercapaian Milestone (M1 s.d. M3)

| Milestone | Deliverable | Status (Selesai / Sebagian) | Catatan / Bukti |
|:----------|:------------|:----------------------------|:----------------|
| M1: Kebutuhan | Dokumen kebutuhan + User Flow | Selesai | Dokumen analisis kebutuhan pada Tugas 4 |
| M2: UI/UX | Wireframe + Navigasi | Selesai | Desain prototype dan alur navigasi pada Tugas 5 & 6 |
| M3: MVP Awal | Model data + CRUD lokal | Selesai | File `crud-lokal.dart` dan model data pada Tugas 7 |

## 3. Matriks Kebutuhan ke Implementasi

| ID Kebutuhan | Deskripsi Kebutuhan | Prioritas MoSCoW | Halaman Pemenuh | Operasi Data Terkait |
|:-------------|:-------------------|:----------------:|:----------------|:---------------------|
| F-01 | Mengajukan peminjaman ruang laboratorium | Must | Halaman Form / Dialog Tambah | Create |
| F-02 | Melihat daftar seluruh riwayat pengajuan | Must | Halaman Utama (Daftar) | Read |
| F-03 | Melihat dan memperbarui status verifikasi pengajuan | Should | Halaman Utama (Menu Aksi) | Update |
| F-04 | Menghapus data pengajuan yang salah atau dibatalkan | Could | Halaman Utama (Dialog Hapus) | Delete |

## 4. Tangkapan Layar Aplikasi Berjalan
1. `screenshot-daftar.png` — Menampilkan halaman utama daftar data pengajuan.
2. `screenshot-form.png` — Menampilkan form pengisian data dengan validasi input.
3. `screenshot-hapus.png` — Menampilkan dialog konfirmasi aksi (ubah status / hapus data).

## 5. Kendala dan Solusi Teknis
1. **Kendala:** Penataan tata letak (layout) `ListView.builder` di dalam widget `Column` sempat memicu error *vertical viewport was given unbounded height*.
   - **Solusi:** Membungkus `ListView` menggunakan widget `Expanded` atau mengatur properti agar tinggi komponen menyesuaikan kontainer dengan benar.
2. **Kendala:** Pengelolaan state lokal agar perubahan data (tambah dan hapus) langsung termuat ulang secara dinamis di antarmuka tanpa error.
   - **Solusi:** Menerapkan fungsi `setState()` secara tepat di dalam struktur `StatefulWidget` setiap kali operasi *Create*, *Update*, atau *Delete* dipicu.

## 6. Rencana Pengembangan Milestone M5 (REST API)
Pada paruh kedua semester (Milestone M5), pengembangan akan dilanjutkan dengan menghubungkan aplikasi ke backend server menggunakan *REST API*. Data statis berbasis memori lokal (*in-memory*) akan digantikan dengan proses pengambilan data secara asinkron (*fetching*) menggunakan *package* `http` serta penanganan format data JSON untuk sinkronisasi data pengajuan secara real-time.

## 7. Refleksi Pembelajaran Tengah Semester
Pembangunan aplikasi mobile ini memberikan pemahaman mendalam mengenai pentingnya merancang struktur *widget* Flutter secara modular dan terorganisasi. Pengelolaan state menggunakan `setState` melatih ketelitian dalam menjaga konsistensi alur data lokal dari antarmuka pengguna. Tantangan terbesar terletak pada penyelarasan antara analisis kebutuhan pengguna di awal dengan implementasi teknis di kode program, yang menuntut kedisiplinan desain sistem.

## 8. Deklarasi Penggunaan AI
Deklarasi penggunaan AI: Gemini — membantu merumuskan struktur laporan kemajuan, merapikan dokumentasi, serta menjelaskan penanganan kendala teknis; perbaikan kode, pengujian, dan verifikasi akhir dilakukan sepenuhnya oleh penulis.