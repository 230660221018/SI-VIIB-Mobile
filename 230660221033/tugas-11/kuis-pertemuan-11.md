# Jawaban Quiz Pertemuan 11 — Fitur Perangkat Sesuai Kebutuhan

| | |
|:--|:--|
| **Nama** | Yelly Ambarwaty |
| **NIM** | 230660221033 |
| **Kelas** | SI-VIIB |
| **Project Acuan** | CeriaReads (Sistem Layanan Peminjaman Buku Panti Baca Ceria) |

---

## Soal 1 — Pemilihan Fitur
Pemilihan fitur perangkat harus selalu berangkat dari analisis alur proses bisnis dan kebutuhan aktor, bukan sekadar menambahkan banyak *package* ke dalam aplikasi[cite: 20, 21]. Kita perlu memetakan siapa yang memakai fitur tersebut, masalah operasional apa yang diselesaikan, serta data keluaran (*output*) apa yang dibutuhkan sistem untuk melanjutkan transaksi[cite: 19, 20].

Pada aplikasi **CeriaReads**, fitur perangkat yang dipilih adalah **Kamera dan Galeri** (`image_picker`). Alasannya, dalam proses peminjaman buku di komunitas Panti Baca Ceria, relawan maupun anggota peminjam perlu melampirkan bukti foto kondisi fisik sampul dan halaman buku sebelum transaksi disetujui. Data keluaran berupa berkas foto ini menjadi bukti audit yang objektif agar tidak terjadi perdebatan apabila buku kembali dalam keadaan rusak atau sobek.

## Soal 2 — Permission
Fitur perangkat seperti kamera, galeri, atau lokasi mengakses data pribadi dan perangkat keras pengguna, sehingga sistem operasi menerapkan mekanisme *permission* (izin akses) untuk melindungi privasi dan keamanan pengguna. Aplikasi tidak boleh berasumsi bahwa izin tersebut selalu otomatis diberikan[cite: 20].

Ada tiga kondisi siklus *permission* yang wajib ditangani aplikasi[cite: 20, 21]:
1. **Saat diminta (*Requested*):** Aplikasi menampilkan dialog sistem dan menunggu keputusan pengguna secara asinkron tanpa membekukan layar.
2. **Saat ditolak (*Denied*):** Aplikasi menangkap pengecualian (seperti `PlatformException`), lalu menampilkan pesan edukatif yang menjelaskan mengapa izin kamera dibutuhkan beserta panduan mengaktifkannya kembali di pengaturan perangkat/browser[cite: 20].
3. **Saat tidak tersedia (*Unavailable/Restricted*):** Misalnya perangkat tidak memiliki modul kamera atau diblokir kebijakan sistem, sehingga aplikasi harus memberikan jalur alternatif (seperti memilih foto dari galeri) atau pesan pemberitahuan yang jelas.

## Soal 3 — Pembatalan Pemilihan
Ketika pengguna memanggil pemilih gambar (`pickImage`) dan nilai kembalian `XFile?` bernilai `null`, hal tersebut **bukan merupakan error sistem**, melainkan penanda bahwa pengguna secara sadar membatalkan aksi (misalnya menekan tombol kembali atau menutup dialog pemilih file tanpa memilih gambar)[cite: 20, 21].

Aplikasi harus merespons kondisi `null` ini secara anggun (*graceful*) dengan **mempertahankan *state* atau pratinjau foto sebelumnya** yang sudah ada di layar[cite: 20]. Aplikasi tidak boleh menghapus data yang sudah diisi sebelumnya ataupun memunculkan layar peringatan merah seolah-olah aplikasi sedang rusak; cukup berikan pemberitahuan singkat (seperti `SnackBar`) bahwa pemilihan foto dibatalkan.

## Soal 4 — Service Layer
Pada integrasi fitur perangkat, lapisan *service* (`LampiranFotoService`) bertanggung jawab membungkus pemanggilan *package* pihak ketiga (`image_picker`), melakukan validasi awal seperti mengecek ukuran maksimal file, serta menerjemahkan *exception* teknis dari sistem operasi menjadi pesan yang terstruktur[cite: 20, 21].

Pemanggilan *package* dan pengelolaan *permission* tidak boleh ditulis langsung di dalam *widget* karena *widget* seharusnya hanya fokus pada tata letak visual dan perubahan tampilan (*state* UI)[cite: 20]. Jika logika perangkat keras dicampur ke dalam *widget*, kode tampilan akan menjadi rumit, sulit diuji secara terpisah, dan menyulitkan perawatan apabila suatu saat kita ingin mengganti *package* atau menyesuaikan perbedaan perilaku antara platform Android dan Web[cite: 20].

## Soal 5 — State Fitur Perangkat
Minimal ada empat kondisi (*state*) yang wajib ditangani antarmuka saat mengoperasikan fitur perangkat: **Loading** (saat gambar sedang diproses/dibaca dari memori), **Berhasil** (saat `XFile` valid diperoleh), **Dibatalkan** (saat hasil bernilai `null`), dan **Permission Ditolak / Error** (saat akses diblokir atau perangkat gagal)[cite: 20, 21].

Perlakuan pada ketiganya harus dibedakan secara tegas[cite: 20, 21]:
- **Kondisi Berhasil:** Mengubah *state* utama dengan menyimpan data foto baru dan merender komponen pratinjau gambar beserta informasi nama serta ukuran filenya di layar[cite: 20].
- **Kondisi Dibatalkan:** Tidak mengubah data utama (mempertahankan kondisi layar sebelum tombol ditekan) dan tidak memunculkan peringatan kesalahan[cite: 20].
- **Kondisi Permission Ditolak:** Menampilkan indikator peringatan (seperti ikon kamera tercoret), menjelaskan alasan perlunya izin akses kepada pengguna, serta menyediakan tombol **"Coba Lagi"** agar pengguna dapat memicu ulang proses setelah memberikan izin[cite: 20].