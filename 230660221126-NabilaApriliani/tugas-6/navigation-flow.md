# Navigation Flow — [Nama Aplikasi Kamu]

## 1. Daftar Route
| Nama Route | Layar Terkait | Kebutuhan yang Dipenuhi (ID Tugas 4-5) | Status Awal |
|:---|:---|:---|:---|
| `/` | Halaman Utama / Daftar | F-03 (Melihat daftar/status) | **Initial Route** |
| `/form` | Form Pengajuan | F-01 (Membuat pengajuan/input data) | - |
| `/detail` | Detail Informasi | F-03 (Melihat detail data terpilih) | - |

## 2. Diagram Alur (Mermaid)
Diagram berikut menunjukkan alur navigasi maju, kembali, dan pengiriman data untuk tugas utama:

```mermaid
flowchart TD
    D["Halaman Utama (/)\n(F-03)"] -->|"Tombol Tambah/Ajukan (pushNamed)"| F["Form Pengajuan (/form)\n(F-01)"]
    F -->|"Kirim Valid -> SnackBar -> pop"| D
    D -->|"Ketuk Kartu + arguments (pushNamed)"| T["Detail Informasi (/detail)\n(F-03)"]
    T -->|"Tombol Kembali (pop)"| D