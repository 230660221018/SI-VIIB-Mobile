# Tugas 6: Navigation Flow dan Interaksi

**Nama:** Nabila Apriliani  
**NIM:** 230660221126  
**Kelas:** SI-VIIB  

## Deskripsi Tugas
Tugas ini mengimplementasikan alur navigasi bernama (*named routes*), pengiriman data antarlayar melalui *arguments*, form validasi dengan `GlobalKey<FormState>`, pembersihan controller pada `dispose`, serta feedback interaksi menggunakan `SnackBar` pada aplikasi mobile.

## Refleksi
Bagian yang paling sulit dipertahankan konsistensinya adalah menyelaraskan nama route dan struktur data antara `navigation-flow.md`, kode `form-interaksi.dart`, serta `catatan-keputusan-navigasi.md`. Hal ini terjadi karena setiap perubahan kecil pada nama route atau alur navigasi di kode memerlukan pembaruan menyeluruh pada diagram Mermaid dan tabel keputusan. Ketelitian ekstra sangat diperlukan agar semua dokumen pendukung tetap sinkron dan tidak ada *route mismatch* saat pengujian.

## Deklarasi Penggunaan AI
Dalam pengerjaan tugas ini, AI (Gemini) digunakan sebagai asisten coding untuk membantu menyusun kerangka dokumen Markdown, memeriksa kesesuaian diagram Mermaid dengan alur Flutter, serta memverifikasi penanganan null pada *arguments* navigasi. Seluruh logika alur dan penyesuaian kode dirumuskan ulang dan dipahami oleh penulis.