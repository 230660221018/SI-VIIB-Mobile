# Diagram Alur Integrasi Data dan Proses Bisnis — Tugas 10

## 1. Alur Request Paralel (`Future.wait`) dan Penggabungan Data

```mermaid
flowchart TD
    UI["HalamanIntegrasiPengaduan<br>(StatefulWidget)"] -->|"initState() / Tombol Coba Lagi"| S["IntegrasiService.ambilPengajuanTerintegrasi()"]
    S --> FW{"Future.wait<br>(Eksekusi Paralel)"}
    
    FW -->|"GET /users"| E1["Endpoint Pengguna"]
    FW -->|"GET /comments"| E2["Endpoint Fasilitas (Simulasi)"]
    FW -->|"GET /posts"| E3["Endpoint Pengajuan"]

    E1 --> M1["List<DataPengguna><br>(Key: id)"]
    E2 --> M2["List<DataFasilitas><br>(Key: id)"]
    E3 --> M3["List<DataPengajuan><br>(FK: userId, fasilitasId)<br>+ Aturan Status Proses"]

    M1 --> JOIN["Penggabungan Data di Service<br>Cocokkan userId & fasilitasId"]
    M2 --> JOIN
    M3 --> JOIN

    JOIN --> VM["List<DataPengajuanRingkas>"]
    VM --> STATE{"Cek Kondisi Hasil"}
    STATE -->|"Terjadi Exception"| ERR["Tampilkan State Error + Tombol Coba Lagi"]
    STATE -->|"List Kosong []"| EMPTY["Tampilkan State Data Kosong"]
    STATE -->|"List Terisi"| LIST["Tampilkan ListView.builder + Filter Status"]