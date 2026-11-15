import 'package:flutter/material.dart';

import 'models/data-pengajuan.dart';
import 'services/integrasi-api.dart';

void main() {
  runApp(const SIPORAApp());
}

const Color warnaUtama = Color(0xFF2459A9);
const Color warnaLatar = Color(0xFFF5F7FC);
const Color warnaTeks = Color(0xFF18345D);

class SIPORAApp extends StatelessWidget {
  const SIPORAApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SIPORA - Integrasi Data',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: warnaUtama,
          primary: warnaUtama,
        ),
        scaffoldBackgroundColor: warnaLatar,
        fontFamily: 'Roboto',
      ),
      home: const HalamanIntegrasi(),
    );
  }
}

class HalamanIntegrasi extends StatefulWidget {
  const HalamanIntegrasi({super.key});

  @override
  State<HalamanIntegrasi> createState() => _HalamanIntegrasiState();
}

class _HalamanIntegrasiState extends State<HalamanIntegrasi> {
  final IntegrasiApiService _service = IntegrasiApiService();

  late Future<List<DataPengajuan>> _futureData;

  @override
  void initState() {
    super.initState();
    _futureData = _service.ambilDataTerintegrasi();
  }

  void _muatUlang() {
    setState(() {
      _futureData = _service.ambilDataTerintegrasi();
    });
  }

  Future<void> _refresh() async {
    _muatUlang();

    try {
      await _futureData;
    } catch (_) {
      // Kondisi error ditampilkan melalui FutureBuilder.
    }
  }

  @override
  void dispose() {
    _service.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<List<DataPengajuan>>(
          future: _futureData,
          builder: (context, snapshot) {
            return RefreshIndicator(
              onRefresh: _refresh,
              color: warnaUtama,
              child: _halamanUtama(snapshot),
            );
          },
        ),
      ),
    );
  }

  Widget _halamanUtama(AsyncSnapshot<List<DataPengajuan>> snapshot) {
    final ukuranLayar = MediaQuery.of(context).size.width;
    final lebarKonten = ukuranLayar > 1100 ? 1000.0 : 900.0;

    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: lebarKonten),
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 26),
          children: [
            _header(),
            const SizedBox(height: 28),
            _banner(),
            const SizedBox(height: 30),
            _judulBagian(
              'Ringkasan Integrasi',
              'Informasi hasil pengambilan data dari beberapa sumber API.',
            ),
            const SizedBox(height: 16),
            _ringkasan(snapshot),
            const SizedBox(height: 28),
            _informasiSumberApi(),
            const SizedBox(height: 30),
            _judulBagian(
              'Data Terintegrasi',
              'Daftar data simulasi yang telah dicocokkan dengan informasi pengguna.',
            ),
            const SizedBox(height: 16),
            _kontenData(snapshot),
            const SizedBox(height: 28),
            _catatanBawah(),
          ],
        ),
      ),
    );
  }

  Widget _header() {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Selamat datang,',
                style: TextStyle(color: Color(0xFF71829C), fontSize: 13),
              ),
              const SizedBox(height: 5),
              const Text(
                'Intan Kartika',
                style: TextStyle(
                  color: warnaTeks,
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                'Sistem Informasi · Mahasiswa',
                style: TextStyle(color: Color(0xFF8190A5), fontSize: 12),
              ),
            ],
          ),
        ),
        _ikonHeader(Icons.notifications_none_rounded),
        const SizedBox(width: 10),
        _ikonHeader(Icons.person_outline_rounded, aktif: true),
      ],
    );
  }

  Widget _ikonHeader(IconData ikon, {bool aktif = false}) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: aktif ? const Color(0xFFE8F0FE) : Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Icon(ikon, color: warnaUtama, size: 22),
    );
  }

  Widget _banner() {
    return Container(
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF2459A9), Color(0xFF19447F)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Stack(
        children: [
          Positioned(right: -35, top: -65, child: _lingkaranDekorasi(150)),
          Positioned(right: 40, bottom: -100, child: _lingkaranDekorasi(145)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 7,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.16),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.verified_user_outlined,
                      color: Colors.white,
                      size: 15,
                    ),
                    SizedBox(width: 7),
                    Text(
                      'LAYANAN AKADEMIK',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.7,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Integrasi Data\nAkademik Lebih Mudah',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  height: 1.25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Pemantauan dan penggabungan data melalui '
                'beberapa sumber API dalam satu halaman.',
                style: TextStyle(
                  color: Color(0xFFE2ECFF),
                  fontSize: 13,
                  height: 1.6,
                ),
              ),
              const SizedBox(height: 20),
              OutlinedButton.icon(
                onPressed: _muatUlang,
                icon: const Icon(Icons.refresh_rounded, size: 18),
                label: const Text('Muat Ulang Data'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: warnaUtama,
                  backgroundColor: Colors.white,
                  side: BorderSide.none,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 17,
                    vertical: 13,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(11),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _lingkaranDekorasi(double ukuran) {
    return Container(
      width: ukuran,
      height: ukuran,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withValues(alpha: 0.07),
      ),
    );
  }

  Widget _judulBagian(String judul, String deskripsi) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          judul,
          style: const TextStyle(
            color: warnaTeks,
            fontSize: 19,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          deskripsi,
          style: const TextStyle(
            color: Color(0xFF78879D),
            fontSize: 12,
            height: 1.5,
          ),
        ),
      ],
    );
  }

  Widget _ringkasan(AsyncSnapshot<List<DataPengajuan>> snapshot) {
    final berhasil =
        snapshot.connectionState == ConnectionState.done &&
        !snapshot.hasError &&
        snapshot.hasData;

    final data = snapshot.data ?? [];

    final jumlahPengguna = data.map((item) => item.userId).toSet().length;

    return LayoutBuilder(
      builder: (context, constraints) {
        final lebar = constraints.maxWidth;
        final jumlahKolom = lebar < 420 ? 1 : 3;
        final lebarKartu = jumlahKolom == 1 ? lebar : (lebar - 24) / 3;

        return Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            SizedBox(
              width: lebarKartu,
              child: _kartuRingkasan(
                ikon: Icons.description_outlined,
                angka: berhasil ? '${data.length}' : '--',
                label: 'Total Data',
                warnaIkon: const Color(0xFFEAF1FF),
                warna: warnaUtama,
              ),
            ),
            SizedBox(
              width: lebarKartu,
              child: _kartuRingkasan(
                ikon: Icons.people_outline_rounded,
                angka: berhasil ? '$jumlahPengguna' : '--',
                label: 'Pengguna Terhubung',
                warnaIkon: const Color(0xFFFFF3DF),
                warna: const Color(0xFFE29421),
              ),
            ),
            SizedBox(
              width: lebarKartu,
              child: _kartuRingkasan(
                ikon: Icons.hub_outlined,
                angka: '02',
                label: 'Sumber Endpoint',
                warnaIkon: const Color(0xFFE4F5ED),
                warna: const Color(0xFF159568),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _kartuRingkasan({
    required IconData ikon,
    required String angka,
    required String label,
    required Color warnaIkon,
    required Color warna,
  }) {
    return Container(
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
        border: Border.all(color: const Color(0xFFE8EDF5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 39,
            height: 39,
            decoration: BoxDecoration(
              color: warnaIkon,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(ikon, color: warna, size: 21),
          ),
          const SizedBox(height: 14),
          Text(
            angka,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: warnaTeks,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(color: Color(0xFF71829C), fontSize: 11),
          ),
        ],
      ),
    );
  }

  Widget _informasiSumberApi() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFFEAF1FF),
        borderRadius: BorderRadius.circular(17),
        border: Border.all(color: const Color(0xFFDCE8FF)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.info_outline_rounded, color: warnaUtama, size: 21),
              SizedBox(width: 9),
              Text(
                'Informasi Integrasi API',
                style: TextStyle(
                  color: warnaTeks,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Text(
            'Aplikasi mengambil data dari dua endpoint yang berbeda, '
            'kemudian menggabungkannya berdasarkan ID pengguna.',
            style: TextStyle(
              color: Color(0xFF627590),
              fontSize: 12,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 14),
          _endpointBar('/users', 'Data pengguna'),
          const SizedBox(height: 8),
          _endpointBar('/posts', 'Data posting simulasi'),
        ],
      ),
    );
  }

  Widget _endpointBar(String endpoint, String keterangan) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          const Icon(Icons.cloud_done_outlined, color: warnaUtama, size: 17),
          const SizedBox(width: 9),
          Text(
            endpoint,
            style: const TextStyle(
              color: warnaUtama,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
          const Spacer(),
          Flexible(
            child: Text(
              keterangan,
              textAlign: TextAlign.end,
              style: const TextStyle(color: Color(0xFF71829C), fontSize: 11),
            ),
          ),
        ],
      ),
    );
  }

  Widget _kontenData(AsyncSnapshot<List<DataPengajuan>> snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return _statusKosong(
        ikon: Icons.sync_rounded,
        judul: 'Menghubungkan Data',
        pesan: 'Sedang mengambil dan menggabungkan informasi dari dua endpoint API.',
        loading: true,
      );
    }

    if (snapshot.hasError) {
      return _statusKosong(
        ikon: Icons.cloud_off_outlined,
        judul: 'Data Belum Berhasil Dimuat',
        pesan: 'Terjadi kendala saat mengambil data. Periksa koneksi internet, lalu coba kembali.',
        tombol: 'Coba Lagi',
        onPressed: _muatUlang,
      );
    }

    final data = snapshot.data ?? [];

    if (data.isEmpty) {
      return _statusKosong(
        ikon: Icons.inbox_outlined,
        judul: 'Belum Ada Data',
        pesan: 'Endpoint berhasil diperiksa, tetapi belum terdapat data yang dapat ditampilkan.',
        tombol: 'Muat Ulang',
        onPressed: _muatUlang,
      );
    }

    return Column(children: data.map((item) => _kartuData(item)).toList());
  }

  Widget _kartuData(DataPengajuan item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 13),
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
        border: Border.all(color: const Color(0xFFE8EDF5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 11,
                  vertical: 7,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFEAF1FF),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'DATA #${item.id}',
                  style: const TextStyle(
                    color: warnaUtama,
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                  ),
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xFFE5F5EC),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.check_circle_outline,
                      color: Color(0xFF159568),
                      size: 13,
                    ),
                    SizedBox(width: 5),
                    Text(
                      'Terintegrasi',
                      style: TextStyle(
                        color: Color(0xFF159568),
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 17),
          const Text(
            'Informasi Pemilik Data',
            style: TextStyle(color: Color(0xFF8290A4), fontSize: 11),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Container(
                width: 43,
                height: 43,
                decoration: BoxDecoration(
                  color: const Color(0xFFEAF1FF),
                  borderRadius: BorderRadius.circular(13),
                ),
                child: const Icon(
                  Icons.person_outline_rounded,
                  color: warnaUtama,
                  size: 23,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.namaPengguna,
                      style: const TextStyle(
                        color: warnaTeks,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'ID Pengguna: ${item.userId}',
                      style: const TextStyle(
                        color: Color(0xFF8491A5),
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.link_rounded, color: warnaUtama, size: 20),
            ],
          ),
          const Divider(height: 25, color: Color(0xFFEDF0F5)),
          Row(
            children: [
              const Icon(
                Icons.dataset_outlined,
                color: Color(0xFF71829C),
                size: 17,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Data posting simulasi berhasil dicocokkan dengan pemiliknya.',
                  style: const TextStyle(
                    color: Color(0xFF71829C),
                    fontSize: 11,
                    height: 1.5,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _statusKosong({
    required IconData ikon,
    required String judul,
    required String pesan,
    bool loading = false,
    String? tombol,
    VoidCallback? onPressed,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 35),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
        border: Border.all(color: const Color(0xFFE8EDF5)),
      ),
      child: Column(
        children: [
          if (loading)
            const SizedBox(
              width: 38,
              height: 38,
              child: CircularProgressIndicator(
                strokeWidth: 3,
                color: warnaUtama,
              ),
            )
          else
            Icon(ikon, color: warnaUtama, size: 43),
          const SizedBox(height: 16),
          Text(
            judul,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: warnaTeks,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            pesan,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFF78879D),
              fontSize: 12,
              height: 1.6,
            ),
          ),
          if (tombol != null) ...[
            const SizedBox(height: 17),
            FilledButton.icon(
              onPressed: onPressed,
              icon: const Icon(Icons.refresh_rounded, size: 18),
              label: Text(tombol),
              style: FilledButton.styleFrom(
                backgroundColor: warnaUtama,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _catatanBawah() {
    return Column(
      children: [
        const Divider(color: Color(0xFFE5EAF1)),
        const SizedBox(height: 13),
        const Text(
          'SIPORA · Sistem Informasi Pengajuan Surat Observasi dan Riset Akademik',
          textAlign: TextAlign.center,
          style: TextStyle(color: Color(0xFF8290A4), fontSize: 10, height: 1.5),
        ),
        const SizedBox(height: 5),
        const Text(
          'Data yang ditampilkan menggunakan API simulasi untuk keperluan pembelajaran.',
          textAlign: TextAlign.center,
          style: TextStyle(color: Color(0xFF9AA5B5), fontSize: 10, height: 1.5),
        ),
      ],
    );
  }
}
