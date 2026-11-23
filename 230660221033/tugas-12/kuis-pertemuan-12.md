# Jawaban Quiz Pertemuan 12 — Validasi dan Keamanan Praktis

| | |
|:--|:--|
| **Nama** | Yelly Ambarwaty |
| **NIM** | 230660221033 |
| **Kelas** | SI-VIIB |
| **Project Acuan** | CeriaReads (Sistem Layanan Peminjaman Buku Panti Baca Ceria) |

---

## Soal 1 — Validasi Client dan Server
Validasi *client* (pada aplikasi Flutter) bertujuan memberikan umpan balik secara instan kepada pengguna dan mencegah pengiriman *request* yang formatnya jelas keliru, seperti kolom kosong atau salah ketik alamat email. Sementara itu, validasi *server* (pada *backend* API) berperan sebagai pemeriksaan otoritatif terakhir untuk memastikan integritas data, hak akses pengguna, serta aturan bisnis sebelum data benar-benar disimpan ke basis data.

Validasi pada form Flutter saja tidak cukup untuk melindungi aturan bisnis karena aplikasi di sisi *client* sepenuhnya berada di bawah kendali perangkat pengguna[cite: 21]. Pihak yang tidak bertanggung jawab dapat memodifikasi aplikasi, membongkar kode, atau mengirimkan *payload* JSON langsung ke *endpoint* API menggunakan perkakas luar (seperti Postman atau cURL) tanpa melewati formulir Flutter sama sekali[cite: 21].

## Soal 2 — HTTPS dan Token
Mengirimkan *access token* melalui protokol `http://` biasa sangat berbahaya karena seluruh lalu lintas data dikirim dalam bentuk teks polos (*plaintext*) tanpa enkripsi[cite: 21]. Jika pengguna terhubung ke jaringan publik seperti Wi-Fi kafe atau kampus, penyerang yang berada di jaringan yang sama dapat melakukan penyadapan (*packet sniffing* atau *Man-in-the-Middle attack*) untuk mencuri token tersebut dan membajak akun pengguna (*session hijacking*).

Perbaikan mutlak yang harus dilakukan adalah memindahkan seluruh komunikasi *endpoint* ke protokol **`https://`** agar payload dan header `Authorization` terenkripsi menggunakan TLS selama perjalanan di jaringan[cite: 21]. Selain itu, token harus selalu dikirim melalui *HTTP Header* (`Authorization: Bearer <token>`) dan tidak pernah diletakkan di dalam parameter URL (*query string*) agar tidak tercatat di riwayat peramban maupun log server[cite: 21].

## Soal 3 — Secure Storage
Token autentikasi merupakan kunci akses yang setara dengan kata sandi selama masa berlakunya aktif[cite: 21]. Jika token ditulis langsung di dalam *source code* (*hardcoded*), siapa pun yang melihat repositori GitHub dapat langsung mengambil alih akses sistem[cite: 21]. Begitu pula jika token dicetak ke *console log*, data sensitif tersebut berisiko terbaca oleh alat pemantau *log* sistem operasi atau pihak ketiga saat proses *debugging*. Oleh karena itu, token wajib disimpan menggunakan penyimpanan terenkripsi bawaan platform seperti `flutter_secure_storage` (yang memanfaatkan *Keystore* di Android dan *Keychain* di iOS)[cite: 21].

Saat pengguna menekan tombol **logout**, aplikasi harus segera menghapus token dari *secure storage* (misalnya memanggil method `delete`) serta membersihkan *state* sesi pengguna di memori aplikasi[cite: 21]. Jika *backend* mendukung pencabutan token (*token revocation*), aplikasi juga perlu memanggil *endpoint* logout di server agar token lama tidak bisa dipakai ulang meskipun sempat tersalin[cite: 21].

## Soal 4 — Permission
Meminta *permission* kamera secara langsung saat aplikasi pertama kali dibuka—padahal fitur foto hanya dipakai pada formulir tertentu—melanggar prinsip ***Least Privilege*** (hak akses minimum)[cite: 21]. Dari sisi pengalaman pengguna, hal ini menimbulkan rasa curiga karena pengguna belum memahami alasan mengapa aplikasi perpustakaan membutuhkan akses kamera di halaman awal, sehingga besar kemungkinan pengguna akan langsung menolak izin tersebut secara permanen.

Alur *permission* yang jauh lebih tepat adalah menerapkan permintaan izin secara kontekstual (*just-in-time permission*)[cite: 21]:
1. Biarkan pengguna membuka dan menjelajahi aplikasi tanpa meminta izin perangkat apa pun di awal.
2. Saat pengguna masuk ke form pengajuan dan menekan tombol **"Ambil Foto Kondisi Buku"**, tampilkan penjelasan singkat mengenai tujuan pengambilan foto[cite: 21].
3. Barulah panggil dialog izin kamera sistem operasi pada momen tersebut[cite: 21]. Jika pengguna menolak izin, tangani pengecualian secara ramah dengan memberikan opsi alternatif memilih foto dari galeri atau panduan mengaktifkan izin melalui pengaturan perangkat[cite: 21].

## Soal 5 — Security Checklist
Berikut adalah lima pemeriksaan keamanan praktis beserta bukti verifikasinya pada project **CeriaReads**:
1. **Validasi input wajib dan format data pada sisi client:** Dibuktikan dengan keberadaan fungsi `validasiNama`, `validasiEmail`, dan `validasiDurasiPinjam` di dalam file `lib/utils/form_validator.dart` serta pengujian input kosong di halaman form[cite: 20, 21].
2. **Penggunaan protokol terenkripsi HTTPS pada seluruh komunikasi API:** Dibuktikan melalui konfigurasi konstanta `baseUrl = 'https://jsonplaceholder.typicode.com'` pada file `service-api.dart` dan `integrasi_service.dart`[cite: 21].
3. **Tidak ada penyimpanan kredensial atau token pada source code maupun log:** Dibuktikan melalui hasil pemeriksaan kode sumber di direktori `lib/` yang bebas dari *hardcoded* API key serta tidak adanya perintah `print()` yang menampilkan header sensitif[cite: 20, 21].
4. **Penerapan prinsip *least privilege* pada permintaan izin perangkat:** Dibuktikan melalui dokumentasi `dokumen-fitur-perangkat.md` dan kode `LampiranFotoService` yang hanya memicu akses kamera/galeri ketika tombol lampiran ditekan oleh pengguna[cite: 20, 21].
5. **Penanganan pesan error yang aman tanpa membocorkan detail internal server:** Dibuktikan melalui blok `try-catch` pada lapisan *service* yang menangkap *exception* teknis (`SocketException`, `PlatformException`) dan mengonversinya menjadi pesan peringatan ramah pengguna di layar tanpa mencetak *stack trace*[cite: 20, 21].