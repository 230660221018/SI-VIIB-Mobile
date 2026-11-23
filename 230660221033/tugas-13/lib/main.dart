import 'package:flutter/material.dart';
import 'utils/form_validator.dart';

void main() {
  runApp(const CeriaReadsTestingApp());
}

class CeriaReadsTestingApp extends StatelessWidget {
  const CeriaReadsTestingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CeriaReads — Testing & Bug Fix',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF4F46E5)),
        scaffoldBackgroundColor: const Color(0xFFF1F5F9),
      ),
      home: const HalamanPeminjamanTeruji(),
    );
  }
}

class HalamanPeminjamanTeruji extends StatefulWidget {
  const HalamanPeminjamanTeruji({super.key});

  @override
  State<HalamanPeminjamanTeruji> createState() =>
      _HalamanPeminjamanTerujiState();
}

class _HalamanPeminjamanTerujiState extends State<HalamanPeminjamanTeruji> {
  final _formKey = GlobalKey<FormState>();
  final _namaController = TextEditingController();
  final _judulController = TextEditingController();
  final _durasiController = TextEditingController(text: '7');

final List _daftarPengajuan = [];
  bool _sedangMenyimpan = false;

  @override
  void dispose() {
    _namaController.dispose();
    _judulController.dispose();
    _durasiController.dispose();
    super.dispose();
  }

  Future<void> _simpanPengajuan() async {
    if (_sedangMenyimpan) return;

    if (!(_formKey.currentState?.validate() ?? false)) {
      return;
    }

    setState(() {
      _sedangMenyimpan = true;
    });

    await Future.delayed(const Duration(milliseconds: 400));

    if (!mounted) return;

    setState(() {
      _daftarPengajuan.insert(0, {
        'nama': _namaController.text.trim(),
        'judul': _judulController.text.trim(),
        'durasi': '${_durasiController.text.trim()} hari',
      });
      _namaController.clear();
      _judulController.clear();
      _durasiController.text = '7';
      _sedangMenyimpan = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Pengajuan peminjaman berhasil disimpan.'),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _hapusPengajuan(int index) {
    setState(() {
      _daftarPengajuan.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CeriaReads — Pengajuan Teruji'),
        backgroundColor: const Color(0xFF4F46E5),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: Colors.grey.shade300),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFormField(
                        key: const Key('input_nama'),
                        controller: _namaController,
                        validator: CeriaReadsValidator.validasiNama,
                        decoration: const InputDecoration(
                          labelText: 'Nama Peminjam',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        key: const Key('input_judul'),
                        controller: _judulController,
                        validator: CeriaReadsValidator.validasiJudulBuku,
                        decoration: const InputDecoration(
                          labelText: 'Judul Buku',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        key: const Key('input_durasi'),
                        controller: _durasiController,
                        validator: CeriaReadsValidator.validasiDurasiPinjam,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: 'Durasi Pinjam (Hari)',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 16),
                      FilledButton(
                        key: const Key('tombol_simpan'),
                        onPressed: _sedangMenyimpan ? null : _simpanPengajuan,
                        child: Text(
                          _sedangMenyimpan
                              ? 'Menyimpan...'
                              : 'Simpan Pengajuan',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: _daftarPengajuan.isEmpty
                  ? const Center(
                      child: Text('Belum ada data pengajuan peminjaman.'),
                    )
                  : ListView.builder(
                      itemCount: _daftarPengajuan.length,
                      itemBuilder: (context, index) {
                        final item = _daftarPengajuan[index];
                        return Card(
                          key: ValueKey('item_${item['judul']}_$index'),
                          margin: const EdgeInsets.only(bottom: 8),
                          child: ListTile(
                            title: Text(item['judul'] ?? ''),
                            subtitle: Text(
                              'Peminjam: ${item['nama']} • ${item['durasi']}',
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete_outline,
                                  color: Colors.red),
                              onPressed: () => _hapusPengajuan(index),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}