import 'data_peminjaman.dart';

class PeminjamanRingkas {
  final int idPeminjaman;
  final String namaPeminjam;
  final String emailPeminjam;
  final String judulBuku;
  final StatusPeminjaman status;

  const PeminjamanRingkas({
    required this.idPeminjaman,
    required this.namaPeminjam,
    required this.emailPeminjam,
    required this.judulBuku,
    required this.status,
  });

  String get labelStatus {
    switch (status) {
      case StatusPeminjaman.disetujui:
        return 'Disetujui';
      case StatusPeminjaman.ditolak:
        return 'Ditolak';
      case StatusPeminjaman.menunggu:
        return 'Menunggu';
    }
  }
}