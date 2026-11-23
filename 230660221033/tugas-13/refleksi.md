# Refleksi Tugas 13 — Testing, Debugging, dan Perbaikan
**Nama:** Yelly Ambarwaty  
**NIM:** 230660221033  

Pengujian fungsional dan widget test membuktikan bahwa fitur yang tampak berjalan normal pada skenario standar tetap rentan mengalami bug seperti duplikasi data saat tombol ditekan dua kali secara cepat. Melalui proses debugging berbasis reproduksi skenario, masalah tersebut berhasil diatasi dengan menambahkan variabel pengunci state `_sedangMenyimpan` dan memverifikasinya kembali menggunakan test regresi otomatis pada `flutter test`. Ke depannya, cakupan pengujian perlu diperluas ke *integration test* menyeluruh dengan backend produksi agar alur autentikasi dan sinkronisasi database teruji secara end-to-end.