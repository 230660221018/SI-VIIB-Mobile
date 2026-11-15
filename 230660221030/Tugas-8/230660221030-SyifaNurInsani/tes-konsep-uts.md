# Tes Konsep UTS — Pemrograman Aplikasi Bergerak

| Identitas | Keterangan |
|:--|:--|
| Nama | Syifa Nur Insani |
| NIM | 230660221030 |
| Kelas | SI-VIIB |
| Mata Kuliah | Pemrograman Aplikasi Bergerak |
| Project | PustakaKu |

---

## Soal 1 — Konsep Aplikasi Bergerak dalam SI (CPMK-1)

1. Portabilitas (mudah dibawa)
Aplikasi mobile dapat diakses melalui smartphone yang mudah dibawa ke mana saja. Mahasiswa tidak harus menggunakan komputer atau laptop untuk mengakses layanan administrasi kampus.
Contoh penerapan: mahasiswa dapat membuka aplikasi melalui smartphone untuk mengisi formulir pengajuan surat keterangan tanpa harus datang ke loket administrasi.

2. Mobilitas dan fleksibilitas akses
Aplikasi mobile memungkinkan mahasiswa mengakses layanan dari berbagai lokasi selama perangkat terhubung dengan internet. Hal ini memberikan kemudahan karena mahasiswa tidak harus berada di lingkungan kampus untuk mengurus administrasi.
Contoh penerapan: mahasiswa dapat mengajukan surat keterangan dari rumah, tempat tinggal, atau lokasi lainnya tanpa perlu mengantre di bagian administrasi.

3. Pemanfaatan fitur perangkat mobile
Aplikasi mobile dapat memanfaatkan fitur bawaan smartphone, seperti kamera, penyimpanan dokumen, dan notifikasi. Fitur tersebut dapat membantu proses pengajuan menjadi lebih praktis.
Contoh penerapan: mahasiswa dapat menggunakan kamera untuk memotret atau mengunggah dokumen persyaratan, kemudian menerima notifikasi ketika status pengajuan surat berubah.

---

## Soal 2 — Dasar Pemrograman Dart (CPMK-1)

List<String> daftarSurat = [];	Membuat List kosong untuk menyimpan kumpulan jenis surat dalam bentuk String.
Parameter String jenis	Menerima masukan berupa nama atau jenis surat dari pengguna.
jenis.isEmpty	Memeriksa apakah teks jenis surat kosong.
return pada kondisi error	Menghentikan fungsi dan mengembalikan nilai ketika masukan tidak memenuhi validasi.
daftarSurat.add(jenis)	Menambahkan jenis surat ke dalam List.
Perulangan for	Mengulang proses untuk membaca atau menampilkan setiap data surat dalam List.

Kesalahan umum bila validasi isEmpty dihapus:

Aplikasi dapat menerima dan menyimpan data kosong ke dalam List. Hal ini menyebabkan data menjadi tidak lengkap, tidak sesuai kebutuhan, dan dapat mengganggu proses pengelolaan data surat.
Soal 3 — Pemahaman Widget Flutter

---

## Soal 3 — Struktur Flutter dan Widget (CPMK-1)

MaterialApp	Menjadi widget utama yang mengatur struktur dasar aplikasi, tema, dan halaman awal.
Scaffold	Menyediakan kerangka halaman seperti AppBar dan bagian konten.
AppBar	Menampilkan bagian atas halaman, biasanya berisi judul dan tombol navigasi.
Column	Menyusun beberapa widget secara vertikal atau dari atas ke bawah.
Text	Menampilkan teks atau informasi pada layar aplikasi.
ListView.builder	Menampilkan daftar data yang dapat digulir dan membangun item sesuai kebutuhan.

Masalah bila ListView.builder di dalam Column tanpa Expanded:

Dapat terjadi error unbounded height, yaitu ListView tidak memperoleh batas tinggi yang jelas sehingga tidak dapat menentukan ruang tampilnya.

Penyebab:

Widget Column memberikan batas tinggi yang tidak terbatas kepada anak widget tertentu pada arah vertikal. Sementara itu, ListView membutuhkan batas tinggi agar dapat menentukan area untuk menampilkan daftar.

Perbaikan:

Menggunakan widget Expanded untuk memberikan ruang yang tersedia kepada ListView.builder di dalam Column.

---

## Soal 4 — Analisis Kebutuhan dan User Flow (CPMK-2)

Klasifikasi dan prioritas:

| No. | Permintaan | Fungsional/Nonfungsional | Prioritas MoSCoW | Alasan |
|:---:|:-----------|:-------------------------|:----------------:|:-------|
| 1   | Melihat daftar buku yang tersedia         | Fungsional                        | Must                  | Pengguna perlu mengetahui buku yang dapat dipinjam.       |
| 2   | Menambahkan data peminjaman buku           | Fungsional                          | Must                   | Merupakan fungsi utama dalam proses peminjaman.        |
| 3   | Mengubah status peminjaman           | Fungsional                           | Should                 | Memudahkan pengelolaan status setiap peminjaman.       |

User flow untuk kebutuhan Must
1. Pengguna membuka aplikasi PustakaKu.
2. Sistem menampilkan halaman utama.
3. Pengguna memilih menu katalog buku.
4. Sistem menampilkan daftar buku beserta informasi stok.
5. Pengguna memilih buku yang masih tersedia.
6. Pengguna membuka dan mengisi formulir peminjaman.
7. Pengguna menyimpan data peminjaman.

---

## Soal 5 — UI/UX Mobile (CPMK-2)

1. Prinsip: Consistency (Konsistensi)
   Keputusan desain: Menggunakan warna, jenis huruf, ikon, dan tata letak yang seragam pada setiap halaman aplikasi PustakaKu.
   Alasan: Membantu pengguna mengenali elemen aplikasi dan memahami cara penggunaannya sehingga aplikasi terasa lebih teratur.

2. Prinsip: Simplicity (Kesederhanaan)
   Keputusan desain: Menampilkan menu utama, daftar buku, dan formulir peminjaman dengan tampilan sederhana serta tidak berlebihan.
   Alasan: Memudahkan pengguna menemukan fitur yang dibutuhkan tanpa merasa bingung dengan terlalu banyak elemen pada layar.

3. Prinsip: Feedback (Umpan Balik)
   Keputusan desain: Menampilkan pesan pemberitahuan ketika data peminjaman berhasil ditambahkan, diubah, atau dihapus.
   Alasan: Memberikan informasi kepada pengguna bahwa tindakan yang dilakukan telah berhasil diproses oleh sistem.

---

## Soal 6 — Navigasi dan Interaksi (CPMK-2)

Metode navigasi dan kapan digunakan
- push: Digunakan untuk membuka halaman baru di atas halaman sebelumnya. Contohnya, ketika mahasiswa memilih menu pengajuan surat dan diarahkan ke halaman formulir.
- pushNamed: Digunakan untuk berpindah halaman menggunakan nama rute (route name) yang sudah didaftarkan dalam aplikasi. Contohnya, membuka halaman formulir melalui rute /form-pengajuan.
- pop: Digunakan untuk menutup halaman yang sedang dibuka dan kembali ke halaman sebelumnya. Contohnya, kembali ke halaman utama setelah selesai mengisi formulir.
Pengiriman data jenis surat ke halaman form
Data jenis surat dapat dikirim melalui parameter konstruktor halaman tujuan ketika menggunakan Navigator.push() atau melalui argumen ketika menggunakan Navigator.pushNamed(). Dengan demikian, halaman formulir dapat menerima informasi jenis surat yang dipilih mahasiswa dan menampilkannya secara otomatis.
Feedback setelah form dikirim
Setelah mahasiswa mengirim formulir, aplikasi dapat menampilkan pesan pemberitahuan menggunakan SnackBar untuk memberikan informasi bahwa pengajuan berhasil dikirim atau gagal diproses. Umpan balik ini membantu pengguna mengetahui hasil tindakan yang telah dilakukan.

---

## Soal 7 — Model Data dan State (CPMK-3)

Mengapa setiap field bersifat final:
Field dibuat menggunakan final agar nilainya hanya dapat ditetapkan satu kali ketika objek dibuat dan tidak dapat diubah secara langsung setelahnya. Hal ini membantu menjaga konsistensi data serta mencegah perubahan yang tidak disengaja.
Mengapa id wajib ada:
id digunakan sebagai identitas unik untuk membedakan setiap data. Dengan adanya id, aplikasi dapat menemukan, mengubah, atau menghapus data tertentu secara tepat tanpa bergantung pada posisi data dalam daftar.
Perbedaan StatelessWidget dan StatefulWidget:
StatelessWidget: Widget yang tidak memiliki state yang dapat berubah selama widget digunakan. Cocok untuk tampilan yang tidak memerlukan perubahan data secara langsung.
StatefulWidget: Widget yang memiliki state yang dapat berubah dan dapat memperbarui tampilan ketika terjadi perubahan data.
Halaman daftar menggunakan (StatelessWidget/StatefulWidget):
StatefulWidget

Alasan:

Halaman daftar peminjaman menggunakan StatefulWidget karena data peminjaman dapat berubah ketika pengguna menambahkan, mengubah, atau menghapus data. Perubahan tersebut membutuhkan pembaruan tampilan agar daftar yang ditampilkan selalu sesuai dengan kondisi data terbaru.
Fungsi setState:
setState() digunakan untuk memberi tahu Flutter bahwa terdapat perubahan pada state atau data widget sehingga Flutter akan membangun ulang tampilan yang berkaitan dengan perubahan tersebut.
Apa yang terjadi bila data ditambah tanpa setState:
Data mungkin sudah berubah di dalam variabel, tetapi tampilan aplikasi tidak langsung diperbarui. Akibatnya, data yang baru ditambahkan belum terlihat pada halaman sampai terjadi proses pembaruan tampilan lainnya.

---

## Soal 8 — CRUD Lokal (CPMK-3)

| Operasi | Method List / mekanisme                                      |
|:--------|:-------------------------------------------------------------|
| Create  | add() untuk menambahkan data baru ke dalam List.              |
| Read    | Mengakses data menggunakan indeks atau perulangan for.       |
| Update  | indexWhere() untuk mencari data berdasarkan id, kemudian     |
|         | mengganti data pada posisi tersebut.                          |
| Delete  | removeWhere() untuk menghapus data berdasarkan id.            |

Mengapa id digunakan sebagai kunci update dan delete:

id digunakan sebagai identitas unik setiap data sehingga aplikasi dapat menemukan data yang ingin diubah atau dihapus secara tepat. Penggunaan id juga membuat pengelolaan data lebih konsisten meskipun posisi data dalam List berubah.

Konsekuensi bila index digunakan sebagai kunci:

Jika indeks digunakan sebagai identitas data, posisi data dapat berubah ketika ada penambahan atau penghapusan elemen dalam List. Akibatnya, aplikasi berisiko mengubah atau menghapus data yang tidak sesuai apabila indeks yang digunakan sudah tidak menunjuk pada data yang dimaksud.

---

## Soal 9 — Persistensi Data Lokal (CPMK-3)

Perbedaan in-memory dan persistensi:
In-memory: Data disimpan sementara di dalam memori aplikasi. Data dapat hilang ketika aplikasi ditutup atau dijalankan ulang.
Persistensi: Data disimpan pada media penyimpanan sehingga tetap tersedia meskipun aplikasi ditutup dan dibuka kembali.
Mengapa operasi shared_preferences asinkron (Future):

Operasi shared_preferences bersifat asinkron karena proses membaca dan menyimpan data membutuhkan waktu. Dengan menggunakan Future, aplikasi dapat menjalankan proses tersebut tanpa harus menghentikan seluruh aktivitas aplikasi.

Apa yang terjadi bila await diabaikan:

Jika await diabaikan, proses berikutnya dapat berjalan sebelum proses penyimpanan atau pembacaan data selesai. Akibatnya, aplikasi berisiko membaca data yang belum tersedia atau menampilkan informasi yang belum diperbarui.

Contoh situasi in-memory sudah cukup:

Penyimpanan in-memory sudah cukup ketika data hanya digunakan sementara selama aplikasi berjalan. Contohnya, data sementara pada formulir peminjaman buku sebelum disimpan atau dikirim.

Contoh situasi persistensi mutlak diperlukan:

Persistensi diperlukan ketika data harus tetap tersedia setelah aplikasi ditutup. Contohnya, menyimpan daftar peminjaman buku, riwayat transaksi, atau preferensi pengguna agar tidak hilang ketika aplikasi dibuka kembali.

---

## Soal 10 — Integrasi Konsep Lintas Pertemuan (CPMK-1 s.d. CPMK-3)

1. Arsitektur 
Arsitektur menjelaskan hubungan antara mahasiswa sebagai pengguna, aplikasi Flutter, penyimpanan lokal, backend sistem informasi, dan database perpustakaan.

Diagram arsitektur:
                  Mahasiswa
                      |
                      v
             Aplikasi Mobile Flutter
                      |
              +-------+-------+
              |               |
              v               v
       Penyimpanan Lokal   Backend Sistem Informasi
                                  |
                                  v
                         Database Perpustakaan

2. Kebutuhan dan alur pengguna

Dua kebutuhan Must have:
1	Mahasiswa dapat melihat katalog buku beserta informasi stok yang tersedia.	Must Have	Membantu mahasiswa mengetahui buku yang dapat dipinjam.
2	Mahasiswa dapat melakukan peminjaman buku dan melihat riwayat peminjaman.	Must Have	Memudahkan proses peminjaman dan pemantauan status buku.

Alur pengguna dari membuka aplikasi hingga tugas selesai:
Mahasiswa membuka aplikasi
          |
          v
     Halaman Utama
          |
          v
     Katalog Buku
          |
          v
 Memilih buku tersedia
          |
          v
   Mengisi Formulir
      Peminjaman
          |
          v
  Menyimpan data
   peminjaman
          |
          v
 Menampilkan notifikasi
     keberhasilan
          |
          v
 Melihat Riwayat
    Peminjaman

3. Struktur Komponen:

Dalam pengembangan aplikasi PustakaKu, terdapat beberapa komponen Flutter yang digunakan untuk membangun tampilan dan mengatur interaksi pengguna. Pada halaman katalog buku, komponen Scaffold digunakan sebagai struktur utama halaman, sedangkan AppBar berfungsi menampilkan judul halaman. Komponen ListView.builder digunakan untuk menampilkan daftar buku secara dinamis berdasarkan data yang tersedia. Informasi seperti judul buku, nama penulis, dan jumlah stok ditampilkan menggunakan komponen Text. Selain itu, ElevatedButton digunakan sebagai tombol untuk menjalankan proses peminjaman buku.

Pada halaman formulir peminjaman, komponen TextField digunakan untuk menerima masukan berupa nama peminjam, sedangkan DropdownButtonFormField digunakan untuk memilih buku yang akan dipinjam. Setelah data diisi, pengguna dapat menekan ElevatedButton untuk menyimpan data peminjaman. Komponen-komponen tersebut membantu proses pengisian formulir agar lebih mudah dipahami dan digunakan.

Untuk menghubungkan halaman katalog dengan halaman formulir, aplikasi menggunakan sistem navigasi Flutter melalui Navigator.push(). Fungsi tersebut digunakan untuk membuka halaman formulir ketika pengguna memilih buku yang akan dipinjam. Setelah proses pengisian formulir selesai, Navigator.pop() digunakan untuk menutup halaman formulir dan kembali ke halaman sebelumnya. Dengan adanya komponen tampilan dan navigasi tersebut, pengguna dapat menjalankan proses peminjaman buku melalui beberapa halaman yang saling terhubung.

4. Data & State:
Model Buku digunakan untuk merepresentasikan informasi buku dalam aplikasi.

Contoh atribut yang digunakan:
class Buku {
  final String id;
  final String judul;
  final String penulis;
  final int stok;

  Buku({
    required this.id,
    required this.judul,
    required this.penulis,
    required this.stok,
  });
}

4. Data & State

Contoh model data Buku:
class Buku {
  const Buku({
    required this.id,
    required this.judul,
    required this.penulis,
    required this.kategori,
    required this.status,
  });

  final String id;
  final String judul;
  final String penulis;
  final String kategori;
  final String status;
}


Operasi Create digunakan untuk menambahkan transaksi peminjaman ke dalam List setelah formulir berhasil dikirim. Operasi Read digunakan untuk menampilkan katalog buku dan riwayat peminjaman menggunakan ListView.builder.

Pengelolaan perubahan data dilakukan menggunakan setState() agar tampilan diperbarui setelah terjadi penambahan transaksi. Pada pengembangan selanjutnya, data dapat disimpan melalui backend agar riwayat peminjaman dapat diakses secara terpusat.