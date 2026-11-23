# Tugas 9: Implementasi Konsumsi REST API — CeriaReads
**Nama:** Yelly Ambarwaty  
**NIM:** 230660221033  

Direktori ini berisi implementasi konsumsi REST API (HTTP GET dan POST) beserta manajemen tiga kondisi antarmuka (loading, sukses, dan error) untuk aplikasi CeriaReads.

## Refleksi
Bagian yang paling menantang untuk dipahami secara menyeluruh adalah menyelaraskan *asynchronous programming* (`async`/`await`) dengan siklus hidup UI agar perubahan status *loading* dan *error* selalu tergambar tepat waktu tanpa memicu error pembaruan state setelah widget ditutup. Selain itu, memastikan fungsi *factory* `fromJson` tetap aman dari potensi *crash* akibat ketidaksesuaian tipe data atau nilai `null` dari server membutuhkan ketelitian ekstra saat memetakan setiap kunci JSON. Pemisahan logika HTTP ke dalam lapisan *service* tersendiri terbukti sangat membantu menjaga kode antarmuka tetap bersih dan mudah diuji saat mensimulasikan kegagalan koneksi.

