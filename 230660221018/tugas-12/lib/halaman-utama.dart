import 'package:flutter/material.dart';

import 'crud-lokal.dart';

class HalamanUtama extends StatefulWidget {
  const HalamanUtama({super.key});

  @override
  State<HalamanUtama> createState() => _HalamanUtamaState();
}

class _HalamanUtamaState extends State<HalamanUtama> {
  int _selectedIndex = 0;

  static const Color _biruUtama = Color(0xFF2459A9);
  static const Color _biruGelap = Color(0xFF173F7A);
  static const Color _biruMuda = Color(0xFFEAF2FF);
  static const Color _latar = Color(0xFFF6F8FC);
  static const Color _teksUtama = Color(0xFF172B4D);
  static const Color _teksSekunder = Color(0xFF718096);

  final List<_AktivitasPengajuan> _aktivitasTerbaru = const [
    _AktivitasPengajuan(
      judul: 'Surat Observasi',
      deskripsi: 'Observasi kegiatan administrasi',
      tanggal: '12 November 2026',
      status: 'Diproses',
      ikon: Icons.assignment_outlined,
    ),
    _AktivitasPengajuan(
      judul: 'Surat Riset Akademik',
      deskripsi: 'Analisis sistem informasi akademik',
      tanggal: '08 November 2026',
      status: 'Disetujui',
      ikon: Icons.description_outlined,
    ),
    _AktivitasPengajuan(
      judul: 'Surat Observasi',
      deskripsi: 'Observasi proses pelayanan akademik',
      tanggal: '03 November 2026',
      status: 'Selesai',
      ikon: Icons.task_alt_outlined,
    ),
  ];

  void _pindahKePengajuan() {
    setState(() {
      _selectedIndex = 1;
    });
  }

  void _tampilkanPesan(String pesan) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(pesan),
          behavior: SnackBarBehavior.floating,
          backgroundColor: _teksUtama,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _latar,
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          _buildBeranda(),
          const DaftarPengajuanLokalPage(),
          _buildProfil(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        backgroundColor: Colors.white,
        indicatorColor: _biruMuda,
        elevation: 3,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home_rounded),
            label: 'Beranda',
          ),
          NavigationDestination(
            icon: Icon(Icons.description_outlined),
            selectedIcon: Icon(Icons.description_rounded),
            label: 'Pengajuan',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline_rounded),
            selectedIcon: Icon(Icons.person_rounded),
            label: 'Akun',
          ),
        ],
      ),
    );
  }

  // ============================================================
  // HALAMAN BERANDA
  // ============================================================

  Widget _buildBeranda() {
    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 920),
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 22, 20, 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeaderBeranda(),

                    const SizedBox(height: 26),

                    _buildBannerUtama(),

                    const SizedBox(height: 28),

                    _buildJudulBagian(
                      judul: 'Ringkasan Pengajuan',
                      deskripsi: 'Pantau aktivitas pengajuan surat Anda.',
                    ),

                    const SizedBox(height: 16),

                    _buildStatistik(),

                    const SizedBox(height: 24),

                    _buildInformasiStatus(),

                    const SizedBox(height: 28),

                    _buildJudulRiwayat(),

                    const SizedBox(height: 14),

                    _buildDaftarAktivitas(),

                    const SizedBox(height: 24),

                    _buildFooterBeranda(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildHeaderBeranda() {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Selamat datang,',
                style: TextStyle(
                  fontSize: 14,
                  color: _teksSekunder,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                'Intan Kartika',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w800,
                  color: _teksUtama,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Sistem Informasi • Mahasiswa',
                style: TextStyle(fontSize: 12, color: Colors.blueGrey.shade400),
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () {
            _tampilkanPesan('Belum ada pemberitahuan baru.');
          },
          style: IconButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: _teksUtama,
            padding: const EdgeInsets.all(12),
          ),
          icon: const Icon(Icons.notifications_none_rounded),
        ),
        const SizedBox(width: 10),
        Container(
          width: 46,
          height: 46,
          decoration: BoxDecoration(
            color: _biruMuda,
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Icon(Icons.person_rounded, color: _biruUtama, size: 26),
        ),
      ],
    );
  }

  Widget _buildBannerUtama() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [_biruUtama, _biruGelap],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              right: -35,
              top: -45,
              child: Container(
                width: 160,
                height: 160,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withValues(alpha: 0.08),
                ),
              ),
            ),
            Positioned(
              right: 35,
              bottom: -65,
              child: Container(
                width: 145,
                height: 145,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withValues(alpha: 0.06),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
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
                          size: 15,
                          color: Colors.white,
                        ),
                        SizedBox(width: 7),
                        Text(
                          'LAYANAN AKADEMIK',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    'Urus Surat Akademik\nLebih Mudah',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      height: 1.25,
                      fontWeight: FontWeight.w800,
                      letterSpacing: -0.5,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    'Ajukan surat observasi dan riset akademik '
                    'secara praktis melalui SIPORA.',
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.85),
                      fontSize: 13,
                      height: 1.6,
                    ),
                  ),

                  const SizedBox(height: 22),

                  FilledButton.icon(
                    onPressed: _pindahKePengajuan,
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: _biruUtama,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 13,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    icon: const Icon(Icons.add_rounded, size: 19),
                    label: const Text(
                      'Ajukan Surat',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildJudulBagian({required String judul, required String deskripsi}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          judul,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w800,
            color: _teksUtama,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          deskripsi,
          style: const TextStyle(fontSize: 12, color: _teksSekunder),
        ),
      ],
    );
  }

  Widget _buildStatistik() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double lebarKartu = constraints.maxWidth >= 650
            ? (constraints.maxWidth - 24) / 3
            : (constraints.maxWidth - 12) / 2;

        return Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            SizedBox(
              width: lebarKartu,
              child: _buildKartuStatistik(
                judul: 'Total Pengajuan',
                jumlah: '03',
                keterangan: 'Seluruh pengajuan',
                ikon: Icons.description_outlined,
                warna: _biruUtama,
                latarIkon: _biruMuda,
              ),
            ),
            SizedBox(
              width: lebarKartu,
              child: _buildKartuStatistik(
                judul: 'Diproses',
                jumlah: '01',
                keterangan: 'Sedang ditinjau',
                ikon: Icons.pending_actions_outlined,
                warna: const Color(0xFFD18B27),
                latarIkon: const Color(0xFFFFF4DF),
              ),
            ),
            SizedBox(
              width: lebarKartu,
              child: _buildKartuStatistik(
                judul: 'Selesai',
                jumlah: '01',
                keterangan: 'Surat telah selesai',
                ikon: Icons.check_circle_outline_rounded,
                warna: const Color(0xFF21865B),
                latarIkon: const Color(0xFFE5F5EC),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildKartuStatistik({
    required String judul,
    required String jumlah,
    required String keterangan,
    required IconData ikon,
    required Color warna,
    required Color latarIkon,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFEAEFF5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: latarIkon,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(ikon, color: warna, size: 21),
          ),
          const SizedBox(height: 16),
          Text(
            jumlah,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w800,
              color: _teksUtama,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            judul,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: _teksUtama,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            keterangan,
            style: const TextStyle(fontSize: 10, color: _teksSekunder),
          ),
        ],
      ),
    );
  }

  Widget _buildInformasiStatus() {
    return Container(
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: const Color(0xFFEAF2FF),
        borderRadius: BorderRadius.circular(17),
        border: Border.all(color: const Color(0xFFDCE9FC)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(11),
            ),
            child: const Icon(
              Icons.info_outline_rounded,
              color: _biruUtama,
              size: 21,
            ),
          ),
          const SizedBox(width: 13),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Informasi Pengajuan',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
                    color: _teksUtama,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Pantau status pengajuan secara berkala '
                  'melalui menu Pengajuan untuk mengetahui '
                  'perkembangan permohonan surat Anda.',
                  style: TextStyle(
                    fontSize: 11,
                    height: 1.5,
                    color: Color(0xFF536782),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildJudulRiwayat() {
    return Row(
      children: [
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Riwayat Pengajuan',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w800,
                  color: _teksUtama,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Ringkasan aktivitas pengajuan terbaru.',
                style: TextStyle(fontSize: 12, color: _teksSekunder),
              ),
            ],
          ),
        ),
        TextButton(
          onPressed: _pindahKePengajuan,
          style: TextButton.styleFrom(foregroundColor: _biruUtama),
          child: const Text(
            'Lihat semua',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
          ),
        ),
      ],
    );
  }

  Widget _buildDaftarAktivitas() {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _aktivitasTerbaru.length,
      separatorBuilder: (context, index) {
        return const SizedBox(height: 11);
      },
      itemBuilder: (context, index) {
        return _buildKartuAktivitas(_aktivitasTerbaru[index]);
      },
    );
  }

  Widget _buildKartuAktivitas(_AktivitasPengajuan aktivitas) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
        border: Border.all(color: const Color(0xFFEAEFF5)),
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: _biruMuda,
              borderRadius: BorderRadius.circular(13),
            ),
            child: Icon(aktivitas.ikon, color: _biruUtama, size: 22),
          ),
          const SizedBox(width: 13),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  aktivitas.judul,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
                    color: _teksUtama,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  aktivitas.deskripsi,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 11, color: _teksSekunder),
                ),
                const SizedBox(height: 6),
                Text(
                  aktivitas.tanggal,
                  style: const TextStyle(fontSize: 10, color: _teksSekunder),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          _buildStatusChip(aktivitas.status),
        ],
      ),
    );
  }

  Widget _buildStatusChip(String status) {
    Color warnaTeks;
    Color warnaLatar;

    if (status == 'Diproses') {
      warnaTeks = const Color(0xFFB7791F);
      warnaLatar = const Color(0xFFFFF4DF);
    } else if (status == 'Disetujui') {
      warnaTeks = const Color(0xFF2459A9);
      warnaLatar = const Color(0xFFEAF2FF);
    } else if (status == 'Selesai') {
      warnaTeks = const Color(0xFF21865B);
      warnaLatar = const Color(0xFFE5F5EC);
    } else {
      warnaTeks = const Color(0xFF718096);
      warnaLatar = const Color(0xFFF0F2F5);
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 6),
      decoration: BoxDecoration(
        color: warnaLatar,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        status,
        style: TextStyle(
          color: warnaTeks,
          fontSize: 9,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget _buildFooterBeranda() {
    return Center(
      child: Column(
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.account_balance_outlined,
              color: _biruUtama,
              size: 21,
            ),
          ),
          const SizedBox(height: 9),
          const Text(
            'SIPORA',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w800,
              color: _teksUtama,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Sistem Informasi Pengajuan Surat Observasi '
            'dan Riset Akademik',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 10, color: _teksSekunder),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // HALAMAN AKUN / PROFIL
  // ============================================================

  Widget _buildProfil() {
    return SafeArea(
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 920),
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 26, 20, 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Akun Saya',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    color: _teksUtama,
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  'Informasi profil dan pengaturan akun.',
                  style: TextStyle(fontSize: 13, color: _teksSekunder),
                ),

                const SizedBox(height: 25),

                _buildKartuProfil(),

                const SizedBox(height: 28),

                const Text(
                  'Informasi Akademik',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: _teksUtama,
                  ),
                ),

                const SizedBox(height: 13),

                _buildInformasiProfil(
                  ikon: Icons.school_outlined,
                  judul: 'Program Studi',
                  nilai: 'Sistem Informasi',
                ),

                _buildInformasiProfil(
                  ikon: Icons.person_outline_rounded,
                  judul: 'Status Pengguna',
                  nilai: 'Mahasiswa',
                ),

                _buildInformasiProfil(
                  ikon: Icons.account_balance_outlined,
                  judul: 'Layanan',
                  nilai: 'Pengajuan Surat Akademik',
                ),

                const SizedBox(height: 25),

                const Text(
                  'Bantuan dan Informasi',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: _teksUtama,
                  ),
                ),

                const SizedBox(height: 13),

                _buildMenuProfil(
                  ikon: Icons.help_outline_rounded,
                  judul: 'Panduan Penggunaan',
                  deskripsi: 'Informasi penggunaan aplikasi SIPORA',
                  onTap: () {
                    _tampilkanDialogInformasi(
                      'Panduan Penggunaan',
                      'Gunakan menu Pengajuan untuk melihat dan '
                          'mengelola pengajuan surat. Isi formulir '
                          'dengan data yang benar, kemudian pantau '
                          'perkembangan status pengajuan Anda.',
                    );
                  },
                ),

                _buildMenuProfil(
                  ikon: Icons.info_outline_rounded,
                  judul: 'Tentang SIPORA',
                  deskripsi: 'Informasi mengenai aplikasi',
                  onTap: () {
                    _tampilkanDialogInformasi(
                      'Tentang SIPORA',
                      'SIPORA merupakan Sistem Informasi Pengajuan '
                          'Surat Observasi dan Riset Akademik yang '
                          'dirancang untuk membantu proses pengajuan '
                          'surat akademik secara lebih praktis.',
                    );
                  },
                ),

                const SizedBox(height: 25),

                Center(
                  child: Text(
                    'SIPORA • Versi 1.0',
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.blueGrey.shade300,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildKartuProfil() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: const Color(0xFFEAEFF5)),
      ),
      child: Column(
        children: [
          Container(
            width: 76,
            height: 76,
            decoration: BoxDecoration(
              color: _biruMuda,
              borderRadius: BorderRadius.circular(25),
            ),
            child: const Icon(
              Icons.person_rounded,
              color: _biruUtama,
              size: 43,
            ),
          ),
          const SizedBox(height: 15),
          const Text(
            'Intan Kartika',
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w800,
              color: _teksUtama,
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            'Mahasiswa Sistem Informasi',
            style: TextStyle(fontSize: 12, color: _teksSekunder),
          ),
          const SizedBox(height: 15),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
            decoration: BoxDecoration(
              color: _biruMuda,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              'Akun Mahasiswa',
              style: TextStyle(
                color: _biruUtama,
                fontSize: 11,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInformasiProfil({
    required IconData ikon,
    required String judul,
    required String nilai,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: const Color(0xFFEAEFF5)),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: _biruMuda,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(ikon, color: _biruUtama, size: 21),
          ),
          const SizedBox(width: 13),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  judul,
                  style: const TextStyle(fontSize: 11, color: _teksSekunder),
                ),
                const SizedBox(height: 4),
                Text(
                  nilai,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: _teksUtama,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuProfil({
    required IconData ikon,
    required String judul,
    required String deskripsi,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: const Color(0xFFEAEFF5)),
      ),
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: _biruMuda,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(ikon, color: _biruUtama, size: 21),
        ),
        title: Text(
          judul,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w700,
            color: _teksUtama,
          ),
        ),
        subtitle: Text(
          deskripsi,
          style: const TextStyle(fontSize: 10, color: _teksSekunder),
        ),
        trailing: const Icon(Icons.chevron_right_rounded, color: _teksSekunder),
      ),
    );
  }

  void _tampilkanDialogInformasi(String judul, String pesan) {
    showDialog<void>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Text(
            judul,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w800,
              color: _teksUtama,
            ),
          ),
          content: Text(
            pesan,
            style: const TextStyle(
              fontSize: 13,
              height: 1.6,
              color: _teksSekunder,
            ),
          ),
          actions: [
            FilledButton(
              onPressed: () {
                Navigator.pop(dialogContext);
              },
              style: FilledButton.styleFrom(backgroundColor: _biruUtama),
              child: const Text('Mengerti'),
            ),
          ],
        );
      },
    );
  }
}

// ============================================================
// MODEL AKTIVITAS BERANDA
// ============================================================

class _AktivitasPengajuan {
  final String judul;
  final String deskripsi;
  final String tanggal;
  final String status;
  final IconData ikon;

  const _AktivitasPengajuan({
    required this.judul,
    required this.deskripsi,
    required this.tanggal,
    required this.status,
    required this.ikon,
  });
}
