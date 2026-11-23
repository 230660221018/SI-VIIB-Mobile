import 'package:flutter/material.dart';

// Model data sederhana untuk pengiriman data antarlayar
class DataPengajuan {
  final String judul;
  final String tanggal;
  final String keterangan;

  DataPengajuan({
    required this.judul,
    required this.tanggal,
    required this.keterangan,
  });
}

void main() {
  runApp(const AplikasiNavigasiMobile());
}

class AplikasiNavigasiMobile extends StatelessWidget {
  const AplikasiNavigasiMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas 6 - Navigasi & Interaksi',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => const HalamanUtama(),
        '/form': (context) => const FormPengajuan(),
        '/detail': (context) => const DetailPengajuan(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

// 1. HALAMAN UTAMA (/)
class HalamanUtama extends StatelessWidget {
  const HalamanUtama({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daftar Pengajuan - Mobile')),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Card(
            elevation: 2,
            child: ListTile(
              leading: const Icon(Icons.description, color: Colors.blue),
              title: const Text('Pengajuan Layanan Utama'),
              subtitle: const Text('Ketuk untuk melihat detail atau tambah data baru'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                final dataContoh = DataPengajuan(
                  judul: 'Pengajuan Layanan Utama',
                  tanggal: '2026-10-25',
                  keterangan: 'Data pengajuan telah disetujui dan tercatat dalam sistem.',
                );
                Navigator.pushNamed(context, '/detail', arguments: dataContoh);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/form');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

// 2. FORM PENGAJUAN (/form)
class FormPengajuan extends StatefulWidget {
  const FormPengajuan({super.key});

  @override
  State<FormPengajuan> createState() => _FormPengajuanState();
}

class _FormPengajuanState extends State<FormPengajuan> {
  final _formKey = GlobalKey<FormState>();
  final _judulController = TextEditingController();
  final _keteranganController = TextEditingController();

  @override
  void dispose() {
    _judulController.dispose();
    _keteranganController.dispose();
    super.dispose();
  }

  void _kirimData() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final judul = _judulController.text.trim();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Pengajuan "$judul" berhasil dikirim (simulasi).')),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Form Pengajuan Baru')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _judulController,
                decoration: const InputDecoration(
                  labelText: 'Judul Pengajuan',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Judul pengajuan wajib diisi.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _keteranganController,
                decoration: const InputDecoration(
                  labelText: 'Keterangan / Keperluan',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Keterangan wajib diisi.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _kirimData,
                child: const Text('Kirim Pengajuan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// 3. HALAMAN DETAIL (/detail)
class DetailPengajuan extends StatelessWidget {
  const DetailPengajuan({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;
    final pengajuan = args is DataPengajuan ? args : null;

    return Scaffold(
      appBar: AppBar(title: const Text('Detail Pengajuan')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: pengajuan == null
            ? const Center(child: Text('Data tidak tersedia atau dibuka tanpa arguments.'))
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Judul: ${pengajuan.judul}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text('Tanggal: ${pengajuan.tanggal}', style: const TextStyle(color: Colors.grey)),
                  const SizedBox(height: 16),
                  Text('Keterangan: ${pengajuan.keterangan}'),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Kembali'),
                  ),
                ],
              ),
      ),
    );
  }
}