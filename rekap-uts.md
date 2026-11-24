# Rekap Pengumpulan Tugas-8 / UTS

Sumber: `main` di repositori PBWFEND/SI-VIIB-Mobile (per **2026-11-11**, commit `56f17ec`), disinkronkan dengan **Pertemuan 8 — UTS: Evaluasi Tengah Semester** (PAB, `pertemuan-08/08-Pertemuan-8.md`).
Semua tugas-8 ter-merge melalui PR.

## Ketentuan Pertemuan 8 (ringkas)

**Struktur minimal folder `tugas-8/`:**

```
tugas-8/
├── tes-konsep-uts.md        (Soal 1–10 esai, wajib, Bobot 40%)
├── laporan-progress-uts.md  (template Bagian 8, Bobot 60%)
├── kebutuhan / tautan Tugas 4   (M1: dokumen kebutuhan + user flow)
├── prototype / tautan Tugas 5   (M2: UI/UX)
├── navigation-flow / tautan Tugas 6 (M2–M3: navigasi & form)
├── crud-lokal.dart / tautan Tugas 7 (M3: CRUD lokal)
└── README.md
```

**Artefak wajib (Bagian 6.1):** (1) dokumen kebutuhan + user flow, (2) prototype UI/UX, (3) navigasi & interaksi (≥2 halaman + Navigator + form validasi + SnackBar), (4) MVP CRUD lokal (model + StatefulWidget + Create/Read/Update/Delete), (5) jawaban tes konsep 1–10, (6) laporan progress sesuai template (identitas, ringkasan, ketercapaian M1–M3, matriks kebutuhan, tangkapan layar ≥3, kendala & solusi, rencana M5, refleksi).

Artefak M1–M3 boleh berupa tautan/folder di repository (tidak wajib disalin ke `tugas-8/`).

## Pengumpulan per Mahasiswa

**Mata kuliah Pemrograman Aplikasi Bergerak — Kelas SI-VIIB — Batch UTS periode 30 Okt – 6 Nov 2026.**
Total **20 mahasiswa** (satu NIM, 230660221087, punya dua folder: `230660221087` dan `230660221087-Adrian`); **17 sudah mengumpulkan**, 3 belum.

| NIM | Nama | Folder UTS | PR | Status |
|:---:|:-----|:-----------|:---:|:-------|
| 230660221001 | Ghatan Zalfaa Kautsar | `tugas-8/` | #69 | Tidak lengkap |
| 230660221004 | Rian Rianto | `Tugas-8/` | #87+#107 | **Lengkap** (screenshot ditambahkan lewat PR #107) |
| 230660221008 | Nazwa Umaira Nanindia Ramdhani | `Tugas-8/` | #74 | Tidak lengkap |
| 230660221012 | Paizal Rizki Nugraha | `Tugas 8/` | #78+#117 | **Lengkap** (18 Nov; kosmetik nama di #119) |
| 230660221018 | Intan Kartika | `tugas-8/` | #72 | **Lengkap** |
| 230660221022 | Dian Erwin | `UTS-tugas-8/230660221022-Dian Erwin/` | #71 | Tidak lengkap |
| 230660221024 | Ridho Akmal Aulia | `tugas-8/` | #82+#109 | **Lengkap** (kosmetik selesai, PR #109) |
| 230660221030 | Syifa Nur Insani | — | — | **Belum mengumpulkan** |
| 230660221032 | Deyna Angeliawati Zahara | `tugas-8/` | #67+#118 | **Lengkap** (18 Nov) |
| 230660221033 | Yelly Ambarwaty | `tugas-8/` | #73 | **Lengkap** |
| 230660221085 | Annisa Nur Sabariyah | — | #58 (di-revert #59) | **Belum mengumpulkan** |
| 230660221087 | Adrian Nugraha | `tugasUTS-8/230660221087-Adrian/` | #65 | **Lengkap** (kosmetik) |
| 230660221088 | Muhammad Panji Adhitya | `Pertemuan 8/` | #85 | Tidak lengkap |
| 230660221094 | Kikania Zahra | `tugas-8/` | #81 | **Lengkap** |
| 230660221098 | Tika Anggraeni | `tugas-8/` | #70 | Tidak lengkap |
| 230660221100 | Marsya Anastasya | `tugas-8/` | #79+80 | **Lengkap** |
| 230660221102 | Jajang Komara | `tugas-8/` | #77 | **Lengkap** |
| 230660221113 | Muhammad Andre Nugraha | `tugas-8/` | #83 | **Lengkap** |
| 230660221114 | Talitha Ardelia Ivana | `tugas8/` | #86 | **Lengkap** |
| 230660221126 | Nabila Apriliani | — | — | **Belum mengumpulkan** |

## Isi Folder / Status per Kelompok

### Lengkap (12)

Artefak M1–M3 ada di folder tugas-4 s.d. tugas-7 masing-masing.

| Item | Intan (1018) #72 | Ridho (1024) #82+#109 | Paizal (1012) #78+#117 | Rian (1004) #87+#107 | Yelly (1033) #73 | Deyna (1032) #67+#118 | Adrian (1087) #65 | Kikania (1094) #81 | Marsya (1100) #79+80 | Jajang (1102) #77 | Andre (1113) #83 | Talitha (1114) #86 |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| Folder | `tugas-8/` | `tugas-8/` | `Tugas 8/` | `Tugas-8/` | `tugas-8/` | `tugas-8/` | `tugasUTS-8/` | `tugas-8/` | `tugas-8/` | `tugas-8/` | `tugas-8/` | `tugas8/` |
| Tes konsep | Ada, 10/10 soal | Ada, 10/10 soal | Ada, 10/10 soal (dalam `Soal 1 - 10.md`, 6.117 kata) | Ada, 10/10 soal | Ada, 10/10 soal | Ada, 10/10 soal | Ada, 10/10 soal | Ada, 10/10 soal | Ada, 10/10 soal | Ada, 10/10 soal | Ada, 10/10 soal | Ada, 10/10 soal |
| Laporan progress | Ada, bagian 1–8 + deklarasi AI | Ada, bagian 1–8 + deklarasi AI | Ada, bagian 1–7 | Ada, bagian 1–8 + deklarasi AI | Ada, bagian 1–7 (**tanpa deklarasi AI**) | Ada, bagian 1–7 + deklarasi AI | Ada, bagian 1–8 + deklarasi AI | Ada, bagian 2.1–2.9 + deklarasi AI | Ada, bagian 1–7 (**tanpa deklarasi AI**) | Ada, bagian 1–8 + deklarasi AI | Ada, bagian 2.1–2.9 + deklarasi AI | Ada, bagian 1–8 (**tanpa deklarasi AI**) |
| Screenshot aplikasi | 3: daftar, form, hapus | 3: daftar, form, hapus | 3: halaman-utama, form, dialog (folder `screenshots/`) | 3: daftar, form, hapus | 3: daftar, form, hapus (+ wireframe 3,8 MB) | 3: daftar, form, hapus (+ arsip prototipe) | 2: status, hapus (+ wireframe) — nama file typo | 3: daftar, form, hapus | 3: daftar, form, hapus | 4: daftar, form, halaman, hapus | 3: daftar, form, hapus | 3: daftar, form, hapus |
| README | Ada | `README.md` ✓ | Tidak ada | Ada | Ada | Ada | Ada | Ada | Ada | Ada | Ada | Ada |
| CRUD lokal | Ada di tugas-7 | Ada di tugas-7 | Ada di `Tugas 7/` | Ada di `Tugas-8/` | Ada di `tugas-8/` | Ada di tugas-7 | Ada di `tugas-8/` | Ada di tugas-7 | Tautan `.md` ke tugas-7 | Ada di tugas-7 | Ada di tugas-7 | Tautan `.md` ke tugas7 |
| M1–M3 (tugas-4..7) | Ada | Ada | Ada | Ada | Ada | Ada | Ada | Ada | Ada | Ada | Ada | Ada |
| **Status** | **Lengkap** | **Lengkap** (kosmetik) | **Lengkap** (kosmetik: NIM salah tulis, ekstensi ganda → #119) | **Lengkap** (sudah diperbaiki lewat PR #107) | **Lengkap** | **Lengkap** | **Lengkap** (kosmetik) | **Lengkap** | **Lengkap** | **Lengkap** | **Lengkap** | **Lengkap** |

### Tidak lengkap (5)

| Item | Ghatan (1001) #69 | Nazwa (1008) #74 | Dian Erwin (1022) #71 | Panji (1088) #85 | Tika (1098) #70 |
| --- | --- | --- | --- | --- | --- |
| Folder | `tugas-8/` | `Tugas-8/` | `UTS-tugas-8/…/` | `Pertemuan 8/` | `tugas-8/` |
| Tes konsep | **TIDAK ADA** | Ada, 10/10 soal | Ada, 10/10 soal | Ada, 10/10 soal (pecah `Soal-1..10.md`) | Ada, 10/10 soal |
| Laporan progress | Ada, bagian 1–7 | Ada, bagian 1–7 + deklarasi AI | Ada, bagian 1–7 | **TIDAK ADA** | Ada, bagian 1–7 + deklarasi AI |
| Screenshot aplikasi | 3: daftar, feedback, hapus — **form tidak ada** | **0 file** | 2: daftar, hapus (+ wireframe.jpg) — **form tidak ada** | **0 file** | 3: daftar, form, hapus |
| README | Ada | **0 byte (kosong)** | **TIDAK ADA** | **TIDAK ADA** | **TIDAK ADA** |
| CRUD lokal | Ada di tugas-7 | Ada di `Tugas-8/` | Ada di `UTS-tugas-8/` | Ada di Pertemuan 7 | Ada di tugas-7 |
| M1–M3 (tugas-4..7) | Ada | Ada | Ada | Ada (`Pertemuan 4..7`) | Ada |
| **Status terhadap ketentuan UTS** | **Tidak lengkap** (tes konsep 0; tidak ada bukti form) | **Tidak lengkap** (0 screenshot; README kosong) | **Tidak lengkap** (bukti form tidak ada; README tidak ada) | **Tidak lengkap** (laporan progress 0; 0 screenshot; README tidak ada) | **Tidak lengkap** (README tidak ada) |

### Belum mengumpulkan (3)

| NIM | Nama | Status | Catatan |
|:---:|:-----|:-------|:-------|
| 230660221030 | Syifa Nur Insani | Tugas-4 s.d. Tugas-7 ada, **tugas-8 belum** | Folder kapital `Tugas-5/6/7` (kosmetik) |
| 230660221085 | Annisa Nur Sabariyah | Tugas-8 pernah di-submit (PR #58) lalu **di-revert sendiri** (PR #59, 30 Okt) | Tugas-9 sudah terkumpul (PR #88, dirapikan lewat PR #89) |
| 230660221126 | Nabila Apriliani | Hanya tugas-1 s.d. tugas-4 | Tugas-5 s.d. 8 belum ada |

## Pembaruan

- **11 Nov 2026 — PR #107 (Rian Rianto, 230660221004) ter-merge**: 3 tangkapan layar kini tersimpan sebagai file PNG di `Tugas-8/`; issue #91 ditutup dan Rian berpindah ke kategori **lengkap**.
- **11 Nov 2026 — PR #109 (Ridho Akmal Aulia, 230660221024) ter-merge**: `REAME.md` → `README.md`; issue #101 ditutup.

## Pembaruan

- **18 Nov 2026 — PR #118 (Deyna, 1032)**: `screenshot-daftar.png` (identik `tugas-7/screenshot-daftar.png`) + `README.md` → **lengkap**, issue #95 ditutup.
- **18 Nov 2026 — PR #117 (Paizal, 1012)**: laporan progress + soal 1–10 dalam satu berkas + 3 screenshot, dan reorg `Pertemuan N` → `Tugas N` → **lengkap secara isi**, issue #93 ditutup; kosmetik penamaan dilacak di #119.

## Ringkasan

- Total pengumpulan UTS: **20 mahasiswa**; **17 sudah mengumpulkan** (semua lewat PR ter-merge, lolos safety check), **3 belum** (1030, 1085, 1126).
- **12 dari 17** memenuhi ketentuan artefak secara isi: Intan (1018), Ridho (1024), Rian (1004), Yelly (1033), Adrian (1087), Kikania (1094), Marsya (1100), Jajang (1102), Andre (1113), Talitha (1114).
- **5 dari 17** belum lengkap: Ghatan (1001), Nazwa (1008), Dian Erwin (1022), Panji (1088), Tika (1098).
- Komponen paling sering bermasalah: **`laporan-progress-uts.md` tidak ada** (1 kasus: Panji — bobot 60%), **`tes-konsep-uts.md` tidak ada** (1 kasus: Ghatan — bobot 40%), dan **tangkapan layar aplikasi** (2 kasus: Nazwa, Panji).
- Semua **13** yang punya `laporan-progress-uts.md` sudah mengikuti template bagian 1–7 / 2.1–2.9. Namun **4** di antaranya tidak mencantumkan deklarasi penggunaan AI sama sekali (Ghatan, Yelly, Marsya, Talitha) dan **1** (Tika) menyisipkan deklarasi dalam bentuk template yang belum diisi (`[Gemini] — [aktivitas spesifik yang dibantu]`).

### Permasalahan per Mahasiswa

| NIM | Nama | Permasalahan |
|:---:|:-----|:-------------|
| 230660221001 | Ghatan Zalfaa Kautsar | `tes-konsep-uts.md` tidak ada sama sekali (komponen bobot 40% = 0); `screenshot-feedback.png` berisi SnackBar konfirmasi pesanan, bukan form validasi → bukti form tidak ada |
| 230660221008 | Nazwa Umaira Nanindia Ramdhani | 0 file screenshot di `Tugas-8/`; `README.md` 0 byte (kosong) |
| 230660221022 | Dian Erwin | Bukti form validasi tidak ada (hanya daftar + hapus); `README.md` tidak ada |
| 230660221088 | Muhammad Panji Adhitya | `Pertemuan 8/` hanya berisi `Soal-1..10.md`: `laporan-progress-uts.md` tidak ada (bobot 60% = 0), 0 screenshot, `README.md` tidak ada; jawaban soal juga memakai domain "pengajuan surat" (studi kasus UTS) sehingga terpisah dari domain proyeknya (pendataan FEMA) |
| 230660221098 | Tika Anggraeni | `README.md` tidak ada di `tugas-8/`; deklarasi penggunaan AI masih berupa template yang belum diisi: "Deklarasi penggunaan AI: [Gemini] — [aktivitas spesifik yang dibantu]" |

### Permasalahan Ringan / Kosmetik

| NIM | Nama | Permasalahan |
|:---:|:-----|:-------------|
| 230660221004 | Rian Rianto | Folder `Tugas-5/6/7/8` kapital (repo memakai huruf kecil) |
| 230660221012 | Paizal Rizki Nugraha | Folder `Tugas 1..8` (spasi + kapital); **NIM salah tulis `23066022112`**; ekstensi ganda `.png.png`/`.md.md`; nama berkas soal `Soal 1 - 10.md` |
| 230660221024 | Ridho Akmal Aulia | ~~`REAME.md` (typo)~~ — **selesai** (PR #109, 11 Nov) |
| 230660221030 | Syifa Nur Insani | Folder `Tugas-5/6/7` kapital |
| 230660221087 | Adrian Nugraha | Nama file `screen**s**hoot-*.png` (typo, harus `screenshot`); folder `tugasUTS-8/` tidak sesuai konvensi `tugas-8` |
| 230660221088 | Muhammad Panji Adhitya | Folder `Pertemuan 4..8` tidak sesuai konvensi `tugas-4..8` (repo sudah menormalisasi 2 mahasiswanya sendiri ke `tugas-*`) |
| 230660221114 | Talitha Ardelia Ivana | Folder `tugas1..tugas8` tanpa tanda hubung |
| 230660221033 | Yelly Ambarwaty | `wireframe.png` 3,8 MB (repo jadi besar; compress/downscale advisable) |
| 230660221100 | Marsya Anastasya | Tautan M1–M3 dikunci ke commit SHA lama (`747f1fee`) alih-alih `main` — tautan ikut tertua saat branch maju |

## Tindak lanjut

1. **Ghatan Zalfaa Kautsar (230660221001)** — wajib menambahkan `tes-konsep-uts.md` (Soal 1–10) dan screenshot form validasi, lalu kumpulkan ulang (PR baru). Tanpa ini, komponen tes konsep = 0.
2. ~~**Rian Rianto (230660221004)**~~ — **selesai** (PR #107, 11 Nov): 3 screenshot kini file PNG, sudah diverifikasi isinya.
3. **Nazwa Umaira Nanindia Ramdhani (230660221008)** — wajib menambahkan minimal 3 screenshot (daftar/form/hapus) dan mengisi `README.md`, lalu kumpulkan ulang.
4. ~~**Paizal Rizki Nugraha (230660221012)**~~ — **selesai** (PR #117, 18 Nov): laporan progress, soal 1–10 dalam satu berkas, 3 screenshot. Sisa kosmetik: NIM salah tulis `23066022112`, ekstensi ganda, nama berkas soal → issue #119.
5. **Dian Erwin (230660221022)** — tambahkan screenshot form validasi dan `README.md`, lalu kumpulkan ulang.
6. ~~**Deyna Angeliawati Zahara (230660221032)**~~ — **selesai** (PR #118, 18 Nov): `screenshot-daftar.png` identik dengan `tugas-7/screenshot-daftar.png`, `README.md` ditambahkan, laporan diperbarui.
7. **Panji Adhitya (230660221088)** — wajib menambahkan `laporan-progress-uts.md`, minimal 3 screenshot, dan `README.md`; opsional rapikan nama folder `Pertemuan N` → `tugas-N` seperti mahasiswa lain.
8. **Tika Anggraeni (230660221098)** — tambahkan `README.md` di `tugas-8/` dan isi deklarasi penggunaan AI yang masih berupa template.
9. **Mahasiswa yang belum mengumpulkan** — 230660221030, 230660221085, 230660221126 (Annisa: pernah submit lalu di-revert, silakan kumpulkan ulang).
10. **Deklarasi penggunaan AI** — lengkapi di laporan progress: Ghatan (1001), Yelly (1033), Marsya (1100), Talitha (1114) belum menyebut sama sekali; Tika (1098) masih template.
11. **Kosmetik (boleh menyusul)** — rename `screen**s**hoot-*.png` (Adrian), normalisasi `Pertemuan N`/`Tugas-N`/`tugasN` (Paizal, Panji, Talitha, Syifa, Rian), dan kompres `wireframe.png` 3,8 MB (Yelly). ~~`REAME.md` (Ridho)~~ — selesai lewat PR #109.

## Catatan teknis

- File ini dibuat di local dan **tidak** di-push/commit ke repositori.
- Seluruh status di atas diverifikasi langsung di tree `origin/main` (commit `56f17ec`): keberadaan & ukuran file, jumlah jawaban per soal (`## Soal N` pada `tes-konsep-uts.md`), struktur bagian pada `laporan-progress-uts.md`, serta kesamaan hash blob screenshot untuk mendeteksi gambar yang disalin dari folder tugas-4..7 atau dari prototipe tugas-5.
- PR UTS yang ter-merge: #65 (1087), #67 (1032), #69 (1001), #70 (1098), #71 (1022), #72 (1018), #73 (1033), #74 (1008), #77 (1102), #78 (1012), #79+#80 (1100), #81 (1094), #82 (1024), #83 (1113), #85 (1088), #86 (1114), #87 (1004).
- Perubahan sejak versi rekap 2026-11-06: PR #82 (1024), #83 (1113), #85 (1088), #86 (1114), #87 (1004) sudah ter-merge → total pengumpulan naik dari 12 ke 17; koreksi pada status Deyna (1032) dan Rian (1004).
- Audit isi visual screenshot (apakah benar-benar form/daftar/hapus) dilakukan pada kasus meragukan: Ghatan (1001) `screenshot-feedback.png` = SnackBar, bukan form; Deyna (1032) `halaman-utama.png` = prototipe tugas-5; Panji (1088) `Screenshot-hapus-data.png` = empty state "Belum ada kejadian yang dicatat", bukan dialog konfirmasi hapus.
