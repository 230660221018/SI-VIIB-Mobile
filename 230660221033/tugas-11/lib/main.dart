import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'services/lampiran_foto_service.dart';

void main() {
  runApp(const CeriaReadsFiturPerangkatApp());
}

class CeriaReadsFiturPerangkatApp extends StatelessWidget {
  const CeriaReadsFiturPerangkatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CeriaReads — Lampiran Foto Buku',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF4F46E5)),
        scaffoldBackgroundColor: const Color(0xFFF1F5F9),
      ),
      home: const HalamanLampiranFotoBuku(),
    );
  }
}

class HalamanLampiranFotoBuku extends StatefulWidget {
  const HalamanLampiranFotoBuku({super.key});

  @override
  State<HalamanLampiranFotoBuku> createState() => _HalamanLampiranFotoBukuState();
}

class _HalamanLampiranFotoBukuState extends State<HalamanLampiranFotoBuku> {
  final LampiranFotoService _fotoService = LampiranFotoService();
  final TextEditingController _judulController = TextEditingController(
    text: 'Filosofi Teras — Henry Manampiring',
  );

  bool _sedangMemproses = false;
  HasilPilihanFoto? _fotoTerlampir;
  String? _pesanError;
  bool _isPermissionDitolak = false;
  ImageSource? _sumberTerakhir;

  @override
  void dispose() {
    _judulController.dispose();
    super.dispose();
  }

  Future<void> _prosesAmbilFoto(ImageSource sumber) async {
    setState(() {
      _sedangMemproses = true;
      _pesanError = null;
      _isPermissionDitolak = false;
      _sumberTerakhir = sumber;
    });

    try {
      final hasil = await _fotoService.pilihFotoKondisiBuku(sumber);

      if (!mounted) return;

      if (hasil == null) {
        // Pengguna membatalkan aksi: pertahankan state foto sebelumnya
        setState(() {
          _sedangMemproses = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Pemilihan foto dibatalkan. Data sebelumnya tetap dipertahankan.'),
            duration: Duration(seconds: 2),
          ),
        );
        return;
      }

      // Berhasil memilih foto
      setState(() {
        _fotoTerlampir = hasil;
        _sedangMemproses = false;
      });
    } on PermissionDitolakException catch (e) {
      if (!mounted) return;
      setState(() {
        _pesanError = e.pesan;
        _isPermissionDitolak = true;
        _sedangMemproses = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _pesanError = e.toString().replaceAll('Exception: ', '');
        _isPermissionDitolak = false;
        _sedangMemproses = false;
      });
    }
  }

  void _kirimPengajuanDenganFoto() {
    if (_fotoTerlampir == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Harap lampirkan foto kondisi buku terlebih dahulu.'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Pengajuan buku "${_judulController.text}" beserta bukti foto (${_fotoTerlampir!.namaFile}) siap diproses!',
        ),
        backgroundColor: Colors.green.shade700,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CeriaReads — Bukti Kondisi Buku'),
        backgroundColor: const Color(0xFF4F46E5),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _bangunKartuInfoBuku(),
            const SizedBox(height: 16),
            _bangunAreaLampiranFoto(),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: _sedangMemproses ? null : _kirimPengajuanDenganFoto,
              icon: const Icon(Icons.check_circle_outline),
              label: const Text('Konfirmasi & Lampirkan ke Peminjaman'),
              style: FilledButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: const Color(0xFF4F46E5),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _bangunKartuInfoBuku() {
    return Card(
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
              'Detail Transaksi Peminjaman',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _judulController,
              decoration: const InputDecoration(
                labelText: 'Judul Buku Koleksi Panti Baca Ceria',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.book),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _bangunAreaLampiranFoto() {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
        side: BorderSide(color: Colors.grey.shade300),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Lampiran Foto Kondisi Fisik Buku',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 4),
            Text(
              'Unggah foto sampul/halaman buku sebelum dipinjam (Maks. 5 MB).',
              style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
            ),
            const SizedBox(height: 16),

            // Kotak Pratinjau / Status
            Container(
              height: 220,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: _pesanError != null ? Colors.red.shade300 : Colors.grey.shade300,
                ),
              ),
              child: _bangunKontenPratinjau(),
            ),

            const SizedBox(height: 16),

            // Tombol Aksi Kamera & Galeri
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: _sedangMemproses
                        ? null
                        : () => _prosesAmbilFoto(ImageSource.camera),
                    icon: const Icon(Icons.camera_alt),
                    label: const Text('Ambil Kamera'),
                    style: OutlinedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 12)),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: _sedangMemproses
                        ? null
                        : () => _prosesAmbilFoto(ImageSource.gallery),
                    icon: const Icon(Icons.photo_library),
                    label: const Text('Pilih Galeri'),
                    style: OutlinedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 12)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _bangunKontenPratinjau() {
    // 1. State Loading
    if (_sedangMemproses) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 12),
            Text('Memproses gambar dari perangkat...'),
          ],
        ),
      );
    }

    // 2. State Permission Ditolak atau Error
    if (_pesanError != null) {
      return Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              _isPermissionDitolak ? Icons.no_photography : Icons.error_outline,
              color: Colors.redAccent,
              size: 40,
            ),
            const SizedBox(height: 8),
            Text(
              _isPermissionDitolak ? 'Izin Akses Ditolak' : 'Gagal Memuat Foto',
              style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
            ),
            const SizedBox(height: 4),
            Text(
              _pesanError!,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12),
            ),
            const SizedBox(height: 10),
            TextButton.icon(
              onPressed: _sumberTerakhir != null
                  ? () => _prosesAmbilFoto(_sumberTerakhir!)
                  : null,
              icon: const Icon(Icons.refresh, size: 18),
              label: const Text('Coba Lagi'),
            ),
          ],
        ),
      );
    }

    // 3. State Berhasil (Ada Foto Terlampir)
    if (_fotoTerlampir != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(11),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.memory(
              _fotoTerlampir!.bytes,
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                color: Colors.black.withValues(alpha: 0.65),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        _fotoTerlampir!.namaFile,
                        style: const TextStyle(color: Colors.white, fontSize: 12),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      _fotoTerlampir!.ukuranFormatted,
                      style: const TextStyle(
                        color: Colors.greenAccent,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    // 4. State Awal Kosong
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.add_a_photo_outlined, size: 48, color: Colors.grey.shade400),
        const SizedBox(height: 8),
        Text(
          'Belum ada foto kondisi buku yang dipilih',
          style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
        ),
      ],
    );
  }
}