# Information Architecture (IA) — Travel Booking App

---

## 1. Inventaris Layar
Inventaris layar berdasarkan tabel pemetaan kebutuhan pada Tugas 4:

| ID Kebutuhan | Rumusan Kebutuhan | Layar yang Memenuhi | Peran / Aktor |
|:---|:---|:---|:---|
| **F-01** | Melihat daftar paket wisata | Halaman Katalog Utama (Layar Utama) | Pelanggan |
| **F-02** | Mengisi formulir pemesanan | Halaman Form Reservasi | Pelanggan |
| **F-03** | Melihat status pemesanan | Halaman Riwayat Pemesanan | Pelanggan |
| **F-04** | Kelola ketersediaan paket | Halaman Dashboard Admin | Admin |
| **F-05** | Menyetujui/menolak pesanan | Halaman Verifikasi Admin | Admin |
| **F-06** | Pencarian nama destinasi | Halaman Katalog Utama (Pencarian) | Pelanggan |

---

## 2. Peta Information Architecture (IA)

```mermaid
flowchart TD
    H["Layar Utama: Katalog Paket Wisata\n(Memenuhi: F-01, F-06)"] --> R["Formulir Reservasi\n(Memenuhi: F-02)"]
    H --> S["Riwayat Pemesanan\n(Memenuhi: F-03)"]
    A["Dashboard Admin\n(Memenuhi: F-04)"] --> V["Verifikasi Pesanan\n(Memenuhi: F-05)"]
    