# Skenario Pengujian Fitur Perangkat SIPORA

## 1. Tujuan Pengujian

Pengujian dilakukan untuk memastikan fitur pemilihan dokumen dari perangkat menggunakan `file_picker` dapat berjalan dengan baik, terintegrasi dengan form pengajuan, serta menangani kondisi pemilihan dan pembatalan dokumen.

## 2. Skenario Pengujian

| No. | Skenario | Hasil yang Diharapkan | Hasil |
|---|---|---|---|
| 1 | Membuka form pengajuan | Form pengajuan tampil dengan normal | Berhasil |
| 2 | Memilih dokumen PDF | Dokumen terpilih dan nama file ditampilkan | Berhasil |
| 3 | Membatalkan pemilihan dokumen | Form tetap berjalan normal | Berhasil |
| 4 | Memilih dokumen kembali | Dokumen dapat dipilih dan ditampilkan pada form | Berhasil |
| 5 | Menyelesaikan pengajuan dengan dokumen | Pengajuan berhasil dibuat | Berhasil |
| 6 | Membuka Detail Pengajuan | Nama dokumen pendukung tampil pada detail | Berhasil |

## 3. Hasil Pengujian

Berdasarkan pengujian yang dilakukan pada aplikasi SIPORA menggunakan Google Chrome, fitur pemilihan dokumen berhasil dijalankan. Pengguna dapat memilih dokumen, membatalkan pemilihan, melanjutkan proses pengajuan, serta melihat nama dokumen pada Detail Pengajuan Surat.

Hasil pengujian menunjukkan bahwa fitur pemilihan dokumen telah terintegrasi dengan alur pengajuan surat pada aplikasi SIPORA.

## 4. Platform Pengujian

| Aspek | Keterangan |
|---|---|
| Aplikasi | SIPORA |
| Platform | Flutter Web |
| Browser | Google Chrome |
| Fitur yang diuji | Pemilihan dokumen dari perangkat |
| Status pengujian | Berhasil |