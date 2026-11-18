# Tugas 2 – Modul Hitung Nilai

## Identitas Mahasiswa

- **Nama:** Paizal Rizki Nugraha
- **NIM:** 230660221012
- **Mata Kuliah:** Pemrograman Aplikasi Bergerak

## Deskripsi Program

Program ini merupakan modul sederhana untuk menghitung rata-rata skor komponen penilaian dan menentukan predikat akhir. Data penilaian disimpan dalam `List` yang berisi `Map` dengan kunci `nama`, `bobot`, dan `skor`.

Program menggunakan lima komponen penilaian, yaitu Tugas, Praktikum, Kehadiran, UTS, dan UAS. Fungsi `hitungRataRata()` menjumlahkan seluruh skor kemudian membaginya dengan jumlah komponen. Fungsi `predikat()` menentukan predikat berdasarkan rentang rata-rata skor.

## Hasil Keluaran Program

```text
====================================
         MODUL HITUNG NILAI
====================================
Mata Kuliah: Pemrograman Aplikasi Bergerak

Daftar Komponen Penilaian:
Tugas - Bobot: 30 - Skor: 28
Praktikum - Bobot: 25 - Skor: 24
Kehadiran - Bobot: 10 - Skor: 9
UTS - Bobot: 20 - Skor: 17
UAS - Bobot: 15 - Skor: 13

====================================
Rata-rata Skor : 18.20
Predikat Akhir : A
====================================
```

### Perhitungan

Rata-rata skor = (28 + 24 + 9 + 17 + 13) / 5 = 91 / 5 = **18,20**.

### Aturan Predikat

Aturan predikat menggunakan rentang rata-rata skor 0–20:

- Nilai >= 18: A
- Nilai >= 16 dan < 18: B
- Nilai >= 13 dan < 16: C
- Nilai < 13: Perlu perbaikan

## Refleksi

Sintaks dasar Dart yang paling sering saya salahgunakan adalah penggunaan tipe data `int` dan `double`. Hal ini karena saya terkadang masih keliru menentukan tipe data yang sesuai, terutama ketika melakukan operasi pembagian yang menghasilkan angka desimal. Saya perlu lebih memahami perbedaan kedua tipe data tersebut agar hasil perhitungan program lebih tepat dan tidak menimbulkan kesalahan.

## Struktur Folder Pengumpulan

```text
tugas-2/
└── 230660221012 - Paizal Rizki Nugraha/
    ├── hitung_nilai.dart
    └── README.md
```
