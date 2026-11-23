import 'package:flutter/material.dart';
import 'utils/form_validator.dart';

void main() {
  runApp(const CeriaReadsKeamananApp());
}

class CeriaReadsKeamananApp extends StatelessWidget {
  const CeriaReadsKeamananApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CeriaReads — Validasi & Keamanan',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF4F46E5)),
        scaffoldBackgroundColor: const Color(0xFFF1F5F9),
      ),
      home: const HalamanFormAmanCeriaReads(),
    );
  }
}

class HalamanFormAmanCeriaReads extends StatefulWidget {
  const HalamanFormAmanCeriaReads({super.key});

  @override
  State<HalamanFormAmanCeriaReads> createState() =>
      _HalamanFormAmanCeriaReadsState();
}

class _HalamanFormAmanCeriaReadsState extends State<HalamanFormAmanCeriaReads> {
  final _formKey = GlobalKey<FormState>();
  final _namaController = TextEditingController();
  final _emailController = TextEditingController();
  final _judulController = TextEditingController();
  final _durasiController = TextEditingController(text: '7');

  // Simulasi state lampiran file untuk pengujian validator file
  String _namaFileSimulasi = 'sampul_buku_kondisi.jpg';
  int _ukuranByteSimulasi = 1024 * 850; // 850 KB
  String? _errorLampiran;

  @override
  void dispose() {
    _namaController.dispose();
    _emailController.dispose();
    _judulController.dispose();
    _durasiController.dispose();
    super.dispose();
  }

  void _prosesKirimPengajuan() {
    // 1. Validasi seluruh TextFormField
    final formValid = _formKey.currentState?.validate() ?? false;

    // 2. Validasi lampiran file
    final hasilCekFile = CeriaReadsValidator.validasiFileLampiran(
      namaFile: _namaFileSimulasi,
      ukuranByte: _ukuranByteSimulasi,
    );

    setState(() {
      _errorLampiran = hasilCekFile;
    });

    if (!formValid || hasilCekFile != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Periksa kembali isian formulir yang masih salah.'),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    // Data bersih (sudah di-trim) siap dikirim melalui endpoint HTTPS
    final payloadAman = {
      'nama': _namaController.text.trim(),
      'email': _emailController.text.trim(),
      'judul_buku': _judulController.text.trim(),
      'durasi_hari': int.parse(_durasiController.text.trim()),
      'lampiran': _namaFileSimulasi,
    };

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Row(
          children: [
            Icon(Icons.verified_user, color: Colors.green),
            SizedBox(width: 8),
            Text('Validasi Client Lulus'),
          ],
        ),
        content: Text(
          'Seluruh input memenuhi aturan keamanan dan siap dikirim melalui protokol HTTPS:\n\n'
          '• Peminjam: ${payloadAman['nama']}\n'
          '• Email: ${payloadAman['email']}\n'
          '• Buku: ${payloadAman['judul_buku']}\n'
          '• Durasi: ${payloadAman['durasi_hari']} hari\n'
          '• Lampiran: ${payloadAman['lampiran']}',
        ),
        actions: [
          FilledButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Tutup'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CeriaReads — Form Peminjaman Aman'),
        backgroundColor: const Color(0xFF4F46E5),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Banner Indikator Keamanan HTTPS
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFDCFCE7),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: const Color(0xFF86EFAC)),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.lock, color: Color(0xFF15803D), size: 20),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Koneksi terenkripsi HTTPS aktif. Input disanitasi sebelum dikirim ke server.',
                        style: TextStyle(
                          color: Color(0xFF166534),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                  side: BorderSide(color: Colors.grey.shade300),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Data Peminjam & Buku',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _namaController,
                        validator: CeriaReadsValidator.validasiNama,
                        decoration: const InputDecoration(
                          labelText: 'Nama Lengkap Peminjam',
                          hintText: 'Contoh: Yelly Ambarwaty',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.person_outline),
                        ),
                      ),
                      const SizedBox(height: 14),
                      TextFormField(
                        controller: _emailController,
                        validator: CeriaReadsValidator.validasiEmail,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          labelText: 'Email Aktif Anggota',
                          hintText: 'Contoh: anggota@ceriareads.org',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.email_outlined),
                        ),
                      ),
                      const SizedBox(height: 14),
                      TextFormField(
                        controller: _judulController,
                        validator: CeriaReadsValidator.validasiJudulBuku,
                        decoration: const InputDecoration(
                          labelText: 'Judul Buku yang Dipinjam',
                          hintText: 'Maksimal 100 karakter',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.book_outlined),
                        ),
                      ),
                      const SizedBox(height: 14),
                      TextFormField(
                        controller: _durasiController,
                        validator: CeriaReadsValidator.validasiDurasiPinjam,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: 'Durasi Pinjam (1 - 14 Hari)',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.calendar_today_outlined),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Kartu Simulasi Pengujian Validator File
              Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                  side: BorderSide(
                    color: _errorLampiran != null
                        ? Colors.red
                        : Colors.grey.shade300,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Validasi Bukti Foto Kondisi Buku',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'File terpilih: $_namaFileSimulasi (${(_ukuranByteSimulasi / 1024).toStringAsFixed(0)} KB)',
                        style: const TextStyle(fontSize: 13),
                      ),
                      if (_errorLampiran != null) ...[
                        const SizedBox(height: 8),
                        Text(
                          _errorLampiran!,
                          style: const TextStyle(
                            color: Colors.red,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 8,
                        children: [
                          ActionChip(
                            label: const Text('Simulasi File Valid (.jpg)'),
                            onPressed: () => setState(() {
                              _namaFileSimulasi = 'sampul_buku_kondisi.jpg';
                              _ukuranByteSimulasi = 1024 * 850;
                              _errorLampiran = null;
                            }),
                          ),
                          ActionChip(
                            label: const Text('Simulasi Format Salah (.exe)'),
                            onPressed: () => setState(() {
                              _namaFileSimulasi = 'virus_skrip.exe';
                              _ukuranByteSimulasi = 1024 * 500;
                            }),
                          ),
                          ActionChip(
                            label: const Text('Simulasi > 5 MB'),
                            onPressed: () => setState(() {
                              _namaFileSimulasi = 'foto_resolusi_tinggi.png';
                              _ukuranByteSimulasi = 6 * 1024 * 1024;
                            }),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),

              FilledButton.icon(
                onPressed: _prosesKirimPengajuan,
                icon: const Icon(Icons.security),
                label: const Text('Validasi & Kirim Pengajuan'),
                style: FilledButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: const Color(0xFF4F46E5),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}