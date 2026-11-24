# Quiz Pertemuan 13 — Testing, Debugging, dan Perbaikan

**Mata Kuliah:** Pemrograman Aplikasi Bergerak  
**Pertemuan:** 13 | **CPMK:** CPMK-4

## Soal 1 — Test Case

Test case merupakan skenario pengujian yang digunakan untuk memastikan suatu fitur berjalan sesuai kebutuhan. Komponen utama test case meliputi ID test, skenario pengujian, kondisi awal, langkah pengujian, expected result, actual result, dan status pengujian.

**Expected result** merupakan hasil yang diharapkan berdasarkan kebutuhan atau spesifikasi fitur, sedangkan **actual result** merupakan hasil nyata yang diperoleh ketika pengujian dilakukan. Keduanya dibandingkan untuk mengetahui apakah fitur berjalan sesuai harapan.

## Soal 2 — Jenis Testing

- **Static analysis:** Memeriksa kode program tanpa menjalankan aplikasi untuk mendeteksi kesalahan sintaks, penggunaan kode yang tidak sesuai, atau potensi masalah lainnya.
- **Unit test:** Menguji fungsi atau bagian kode secara terpisah untuk memastikan hasilnya sesuai dengan yang diharapkan.
- **Widget test:** Menguji widget Flutter, termasuk tampilan, interaksi, dan respons terhadap input pengguna.
- **Integration test:** Menguji keterhubungan dan kerja sama beberapa bagian aplikasi dalam satu alur proses.
- **Manual functional test:** Menguji fungsi aplikasi secara langsung dengan menjalankan skenario tertentu untuk memastikan fitur berjalan sesuai kebutuhan.

## Soal 3 — Widget Test

Dalam widget test Flutter, beberapa fungsi utama yang digunakan adalah:

| Fungsi | Penjelasan |
|---|---|
| `pumpWidget` | Menampilkan widget yang akan diuji ke dalam lingkungan pengujian. |
| `find` | Mencari widget atau elemen tertentu berdasarkan teks, tipe, maupun karakteristik lainnya. |
| `tap` | Simulasi tindakan menekan atau mengetuk widget, seperti tombol. |
| `pump` | Memperbarui frame UI setelah perubahan state atau interaksi. |
| `expect` | Membandingkan hasil aktual dengan kondisi yang diharapkan untuk menentukan apakah pengujian berhasil. |

## Soal 4 — Debugging

Langkah debugging berbasis bukti untuk mengatasi tombol simpan yang menghasilkan dua data ketika ditekan dua kali adalah:

1. Mereproduksi bug dengan menekan tombol simpan dua kali dan mengamati apakah dua data tersimpan.
2. Memeriksa hasil aktual pada daftar pengajuan serta mencatat kondisi ketika bug terjadi.
3. Memeriksa kode fungsi simpan, event `onPressed`, dan mekanisme penambahan data untuk mengetahui apakah terdapat pemanggilan berulang atau tidak ada pembatasan saat proses penyimpanan.
4. Memeriksa log atau menggunakan breakpoint untuk mengamati alur eksekusi fungsi simpan.
5. Memperbaiki penyebab masalah, misalnya dengan menonaktifkan tombol selama proses penyimpanan atau mencegah pemanggilan simpan berulang.
6. Menjalankan pengujian kembali untuk memastikan data hanya tersimpan sesuai jumlah tindakan yang diharapkan.

## Soal 5 — Regresi

Test regresi perlu dilakukan setelah bug diperbaiki untuk memastikan perbaikan tidak menyebabkan masalah baru pada fitur lain yang sebelumnya sudah berjalan dengan baik.

Contohnya, ketika memperbaiki validasi form pengajuan surat agar nomor WhatsApp wajib diisi, pengujian regresi perlu dilakukan pada validasi nama, semester, tanggal kegiatan, unggah dokumen, serta proses penyimpanan. Hal ini memastikan perubahan validasi tidak mengganggu fungsi form lainnya.

## Soal 6 — Integritas Testing

Menghapus assertion atau mengubah expected result agar test lulus merupakan praktik yang salah karena dapat menyembunyikan kesalahan pada aplikasi dan menghasilkan pengujian yang tidak valid. Test seharusnya mengukur kesesuaian aplikasi dengan kebutuhan yang telah ditetapkan, bukan sekadar menghasilkan status lulus. Perubahan assertion hanya boleh dilakukan apabila terdapat perubahan kebutuhan yang benar-benar dapat dibuktikan dan dibenarkan.