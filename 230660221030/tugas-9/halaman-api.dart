import 'package:flutter/material.dart';

import 'service-api.dart';

class HalamanApi extends StatefulWidget {
  const HalamanApi({super.key});

  @override
  State<HalamanApi> createState() => _HalamanApiState();
}

class _HalamanApiState extends State<HalamanApi> {
  final ServiceApi _serviceApi = ServiceApi();
  final TextEditingController _judulController = TextEditingController();
  final TextEditingController _deskripsiController = TextEditingController();

  List<DataBuku> _daftarBuku = [];
  bool _sedangMemuat = true;
  bool _sedangMengirim = false;
  String? _pesanError;

  @override
  void initState() {
    super.initState();
    muatData();
  }

  @override
  void dispose() {
    _judulController.dispose();
    _deskripsiController.dispose();
    super.dispose();
  }

  Future<void> muatData() async {
    setState(() {
      _sedangMemuat = true;
      _pesanError = null;
    });

    try {
      final hasil = await _serviceApi.ambilDaftarBuku();
      if (!mounted) return;

      setState(() {
        _daftarBuku = hasil;
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

  Future<bool> kirimData() async {
    final judul = _judulController.text.trim();
    final deskripsi = _deskripsiController.text.trim();

    if (judul.isEmpty || deskripsi.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Judul dan deskripsi wajib diisi.'),
        ),
      );
      return false;
    }

    setState(() => _sedangMengirim = true);

    try {
      final bukuBaru = await _serviceApi.tambahBuku(
        judul: judul,
        deskripsi: deskripsi,
      );

      if (!mounted) return false;

      setState(() {
        _daftarBuku.insert(0, bukuBaru);
        _sedangMengirim = false;
      });

      _judulController.clear();
      _deskripsiController.clear();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'POST berhasil. Data respons ditambahkan ke daftar sementara.',
          ),
        ),
      );
      return true;
    } catch (e) {
      if (!mounted) return false;

      setState(() => _sedangMengirim = false);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Gagal mengirim data: ${e.toString().replaceFirst('Exception: ', '')}',
          ),
        ),
      );
      return false;
    }
  }

  Future<void> tampilkanFormTambah() async {
    _judulController.clear();
    _deskripsiController.clear();

    await showDialog<void>(
      context: context,
      builder: (dialogContext) {
        bool sedangMengirimDialog = false;

        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              title: const Text('Tambah Data melalui API'),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: _judulController,
                      decoration: const InputDecoration(
                        labelText: 'Judul buku',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: _deskripsiController,
                      maxLines: 3,
                      decoration: const InputDecoration(
                        labelText: 'Deskripsi',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: sedangMengirimDialog
                      ? null
                      : () => Navigator.pop(dialogContext),
                  child: const Text('Batal'),
                ),
                ElevatedButton(
                  onPressed: sedangMengirimDialog
                      ? null
                      : () async {
                          setDialogState(
                            () => sedangMengirimDialog = true,
                          );

                          final berhasil = await kirimData();

                          if (!mounted) return;

                          setDialogState(
                            () => sedangMengirimDialog = false,
                          );

                          if (berhasil && dialogContext.mounted) {
                            Navigator.pop(dialogContext);
                          }
                        },
                  child: sedangMengirimDialog
                      ? const SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Text('Kirim'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Widget tampilanLoading() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 12),
          Text('Sedang mengambil data dari server...'),
        ],
      ),
    );
  }

  Widget tampilanError() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.cloud_off, size: 64, color: Colors.redAccent),
            const SizedBox(height: 12),
            const Text(
              'Data gagal dimuat',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(_pesanError ?? 'Terjadi kesalahan yang tidak diketahui.',
                textAlign: TextAlign.center),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: muatData,
              icon: const Icon(Icons.refresh),
              label: const Text('Coba Lagi'),
            ),
          ],
        ),
      ),
    );
  }

  Widget tampilanSukses() {
    if (_daftarBuku.isEmpty) {
      return const Center(child: Text('Belum ada data dari API.'));
    }

    return RefreshIndicator(
      onRefresh: muatData,
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _daftarBuku.length,
        itemBuilder: (context, index) {
          final buku = _daftarBuku[index];

          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: const CircleAvatar(
                child: Icon(Icons.menu_book),
              ),
              title: Text(
                buku.judul,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                '${buku.deskripsi}\nSumber: API user #${buku.userId}',
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
              isThreeLine: true,
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Data Buku dari REST API',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            tooltip: 'Muat ulang',
            onPressed: _sedangMemuat ? null : muatData,
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            margin: const EdgeInsets.fromLTRB(16, 16, 16, 4),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.indigo.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text(
              'Contoh integrasi GET dan POST menggunakan JSONPlaceholder. '
              'Data yang ditampilkan merupakan data simulasi.',
              style: TextStyle(fontSize: 13),
            ),
          ),
          Expanded(
            child: _sedangMemuat
                ? tampilanLoading()
                : _pesanError != null
                    ? tampilanError()
                    : tampilanSukses(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _sedangMengirim ? null : tampilkanFormTambah,
        icon: const Icon(Icons.add),
        label: const Text('Tambah Data API'),
      ),
    );
  }
}
