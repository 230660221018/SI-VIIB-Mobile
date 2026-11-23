# Jawaban Quiz Pertemuan 13 — Testing, Debugging, dan Perbaikan

| | |
|:--|:--|
| **Nama** | Yelly Ambarwaty |
| **NIM** | 230660221033 |
| **Kelas** | SI-VIIB |
| **Project Acuan** | CeriaReads (Sistem Layanan Peminjaman Buku Panti Baca Ceria) |

---

## Soal 1 — Test Case
Komponen utama dalam sebuah *test case* meliputi **ID Test**, **Skenario Pengujian**, **Kondisi Awal (*Pre-condition*)**, **Langkah Pengujian (*Test Steps*)**, **Data Masukan (*Input*)**, **Hasil yang Diharapkan (*Expected Result*)**, **Hasil Aktual (*Actual Result*)**, serta **Status Kelulusan**.

Perbedaan mendasar antara *expected result* dan *actual result* terletak pada waktu penyusunan dan fungsinya[cite: 26]. *Expected result* dirumuskan **sebelum** pengujian dijalankan berdasarkan spesifikasi kebutuhan sistem sebagai acuan kebenaran[cite: 26]. Sementara itu, *actual result* dicatat **setelah** skenario benar-benar dieksekusi untuk merekam perilaku nyata aplikasi di lapangan[cite: 26]. Suatu fitur dinyatakan lulus apabila *actual result* cocok dengan *expected result*.

## Soal 2 — Jenis Testing
Kelima jenis pengujian pada pengembangan aplikasi Flutter memiliki cakupan yang saling melengkapi[cite: 26]:
1. **Static Analysis:** Pemeriksaan kode secara otomatis tanpa menjalankan aplikasi (melalui `flutter analyze`) untuk mendeteksi kesalahan sintaks, ketidakcocokan tipe data, atau variabel yang tidak terpakai[cite: 26].
2. **Unit Test:** Menguji satu fungsi, method, atau kelas logika secara terisolasi (seperti fungsi `validasiNama` pada `CeriaReadsValidator`) untuk memastikan output-nya sesuai dengan berbagai variasi input[cite: 26].
3. **Widget Test:** Menguji satu komponen tampilan (*widget*) beserta interaksi penggunanya di lingkungan simulasi memori tanpa perlu membuka emulator atau peramban[cite: 26].
4. **Integration Test:** Menguji alur kerja aplikasi secara menyeluruh dari ujung ke ujung (*end-to-end*) pada perangkat target sungguhan, mulai dari interaksi layar hingga komunikasi ke layanan eksternal[cite: 26].
5. **Manual Functional Test:** Pengujian yang dilakukan langsung oleh penguji manusia untuk memverifikasi pengalaman pengguna serta kondisi yang bergantung pada perangkat keras, seperti dialog penolakan *permission* kamera atau pemutusan koneksi internet[cite: 26].

## Soal 3 — Widget Test
Dalam pustaka `flutter_test`, kelima fungsi tersebut membentuk siklus dasar pengujian antarmuka[cite: 26]:
- **`pumpWidget()`:** Merender atau memasang widget yang ingin diuji ke dalam lingkungan pengujian virtual Flutter[cite: 26].
- **`find`:** Mencari dan menunjuk elemen widget tertentu di layar pengujian berdasarkan teks, ikon, tipe widget, atau `Key`[cite: 26].
- **`tap()`:** Mensimulasikan aksi sentuhan atau klik pengguna pada widget yang sudah ditemukan oleh `find`[cite: 26].
- **`pump()`:** Memicu pembangunan ulang *frame* antarmuka (*rebuild*) setelah terjadi interaksi atau perubahan *state* sehingga tampilan terbaru bisa diperiksa[cite: 26].
- **`expect()`:** Membandingkan hasil aktual yang tampil pada layar pengujian dengan *expected result* menggunakan *matcher* (seperti `findsOneWidget` atau `findsNothing`) untuk menentukan lulus tidaknya pengujian[cite: 26].

## Soal 4 — Debugging
Untuk menemukan penyebab tombol simpan yang menghasilkan data ganda saat ditekan dua kali, langkah *debugging* berbasis bukti dilakukan secara sistematis[cite: 26]:
1. **Reproduksi Bug:** Mengulangi skenario secara terkontrol dengan mengisi form valid lalu mengetuk tombol simpan dua kali berturut-turut, kemudian mencatat bahwa muncul dua entri identik di daftar (*actual result*)[cite: 26].
2. **Penelusuran Kode & State:** Membuka kode penanganan tombol (`onPressed` pada `FilledButton`) dan menelusuri method `_simpanPengajuan()`[cite: 26].
3. **Penyusunan Hipotesis:** Ditemukan bahwa selama proses asinkron (`Future.delayed` / request API) berjalan, tidak ada variabel status (*loading state*) yang mengunci tombol sehingga ketukan kedua tetap mengeksekusi fungsi penyimpanan[cite: 26].
4. **Perbaikan & Verifikasi:** Menambahkan flag `_sedangMenyimpan` untuk menonaktifkan tombol (`onPressed: null`) selama proses berlangsung, lalu menjalankan ulang skenario yang sama untuk membuktikan data hanya tersimpan satu kali[cite: 26].

## Soal 5 — Regresi
Pengujian yang sebelumnya sudah lulus wajib dijalankan kembali setelah perbaikan bug untuk memastikan bahwa perubahan kode yang baru tidak merusak fitur lain yang tadinya sudah berjalan normal (*regression*)[cite: 26].

Sebagai contoh pada form pengajuan **CeriaReads**, saat kita memperbaiki bug klik ganda dengan menonaktifkan tombol melalui variabel `_sedangMenyimpan`, ada risiko kita lupa mengembalikan nilai `_sedangMenyimpan = false` setelah proses selesai atau saat terjadi error. Jika hal itu terjadi, tombol simpan akan terkunci permanen sehingga pengguna tidak bisa mengajukan peminjaman kedua. Dengan menjalankan kembali test case pengajuan normal (`TC-01`), kita dapat memastikan perbaikan bug tidak merusak alur utama aplikasi[cite: 26].

## Soal 6 — Integritas Testing
Menghapus *assertion* (`expect`) atau mengubah *expected result* sekadar agar status pengujian berubah menjadi hijau (*passed*) adalah praktik yang keliru karena hal tersebut **menyembunyikan bug yang sebenarnya, bukan memperbaikinya**[cite: 26]. Tujuan utama pengujian adalah memverifikasi bahwa aplikasi berjalan sesuai spesifikasi kebutuhan pengguna[cite: 26]. Jika ekspektasi pengujian diturunkan mengikuti perilaku program yang salah, cacat logika akan lolos ke pengguna akhir dan merusak keandalan sistem informasi saat digunakan di lapangan.