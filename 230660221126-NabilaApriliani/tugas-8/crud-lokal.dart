import 'package:flutter/material.dart';

void main() {
  runApp(const AplikasiPengajuanApp());
}

// -----------------------------------------------------------------------------
// 1. MODEL DATA (Sesuai model-data.md)
// -----------------------------------------------------------------------------
class DataPengajuan {
  final String id;
  final String ruang;
  final String tanggal;
  final String jam;
  final String status;

  const DataPengajuan({
    required this.id,
    required this.ruang,
    required this.tanggal,
    required this.jam,
    required this.status,
  });

  @override
  String toString() => 'Pengajuan $ruang — $tanggal ($jam) [$status]';
}

// -----------------------------------------------------------------------------
// 2. APLIKASI UTAMA
// -----------------------------------------------------------------------------
class AplikasiPengajuanApp extends StatelessWidget {
  const AplikasiPengajuanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MVP Data Lokal Pengajuan',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const HalamanDaftarPengajuan(),
    );
  }
}

// -----------------------------------------------------------------------------
// 3. LAYAR DAFTAR (StatefulWidget)
// -----------------------------------------------------------------------------
class HalamanDaftarPengajuan extends StatefulWidget {
  const HalamanDaftarPengajuan({super.key});

  @override
  State<HalamanDaftarPengajuan> createState() => _HalamanDaftarPengajuanState();
}

class _HalamanDaftarPengajuanState extends State<HalamanDaftarPengajuan> {
  // State: menyimpan daftar pengajuan di memori lokal
  final List<DataPengajuan> _daftarPengajuan = [
    DataPengajuan(
      id: '1',
      ruang: 'Lab Komputer 1',
      tanggal: '2026-11-05',
      jam: '08:00 - 10:00',
      status: 'disetujui',
    ),
    DataPengajuan(
      id: '2',
      ruang: 'Lab Jaringan',
      tanggal: '2026-11-06',
      jam: '10:00 - 12:00',
      status: 'menunggu',
    ),
  ];

  // --- OPERASI CRUD ---

  // CREATE: Tambah Data Baru
  void _tambahPengajuan(String ruang, String tanggal, String jam) {
    final baru = DataPengajuan(
      id: DateTime.now().millisecondsSinceEpoch.toString(), // ID Unik
      ruang: ruang,
      tanggal: tanggal,
      jam: jam,
      status: 'menunggu',
    );

    setState(() {
      _daftarPengajuan.add(baru);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Pengajuan $ruang berhasil ditambahkan!')),
    );
  }

  // UPDATE: Ubah Status Pengajuan berdasarkan ID
  void _ubahStatus(String id, String statusBaru) {
    setState(() {
      final index = _daftarPengajuan.indexWhere((p) => p.id == id);
      if (index != -1) {
        final lama = _daftarPengajuan[index];
        _daftarPengajuan[index] = DataPengajuan(
          id: lama.id,
          ruang: lama.ruang,
          tanggal: lama.tanggal,
          jam: lama.jam,
          status: statusBaru,
        );
      }
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Status pengajuan berhasil diperbarui!')),
    );
  }

  // DELETE: Hapus Data berdasarkan ID
  void _hapusPengajuan(String id) {
    setState(() {
      _daftarPengajuan.removeWhere((p) => p.id == id);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Pengajuan berhasil dihapus.')),
    );
  }

  // Dialog Konfirmasi Hapus Data (Sesuai Syarat Tugas 7)
  Future<void> _konfirmasiHapus(DataPengajuan item) async {
    final yakin = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Konfirmasi Hapus'),
        content: Text('Apakah Anda yakin ingin menghapus pengajuan "${item.ruang}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Batal'),
          ),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Hapus'),
          ),
        ],
      ),
    );

    if (yakin == true) {
      _hapusPengajuan(item.id);
    }
  }

  // Modal Form Tambah Data Baru
  void _bukaFormTambah() {
    final ruangController = TextEditingController();
    final tanggalController = TextEditingController();
    final jamController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom + 16,
          top: 16,
          left: 16,
          right: 16,
        ),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Tambah Pengajuan Baru',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: ruangController,
                decoration: const InputDecoration(
                  labelText: 'Nama Ruang / Laboratorium',
                  border: OutlineInputBorder(),
                ),
                validator: (val) =>
                    val == null || val.trim().isEmpty ? 'Wajib diisi' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: tanggalController,
                decoration: const InputDecoration(
                  labelText: 'Tanggal (contoh: 2026-11-10)',
                  border: OutlineInputBorder(),
                ),
                validator: (val) =>
                    val == null || val.trim().isEmpty ? 'Wajib diisi' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: jamController,
                decoration: const InputDecoration(
                  labelText: 'Jam (contoh: 08:00 - 10:00)',
                  border: OutlineInputBorder(),
                ),
                validator: (val) =>
                    val == null || val.trim().isEmpty ? 'Wajib diisi' : null,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    _tambahPengajuan(
                      ruangController.text.trim(),
                      tanggalController.text.trim(),
                      jamController.text.trim(),
                    );
                    Navigator.pop(context);
                  }
                },
                child: const Text('Simpan Pengajuan'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // READ: Tampilan Antarmuka Daftar Pengajuan
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Pengajuan Ruang'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: _daftarPengajuan.isEmpty
          ? const Center(
              child: Text(
                'Belum ada data pengajuan.\nTekan tombol + untuk menambah.',
                textAlign: TextAlign.center,
              ),
            )
          : ListView.builder(
              itemCount: _daftarPengajuan.length,
              itemBuilder: (context, index) {
                final item = _daftarPengajuan[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: item.status == 'disetujui'
                          ? Colors.green.shade100
                          : Colors.orange.shade100,
                      child: Icon(
                        item.status == 'disetujui'
                            ? Icons.check
                            : Icons.hourglass_bottom,
                        color: item.status == 'disetujui'
                            ? Colors.green
                            : Colors.orange,
                      ),
                    ),
                    title: Text(
                      item.ruang,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('${item.tanggal} (${item.jam})\nStatus: ${item.status}'),
                    isThreeLine: true,
                    trailing: PopupMenuButton<String>(
                      onSelected: (aksi) {
                        if (aksi == 'ubah_status') {
                          final statusBaru =
                              item.status == 'menunggu' ? 'disetujui' : 'menunggu';
                          _ubahStatus(item.id, statusBaru);
                        } else if (aksi == 'hapus') {
                          _konfirmasiHapus(item);
                        }
                      },
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          value: 'ubah_status',
                          child: Text(
                            item.status == 'menunggu'
                                ? 'Setujui Pengajuan'
                                : 'Ubah ke Menunggu',
                          ),
                        ),
                        const PopupMenuItem(
                          value: 'hapus',
                          child: Text(
                            'Hapus',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _bukaFormTambah,
        child: const Icon(Icons.add),
      ),
    );
  }
}