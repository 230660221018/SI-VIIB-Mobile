import 'package:flutter/material.dart';
import 'models/data_peminjaman.dart';
import 'models/peminjaman_ringkas.dart';
import 'services/integrasi_service.dart';

void main() {
  runApp(const CeriaReadsIntegrasiApp());
}

class CeriaReadsIntegrasiApp extends StatelessWidget {
  const CeriaReadsIntegrasiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CeriaReads — Integrasi Proses Bisnis',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF4F46E5)),
        scaffoldBackgroundColor: const Color(0xFFF1F5F9),
      ),
      home: const HalamanPeminjamanTerintegrasi(),
    );
  }
}

class HalamanPeminjamanTerintegrasi extends StatefulWidget {
  const HalamanPeminjamanTerintegrasi({super.key});

  @override
  State<HalamanPeminjamanTerintegrasi> createState() => _HalamanPeminjamanTerintegrasiState();
}

class _HalamanPeminjamanTerintegrasiState extends State<HalamanPeminjamanTerintegrasi> {
  bool _sedangMemuat = true;
  String? _pesanError;
  List<PeminjamanRingkas> _semuaData = [];
  StatusPeminjaman? _filterStatus;

  @override
  void initState() {
    super.initState();
    _muatDataTerintegrasi();
  }

  Future<void> _muatDataTerintegrasi() async {
    setState(() {
      _sedangMemuat = true;
      _pesanError = null;
    });

    try {
      final hasil = await IntegrasiService.ambilPeminjamanTerintegrasi();
      if (!mounted) return;
      setState(() {
        _semuaData = hasil;
        _sedangMemuat = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _pesanError = e.toString().replaceAll('Exception: ', '');
        _sedangMemuat = false;
      });
    }
  }

  List<PeminjamanRingkas> get _dataTersaring {
    if (_filterStatus == null) return _semuaData;
    return _semuaData.where((item) => item.status == _filterStatus).toList();
  }

  Color _warnaStatus(StatusPeminjaman status) {
    switch (status) {
      case StatusPeminjaman.disetujui:
        return const Color(0xFF15803D);
      case StatusPeminjaman.ditolak:
        return const Color(0xFFB91C1C);
      case StatusPeminjaman.menunggu:
        return const Color(0xFFB45309);
    }
  }

  Color _latarStatus(StatusPeminjaman status) {
    switch (status) {
      case StatusPeminjaman.disetujui:
        return const Color(0xFFDCFCE7);
      case StatusPeminjaman.ditolak:
        return const Color(0xFFFEE2E2);
      case StatusPeminjaman.menunggu:
        return const Color(0xFFFEF3C7);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Proses Peminjaman CeriaReads'),
        backgroundColor: const Color(0xFF4F46E5),
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: 'Segarkan Data',
            onPressed: _sedangMemuat ? null : _muatDataTerintegrasi,
          ),
        ],
      ),
      body: Column(
        children: [
          _bangunBarFilter(),
          Expanded(child: _bangunKontenUtama()),
        ],
      ),
    );
  }

  Widget _bangunBarFilter() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          ChoiceChip(
            label: const Text('Semua'),
            selected: _filterStatus == null,
            onSelected: (_) => setState(() => _filterStatus = null),
          ),
          const SizedBox(width: 8),
          ChoiceChip(
            label: const Text('Menunggu'),
            selected: _filterStatus == StatusPeminjaman.menunggu,
            onSelected: (_) => setState(() => _filterStatus = StatusPeminjaman.menunggu),
          ),
          const SizedBox(width: 8),
          ChoiceChip(
            label: const Text('Disetujui'),
            selected: _filterStatus == StatusPeminjaman.disetujui,
            onSelected: (_) => setState(() => _filterStatus = StatusPeminjaman.disetujui),
          ),
          const SizedBox(width: 8),
          ChoiceChip(
            label: const Text('Ditolak'),
            selected: _filterStatus == StatusPeminjaman.ditolak,
            onSelected: (_) => setState(() => _filterStatus = StatusPeminjaman.ditolak),
          ),
        ],
      ),
    );
  }

  Widget _bangunKontenUtama() {
    // 1. State Loading
    if (_sedangMemuat) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text('Mengintegrasikan data anggota & peminjaman...'),
          ],
        ),
      );
    }

    // 2. State Error
    if (_pesanError != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 64, color: Colors.redAccent),
              const SizedBox(height: 16),
              const Text(
                'Gagal Memuat Integrasi Data',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                _pesanError!,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey.shade700),
              ),
              const SizedBox(height: 24),
              FilledButton.icon(
                onPressed: _muatDataTerintegrasi,
                icon: const Icon(Icons.refresh),
                label: const Text('Coba Lagi'),
              ),
            ],
          ),
        ),
      );
    }

    // 3. State Data Kosong
    final daftarTampil = _dataTersaring;
    if (daftarTampil.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.inbox_outlined, size: 64, color: Colors.grey.shade400),
            const SizedBox(height: 12),
            Text(
              'Tidak ada data peminjaman pada kategori ini.',
              style: TextStyle(color: Colors.grey.shade600, fontSize: 15),
            ),
          ],
        ),
      );
    }

    // 4. State Sukses
    return RefreshIndicator(
      onRefresh: _muatDataTerintegrasi,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        itemCount: daftarTampil.length,
        itemBuilder: (context, index) {
          final item = daftarTampil[index];
          return Card(
            elevation: 0,
            margin: const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
              side: BorderSide(color: Colors.grey.shade300),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          item.namaPeminjam,
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: _latarStatus(item.status),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          item.labelStatus,
                          style: TextStyle(
                            color: _warnaStatus(item.status),
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item.emailPeminjam,
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                  ),
                  const Divider(height: 20),
                  Row(
                    children: [
                      const Icon(Icons.menu_book, size: 18, color: Color(0xFF4F46E5)),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          item.judulBuku,
                          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}