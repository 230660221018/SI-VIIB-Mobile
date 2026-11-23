import 'package:flutter/material.dart';

import 'models/data_pengajuan.dart';
import 'services/integrasi_service.dart';

void main() {
  runApp(const AplikasiPengaduanTerintegrasi());
}

class AplikasiPengaduanTerintegrasi extends StatelessWidget {
  const AplikasiPengaduanTerintegrasi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Integrasi Pengaduan Fasilitas Kampus',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const HalamanIntegrasiPengaduan(),
    );
  }
}

class HalamanIntegrasiPengaduan extends StatefulWidget {
  const HalamanIntegrasiPengaduan({super.key});

  @override
  State<HalamanIntegrasiPengaduan> createState() =>
      _HalamanIntegrasiPengaduanState();
}

class _HalamanIntegrasiPengaduanState extends State<HalamanIntegrasiPengaduan> {
  bool _sedangMemuat = true;
  String? _pesanError;
  List<DataPengajuanRingkas> _daftarPengajuan = [];
  StatusPengajuan? _filterStatus;

  @override
  void initState() {
    super.initState();
    _muatDataTerintegrasi();
  }

  Future<void> _muatDataTerintegrasi({bool simulasiKosong = false}) async {
    setState(() {
      _sedangMemuat = true;
      _pesanError = null;
    });

    try {
      final hasil = await IntegrasiService.ambilPengajuanTerintegrasi(
        simulasiDataKosong: simulasiKosong,
      );
      if (!mounted) return;
      setState(() {
        _daftarPengajuan = hasil;
        _sedangMemuat = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _pesanError = e.toString().replaceFirst('Exception: ', '');
        _sedangMemuat = false;
      });
    }
  }

  List<DataPengajuanRingkas> get _daftarTersaring {
    if (_filterStatus == null) return _daftarPengajuan;
    return _daftarPengajuan
        .where((item) => item.status == _filterStatus)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengaduan Fasilitas Terintegrasi'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        actions: [
          IconButton(
            tooltip: 'Muat Ulang Data',
            icon: const Icon(Icons.refresh),
            onPressed: _sedangMemuat ? null : () => _muatDataTerintegrasi(),
          ),
          PopupMenuButton<String>(
            tooltip: 'Skenario Pengujian State',
            onSelected: (pilihan) {
              if (pilihan == 'normal') {
                setState(() => _filterStatus = null);
                _muatDataTerintegrasi(simulasiKosong: false);
              } else if (pilihan == 'kosong') {
                setState(() => _filterStatus = null);
                _muatDataTerintegrasi(simulasiKosong: true);
              }
            },
            itemBuilder: (context) => const [
              PopupMenuItem(
                value: 'normal',
                child: Text('Muat Data Normal (3 Endpoint)'),
              ),
              PopupMenuItem(
                value: 'kosong',
                child: Text('Uji State Data Kosong'),
              ),
            ],
          ),
        ],
      ),
      body: _bangunKontenHalaman(),
    );
  }

  Widget _bangunKontenHalaman() {
    // 1. STATE LOADING
    if (_sedangMemuat) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 16),
              Text(
                'Menggabungkan data pengguna, fasilitas, dan pengaduan...',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
            ],
          ),
        ),
      );
    }

    // 2. STATE ERROR + TOMBOL COBA LAGI
    if (_pesanError != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.cloud_off, size: 64, color: Colors.red),
              const SizedBox(height: 16),
              const Text(
                'Gagal Memuat Integrasi Data',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                _pesanError!,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.black87),
              ),
              const SizedBox(height: 20),
              FilledButton.icon(
                onPressed: () => _muatDataTerintegrasi(),
                icon: const Icon(Icons.refresh),
                label: const Text('Coba Lagi'),
              ),
            ],
          ),
        ),
      );
    }

    // 3. STATE DATA KOSONG (Response 200 OK tetapi list kosong)
    if (_daftarPengajuan.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.inbox_outlined,
                  size: 64, color: Colors.grey.shade500),
              const SizedBox(height: 16),
              const Text(
                'Belum Ada Pengaduan Masuk',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'Server merespons normal, namun daftar laporan pengaduan fasilitas saat ini masih kosong.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black54),
              ),
              const SizedBox(height: 20),
              OutlinedButton.icon(
                onPressed: () => _muatDataTerintegrasi(),
                icon: const Icon(Icons.refresh),
                label: const Text('Muat Ulang Data'),
              ),
            ],
          ),
        ),
      );
    }

    // 4. STATE DATA BERHASIL DIMUAT
    final daftarTampil = _daftarTersaring;

    return Column(
      children: [
        _bangunBarFilterStatus(),
        Expanded(
          child: daftarTampil.isEmpty
              ? Center(
                  child: Text(
                    'Tidak ada pengaduan dengan status "${_filterStatus?.label}".',
                    style: const TextStyle(color: Colors.black54),
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.all(12),
                  itemCount: daftarTampil.length,
                  itemBuilder: (context, index) {
                    return _bangunKartuPengajuan(daftarTampil[index]);
                  },
                ),
        ),
      ],
    );
  }

  Widget _bangunBarFilterStatus() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.fromLTRB(12, 10, 12, 4),
      child: Row(
        children: [
          FilterChip(
            label: Text('Semua (${_daftarPengajuan.length})'),
            selected: _filterStatus == null,
            onSelected: (_) => setState(() => _filterStatus = null),
          ),
          const SizedBox(width: 8),
          ...StatusPengajuan.values.map((status) {
            final jumlah =
                _daftarPengajuan.where((e) => e.status == status).length;
            return Padding(
              padding: const EdgeInsets.only(right: 8),
              child: FilterChip(
                label: Text('${status.label} ($jumlah)'),
                selected: _filterStatus == status,
                onSelected: (_) => setState(() => _filterStatus = status),
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _bangunKartuPengajuan(DataPengajuanRingkas item) {
    final Color warnaStatus = _warnaStatusProses(item.status);

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    item.namaFasilitas,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: warnaStatus,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    item.status.label,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Text(
              'Tiket #${item.idPengajuan} • ${item.lokasiGedung}',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              item.judulKendala,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              item.detailKendala,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 13, color: Colors.black87),
            ),
            const Divider(height: 18),
            Row(
              children: [
                const Icon(Icons.person_outline, size: 16, color: Colors.grey),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    'Pelapor: ${item.namaPelapor} (ID #${item.userId})',
                    style: const TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Color _warnaStatusProses(StatusPengajuan status) {
    switch (status) {
      case StatusPengajuan.selesai:
        return Colors.green.shade700;
      case StatusPengajuan.diproses:
        return Colors.orange.shade800;
      case StatusPengajuan.ditolak:
        return Colors.grey.shade700;
      case StatusPengajuan.menunggu:
        return Colors.red.shade700;
    }
  }
}