# Test Case — Tugas 13 (SIPORA)

Pengujian dilakukan untuk memastikan fitur utama SIPORA berjalan sesuai kebutuhan fungsional aplikasi.

| **ID** | **Skenario** | **Kondisi awal** | **Langkah** | **Expected result** | **Actual result** | **Status** |
|---|---|---|---|---|---|---|
| TC-01 | Menampilkan halaman utama | Aplikasi telah dijalankan. | Membuka aplikasi SIPORA melalui Chrome. | Halaman utama beserta navigasi ditampilkan. | Halaman utama dan navigasi tampil sesuai harapan. | Lulus |
| TC-02 | Memilih jenis pengajuan | Pengguna berada pada form pengajuan. | Memilih jenis surat yang tersedia. | Jenis surat berhasil dipilih dan form menyesuaikan. | Jenis surat berhasil dipilih dan form tampil sesuai pilihan. | Lulus |
| TC-03 | Validasi data mahasiswa | Form pengajuan terbuka. | Mengosongkan data wajib lalu mencoba melanjutkan. | Pesan validasi ditampilkan dan proses tidak dilanjutkan. | Validasi tampil dan proses tidak dapat dilanjutkan. | Lulus |
| TC-04 | Validasi semester dan WhatsApp | Form pengajuan terbuka. | Mengisi semester atau nomor WhatsApp dengan format tidak sesuai. | Input tidak sesuai ditolak dan pesan validasi ditampilkan. | Input tidak sesuai ditolak dengan validasi yang sesuai. | Lulus |
| TC-05 | Validasi periode kegiatan | Form pengajuan terbuka. | Mengisi tanggal kegiatan dengan periode tidak sesuai. | Periode tidak sesuai ditolak oleh validasi. | Validasi periode kegiatan berjalan sesuai harapan. | Lulus |
| TC-06 | Pengajuan observasi kelompok | Form pengajuan observasi terbuka. | Memilih pengajuan kelompok dan menambahkan anggota. | Anggota kelompok berhasil ditambahkan dan ditampilkan. | Anggota kelompok berhasil ditambahkan dan ditampilkan. | Lulus |
| TC-07 | Memilih dokumen pendukung | Form pengajuan terbuka. | Memilih dokumen pendukung melalui fitur unggah. | Dokumen berhasil dipilih dan ditampilkan pada form. | Dokumen berhasil dipilih dan ditampilkan pada form. | Lulus |
| TC-08 | Konfirmasi pengajuan | Data pengajuan telah diisi sesuai ketentuan. | Memilih menu pemeriksaan atau konfirmasi pengajuan. | Ringkasan data pengajuan ditampilkan sebelum konfirmasi. | Ringkasan pengajuan tampil sesuai data yang diisi. | Lulus |
| TC-09 | Menambahkan pengajuan | Data pengajuan telah dikonfirmasi. | Menyelesaikan konfirmasi pengajuan. | Pengajuan berhasil ditambahkan pada daftar pengajuan. | Pengajuan berhasil ditambahkan dan tampil pada daftar. | Lulus |
| TC-10 | Mengubah data pengajuan | Terdapat pengajuan pada daftar. | Memilih pengajuan dan melakukan perubahan data. | Data pengajuan berhasil diperbarui. | Data pengajuan berhasil diperbarui sesuai perubahan. | Lulus |
| TC-11 | Menghapus pengajuan | Terdapat pengajuan pada daftar. | Memilih hapus dan mengonfirmasi penghapusan. | Pengajuan dihapus dari daftar. | Pengajuan berhasil dihapus dari daftar. | Lulus |