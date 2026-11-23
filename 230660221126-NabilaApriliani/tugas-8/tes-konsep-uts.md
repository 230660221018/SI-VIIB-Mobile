# Tes Konsep UTS — Nabila Apriliani

## Soal 1 — Konsep Aplikasi Bergerak dalam SI (CPMK-1)

1. Karakteristik: **Portabilitas & Aksesibilitas Tinggi (Portability)**
   Contoh penerapan: Mahasiswa dapat membuat pengajuan peminjaman ruang laboratorium atau mengecek status persetujuan kapan saja langsung dari smartphone tanpa harus mendatangi loket fisik administrasi kampus.

2. Karakteristik: **Notifikasi Real-time (Push Notifications)**
   Contoh penerapan: Sistem dapat secara otomatis mengirimkan pemberitahuan langsung ke layar perangkat mahasiswa ketika pengajuan ruangan disetujui atau ditolak oleh pihak pengelola laboratorium.

3. Karakteristik: **Sesi Interaksi Singkat & Berfokus (Micro-interactions)**
   Contoh penerapan: Antarmuka dirancang cepat dan efisien sehingga mahasiswa cukup mengisi nama ruang, tanggal, dan jam peminjaman dalam hitungan detik melalui formulir ringkas di aplikasi.

---

## Soal 2 — Dasar Pemrograman Dart (CPMK-1)

- `List<String> daftarSurat = []`: Deklarasi variabel koleksi dinamis berjenis list/array yang hanya dapat menyimpan elemen berupa teks (`String`) dengan kondisi awal kosong.
- `Parameter String jenis`: Parameter masukan pada fungsi yang menerima teks nama jenis surat atau ruangan yang akan ditambahkan ke koleksi.
- `jenis.isEmpty`: Properti boolean untuk mengecek apakah variabel `jenis` berupa teks kosong tanpa karakter.
- `return pada kondisi error`: Penghentian alur eksekusi fungsi secara dini (*early return*) apabila validasi gagal, mencegah data kosong masuk ke daftar.
- `daftarSurat.add(jenis)`: Metode untuk menambahkan data `jenis` baru ke urutan paling akhir dari koleksi `daftarSurat`.
- `Perulangan for`: Kontrol alur iterasi untuk mengakses dan menampilkan seluruh item di dalam `daftarSurat` secara berurutan berdasarkan indeksnya.

**Kesalahan umum bila validasi `isEmpty` dihapus:**
Aplikasi akan tetap mengizinkan data teks kosong (`""`) masuk ke dalam daftar, yang menyebabkan tampilan antarmuka memuat kartu/list kosong tanpa informasi sehingga menurunkan kualitas data.

---

## Soal 3 — Struktur Flutter dan Widget (CPMK-1)

- `MaterialApp`: Widget utama (*root*) yang menyediakan konfigurasi tema dasar, gaya desain Material Design, dan manajemen rute navigasi aplikasi.
- `Scaffold`: Widget penata struktur tata letak standar halaman Material Design yang menyediakan area untuk `appBar`, `body`, dan `floatingActionButton`.
- `AppBar`: Komponen bilah navigasi teratas yang menampilkan judul halaman dan tombol aksi kontekstual.
- `Column`: Widget tata letak yang menyusun child widget secara vertikal dari atas ke bawah.
- `Text`: Widget untuk menampilkan string teks ke antarmuka layar.
- `ListView.builder`: Widget pembuat daftar berulang yang efisien dalam mengolah data berjumlah banyak secara dinamis (*lazy loading*).

**Masalah bila `ListView.builder` di dalam `Column` tanpa `Expanded`:**
Akan terjadi error *Unbounded Height* (*Vertical viewport was given unbounded height*).
- **Penyebab:** `Column` memberikan tinggi tak terbatas ke bawah, sedangkan `ListView.builder` mencoba mengambil ruang tak terbatas secara vertikal, menyebabkan bentrok tata letak.
- **Perbaikan:** Membungkus `ListView.builder` dengan widget `Expanded` agar daftar hanya menggunakan sisa ruang vertikal yang tersedia di dalam `Column`.

---

## Soal 4 — Analisis Kebutuhan dan User Flow (CPMK-2)

### Klasifikasi dan Prioritas:

| No. | Permintaan | Fungsional/Nonfungsional | Prioritas MoSCoW | Alasan |
|:---:|:-----------|:-------------------------|:----------------:|:-------|
| 1 | "Saya ingin mengajukan peminjaman ruang laboratorium." | Fungsional | Must | Merupakan proses bisnis inti dari aplikasi. Tanpa fitur ini aplikasi tidak berfungsi. |
| 2 | "Saya ingin melihat status pengajuan saya." | Fungsional | Must | Pengguna membutuhkan umpan balik untuk mengetahui hasil dari proses verifikasi pengajuan. |
| 3 | "Saya ingin menerima notifikasi saat pengajuan disetujui." | Fungsional | Should | Meningkatkan kenyamanan pengguna, namun aplikasi masih dapat berjalan tanpa notifikasi instan. |

### User flow untuk kebutuhan Must:
1. Pengguna membuka aplikasi dan masuk ke Halaman Utama.
2. Pengguna menekan tombol Tambah Pengajuan (+).
3. Sistem menampilkan Formulir Pengajuan.
4. Pengguna mengisi data ruang, tanggal, dan jam peminjaman.
5. Pengguna menekan tombol Simpan.
6. Sistem memvalidasi input, menyimpan data, dan mengarahkan kembali ke Halaman Utama.
7. Data pengajuan baru tampil pada daftar dengan status awal "menunggu".

---

## Soal 5 — UI/UX Mobile (CPMK-2)

1. **Prinsip:** *Touch Target Size & Spacing*
   - Keputusan desain: Membuat tombol aksi dan kartu daftar memiliki area sentuh minimal 48x48 dp serta memberikan jarak antar-kartu yang cukup.
   - Alasan: Mencegah kesalahan ketuk (*accidental tap*) saat pengguna berinteraksi menggunakan satu tangan pada layar sentuh.

2. **Prinsip:** *Visual Hierarchy & Scannability*
   - Keputusan desain: Menggunakan pembedaan bobot teks (bold untuk nama ruang) dan indikator warna status (hijau disetujui, oranye menunggu).
   - Alasan: Memudahkan pengguna memindai (*scan*) informasi status pengajuan secara cepat tanpa perlu membaca seluruh detail teks.

3. **Prinsip:** *Progressive Disclosure*
   - Keputusan desain: Menampilkan ringkasan data pada kartu daftar utama dan menyembunyikan aksi sekunder (Ubah/Hapus) di dalam menu pop-up titik tiga (`PopupMenuButton`).
   - Alasan: Menjaga antarmuka tetap bersih (*uncluttered*) dan sesuai dengan layar mobile yang terbatas.

---

## Soal 6 — Navigasi dan Interaksi (CPMK-2)

### Metode navigasi dan kapan digunakan:
- `push`: Menambahkan halaman baru ke atas tumpukan (*stack*) navigasi. Digunakan saat berpindah dari halaman daftar ke form pengajuan.
- `pushNamed`: Menambahkan halaman baru berdasarkan rute nama terdaftar. Digunakan untuk navigasi antarhalaman yang terstruktur secara global.
- `pop`: Menghapus halaman teratas dari tumpukan rute. Digunakan untuk kembali ke halaman sebelumnya setelah form berhasil disimpan atau dibatalkan.

### Pengiriman data jenis surat/ruang ke halaman form:
Data dikirimkan melalui konstruktor kelas halaman tujuan (*constructor passing*), atau diteruskan sebagai argumen dalam fungsi navigasi.

### Feedback setelah form dikirim:
Menggunakan `SnackBar` yang muncul di bagian bawah layar selama beberapa detik untuk mengonfirmasi bahwa pengajuan berhasil disimpan.

---

## Soal 7 — Model Data dan State (CPMK-3)

- **Mengapa setiap field bersifat final:** Menerapkan prinsip *immutability* (kekekalan data) agar status objek tidak diubah secara tidak sengaja dari luar, sehingga mengontrol perubahan state secara terprediksi.
- **Mengapa id wajib ada:** Sebagai pengenal unik (*primary key*) untuk membedakan antar-record data meskipun memiliki konten nama ruang atau tanggal yang identik.

- **Perbedaan StatelessWidget dan StatefulWidget:** `StatelessWidget` bersifat statis tanpa perubahan state internal, sedangkan `StatefulWidget` dapat menyimpan data yang dapat berubah secara dinamis selama siklus hidup aplikasi.
- **Halaman daftar menggunakan:** `StatefulWidget`
- **Alasan:** Halaman daftar perlu merender ulang tampilan secara dinamis saat terjadi penambahan, pembaruan, atau penghapusan data.

- **Fungsi setState:** Memberitahu kerangka kerja (*framework*) Flutter bahwa ada perubahan pada state lokal, sehingga Flutter akan mengeksekusi ulang metode `build()` untuk memperbarui antarmuka.
- **Apa yang terjadi bila data ditambah tanpa setState:** Data di dalam list memori akan bertambah, tetapi tampilan UI di layar tidak akan berubah/merender ulang sampai terjadi *trigger* pembaruan lainnya.

---

## Soal 8 — CRUD Lokal (CPMK-3)

| Operasi | Method List / mekanisme |
|:--------|:------------------------|
| Create | `List.add()` |
| Read | `ListView.builder` / `List[index]` |
| Update | `List.indexWhere()` lalu mengganti elemen indeks tersebut |
| Delete | `List.removeWhere()` berdasarkan matching `id` |

- **Mengapa id digunakan sebagai kunci update dan delete:** `id` bersifat unik dan terikat permanen pada entitas data tersebut.
- **Konsekuensi bila index digunakan sebagai kunci:** Jika daftar mengalami perubahan urutan (*sorting*) atau penyaringan (*filtering*), indeks elemen akan bergeser. Menghapus/mengubah data berdasarkan indeks dapat menyebabkan salah hapus pada record data lain.

---

## Soal 9 — Persistensi Data Lokal (CPMK-3)

- **Perbedaan in-memory dan persistensi:** Storage *in-memory* hanya menyimpan data di RAM sementara yang akan hilang ketika aplikasi ditutup (*reset*), sedangkan persistensi (`shared_preferences`) menyimpan data ke penyimpanan internal perangkat sehingga data tetap tersimpan meskipun aplikasi di-restart.

- **Mengapa operasi shared_preferences asinkron (Future):** Karena proses membaca/menulis ke memori fisik perangkat memerlukan waktu I/O. Sifat asinkron mencegah *UI freeze* (layar macet).
- **Apa yang terjadi bila await diabaikan:** Eksekusi kode akan langsung berlanjut ke baris berikutnya sebelum proses penyimpanan selesai, yang berpotensi menyebabkan data belum sempat tersimpan saat dibaca kembali.

- **Contoh situasi in-memory sudah cukup:** Pengujian cepat MVP/prototype, pencarian sementara, atau state filter antarmuka.
- **Contoh situasi persistensi mutlak diperlukan:** Menyimpan token autentikasi login pengguna, preferensi tema aplikasi, atau riwayat transaksi penting.

---

## Soal 10 — Integrasi Konsep Lintas Pertemuan (CPMK-1 s.d. CPMK-3)

1. **Arsitektur:**
   Aplikasi Mobile berjalan sebagai *client* yang mengelola state antarmuka dan *cache* lokal. Penyimpanan lokal menyimpan data sementara secara *offline*, sedangkan backend Sistem Informasi bertindak sebagai penyedia data utama via REST API untuk sinkronisasi basis data pusat.

2. **Kebutuhan & Alur:**
   - Dua kebutuhan *Must have*: (1) Meminjam buku perpustakaan, (2) Melihat riwayat peminjaman.
   - *Alur Pengguna*: Buka aplikasi -> Pilih buku pada Katalog -> Klik "Pinjam" -> Isi Durasi -> Konfirmasi -> Data masuk ke Riwayat Peminjaman.

3. **Struktur Komponen:**
   - `MaterialApp` -> `Scaffold` -> `BottomNavigationBar` untuk berpindah antara `HalamanKatalog` dan `HalamanRiwayat`.
   - Navigasi menggunakan `Navigator.push` untuk membuka `HalamanFormPeminjaman`.

4. **Data & State:**
   ```dart
   class Buku {
     final String id;
     final String judul;
     final String pengarang;
     final bool isDipinjam;

     const Buku({
       required this.id,
       required this.judul,
       required this.pengarang,
       required this.isDipinjam,
     });
   }