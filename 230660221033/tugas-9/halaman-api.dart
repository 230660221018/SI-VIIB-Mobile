import 'package:flutter/material.dart';
import 'service-api.dart';

void main() {
  runApp(const CeriaReadsApiApp());
}

class CeriaReadsApiApp extends StatelessWidget {
  const CeriaReadsApiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CeriaReads REST API',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF4F46E5)),
        scaffoldBackgroundColor: const Color(0xFFF1F5F9),
      ),
      home: const HalamanApiCeriaReads(),
    );
  }
}

class HalamanApiCeriaReads extends StatefulWidget {
  const HalamanApiCeriaReads({super.key});

  @override
  State<HalamanApiCeriaReads> createState() => _HalamanApiCeriaReadsState();
}

class _HalamanApiCeriaReadsState extends State<HalamanApiCeriaReads> {
  bool _sedangMemuat = false;
  String? _pesanError;
  List<DataPengajuanApi> _daftarData = [];

  @override
  void initState() {
    super.initState();
    _muatDataDariApi();
  }

  // Memanggil method GET dari lapisan Service
  Future<void> _muatDataDariApi() async {
    setState(() {
      _sedangMemuat = true;
      _pesanError = null;
    });

    try {
      final hasil = await CeriaReadsApiService.ambilDaftarPengajuan();
      if (!mounted) return;
      setState(() {
        _daftarData = hasil;
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

  // Menampilkan modal form untuk operasi POST
  void _tampilkanFormKirimApi() {
    final formKey = GlobalKey<FormState>();
    final judulController = TextEditingController();
    final ketController = TextEditingController();
    bool sedangMengirim = false;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
                left: 24,
                right: 24,
                top: 24,
              ),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Kirim Pengajuan ke Server',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: judulController,
                      enabled: !sedangMengirim,
                      decoration: const InputDecoration(
                        labelText: 'Judul Buku yang Dipinjam',
                        border: OutlineInputBorder(),
                      ),
                      validator: (val) => val == null || val.trim().isEmpty ? 'Judul buku wajib diisi' : null,
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: ketController,
                      enabled: !sedangMengirim,
                      decoration: const InputDecoration(
                        labelText: 'Nama Peminjam & Durasi (misal: Yelly - 3 Hari)',
                        border: OutlineInputBorder(),
                      ),
                      validator: (val) => val == null || val.trim().isEmpty ? 'Keterangan wajib diisi' : null,
                    ),
                    const SizedBox(height: 20),
                    FilledButton.icon(
                      // Tombol dinonaktifkan selama proses pengiriman berlangsung
                      onPressed: sedangMengirim
                          ? null
                          : () async {
                              if (!formKey.currentState!.validate()) return;

                              setModalState(() => sedangMengirim = true);

                              try {
                                final payload = DataPengajuanApi(
                                  id: 0,
                                  judulBuku: judulController.text.trim(),
                                  keteranganPinjam: ketController.text.trim(),
                                );

                                final hasilPost = await CeriaReadsApiService.kirimPengajuanBaru(payload);

                                if (!context.mounted) return;
                                Navigator.pop(context); // Tutup modal

                                // Tambahkan data baru ke daftar UI agar langsung terlihat
                                setState(() {
                                  _daftarData.insert(0, hasilPost);
                                });

                                ScaffoldMessenger.of(this.context).showSnackBar(
                                  SnackBar(
                                    content: Text('Berhasil terkirim ke API (ID Server: ${hasilPost.id})'),
                                    backgroundColor: Colors.green.shade700,
                                  ),
                                );
                              } catch (e) {
                                setModalState(() => sedangMengirim = false);
                                if (!context.mounted) return;
                                ScaffoldMessenger.of(this.context).showSnackBar(
                                  SnackBar(
                                    content: Text(e.toString().replaceAll('Exception: ', '')),
                                    backgroundColor: Colors.red.shade700,
                                  ),
                                );
                              }
                            },
                      icon: sedangMengirim
                          ? const SizedBox(
                              width: 18,
                              height: 18,
                              child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                            )
                          : const Icon(Icons.cloud_upload),
                      label: Text(sedangMengirim ? 'Mengirim ke Server...' : 'Kirim Data (POST)'),
                      style: FilledButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 14)),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CeriaReads — Sinkronisasi API'),
        backgroundColor: const Color(0xFF4F46E5),
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: 'Muat Ulang Data',
            onPressed: _sedangMemuat ? null : _muatDataDariApi,
          ),
        ],
      ),
      body: _bangunTampilanUtama(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _tampilkanFormKirimApi,
        icon: const Icon(Icons.add),
        label: const Text('Ajukan (POST)'),
      ),
    );
  }

  // Menangani 3 kondisi antarmuka: Loading, Error, dan Sukses
  Widget _bangunTampilanUtama() {
    // 1. KONDISI LOADING
    if (_sedangMemuat) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text('Mengambil data dari server...', style: TextStyle(color: Colors.grey)),
          ],
        ),
      );
    }

    // 2. KONDISI ERROR
    if (_pesanError != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.cloud_off, size: 64, color: Colors.redAccent),
              const SizedBox(height: 16),
              const Text(
                'Gagal Terhubung ke Server',
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
                onPressed: _muatDataDariApi,
                icon: const Icon(Icons.refresh),
                label: const Text('Coba Lagi'),
              ),
            ],
          ),
        ),
      );
    }

    // 3. KONDISI DATA KOSONG
    if (_daftarData.isEmpty) {
      return const Center(child: Text('Belum ada data pengajuan di server.'));
    }

    // 4. KONDISI SUKSES
    return RefreshIndicator(
      onRefresh: _muatDataDariApi,
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _daftarData.length,
        itemBuilder: (context, index) {
          final item = _daftarData[index];
          return Card(
            elevation: 0,
            margin: const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(color: Colors.grey.shade300),
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: const Color(0xFFE0E7FF),
                child: Text(
                  '#${item.id}',
                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF4F46E5)),
                ),
              ),
              title: Text(
                item.judulBuku,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                item.keteranganPinjam,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          );
        },
      ),
    );
  }
}