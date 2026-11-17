import 'package:flutter/material.dart';

void main() {
  runApp(const CatatanApp());
}

// Data statis untuk ditampilkan pada halaman aplikasi.
final List<Map<String, String>> daftarLayanan = [
  {
    'nama': 'Tugas Pemrograman',
    'kategori': 'Kuliah',
    'status': 'Belum selesai',
  },
  {
    'nama': 'Jadwal Bimbingan',
    'kategori': 'Akademik',
    'status': 'Selesai',
  },
  {
    'nama': 'Ide Proyek Aplikasi',
    'kategori': 'Ide',
    'status': 'Belum selesai',
  },
  {
    'nama': 'Belanja Mingguan',
    'kategori': 'Pribadi',
    'status': 'Selesai',
  },
];

class CatatanApp extends StatelessWidget {
  const CatatanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'APK Catatan',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6750A4),
        ),
        useMaterial3: true,
      ),
      home: const HalamanBeranda(),
    );
  }
}

class HalamanBeranda extends StatelessWidget {
  const HalamanBeranda({super.key});

  @override
  Widget build(BuildContext context) {
    final jumlahCatatan = daftarLayanan.length;
    final belumSelesai = daftarLayanan
        .where((item) => item['status'] == 'Belum selesai')
        .length;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'APK Catatan',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
            tooltip: 'Cari catatan',
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Halo, Paizal!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              'Catat hal penting agar tidak terlupakan.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade700,
              ),
            ),
            const SizedBox(height: 18),

            // Row: dua ringkasan ditampilkan secara horizontal.
            Row(
              children: [
                Expanded(
                  child: _KartuRingkasan(
                    judul: 'Total Catatan',
                    angka: '$jumlahCatatan',
                    ikon: Icons.note_alt_outlined,
                    warna: const Color(0xFFEDE7F6),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _KartuRingkasan(
                    judul: 'Belum Selesai',
                    angka: '$belumSelesai',
                    ikon: Icons.pending_actions,
                    warna: const Color(0xFFFFF1D6),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 22),
            const Text(
              'Daftar Catatan',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),

            // ListView.builder: daftar catatan dapat digulir.
            Expanded(
              child: ListView.builder(
                itemCount: daftarLayanan.length,
                itemBuilder: (context, index) {
                  final catatan = daftarLayanan[index];
                  final sudahSelesai =
                      catatan['status'] == 'Selesai';

                  return Card(
                    margin: const EdgeInsets.only(bottom: 10),
                    elevation: 1,
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: sudahSelesai
                            ? const Color(0xFFE2F3E8)
                            : const Color(0xFFEDE7F6),
                        child: Icon(
                          sudahSelesai
                              ? Icons.check
                              : Icons.edit_note,
                          color: sudahSelesai
                              ? Colors.green.shade700
                              : const Color(0xFF6750A4),
                        ),
                      ),
                      title: Text(
                        catatan['nama']!,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      subtitle: Text(
                        '${catatan['kategori']} • ${catatan['status']}',
                      ),
                      trailing: const Icon(Icons.chevron_right),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Tambah catatan',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _KartuRingkasan extends StatelessWidget {
  const _KartuRingkasan({
    required this.judul,
    required this.angka,
    required this.ikon,
    required this.warna,
  });

  final String judul;
  final String angka;
  final IconData ikon;
  final Color warna;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: warna,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(ikon, size: 28, color: const Color(0xFF514080)),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  angka,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  judul,
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
