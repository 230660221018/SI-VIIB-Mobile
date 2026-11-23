enum StatusPengajuan {
  menunggu,
  diproses,
  selesai,
  ditolak,
}

extension StatusPengajuanExtension on StatusPengajuan {
  String get label {
    switch (this) {
      case StatusPengajuan.menunggu:
        return 'Menunggu Verifikasi';
      case StatusPengajuan.diproses:
        return 'Sedang Diperbaiki';
      case StatusPengajuan.selesai:
        return 'Selesai';
      case StatusPengajuan.ditolak:
        return 'Ditolak';
    }
  }
}

class DataPengajuan {
  final int id;
  final int userId;
  final int fasilitasId;
  final String judulKendala;
  final String detailKendala;
  final StatusPengajuan status;

  const DataPengajuan({
    required this.id,
    required this.userId,
    required this.fasilitasId,
    required this.judulKendala,
    required this.detailKendala,
    required this.status,
  });

  factory DataPengajuan.fromJson(Map<String, dynamic> json) {
    final int idPengajuan = json['id'] as int? ?? 0;
    final int idUser = json['userId'] as int? ?? 1;
    // Simulasi pemetaan foreign key fasilitasId jika belum tersedia pada JSON
    final int idFasilitas =
        json['fasilitasId'] as int? ?? ((idPengajuan % 10) + 1);

    final String? statusMentah = json['status'] as String?;

    return DataPengajuan(
      id: idPengajuan,
      userId: idUser,
      fasilitasId: idFasilitas,
      judulKendala: json['title'] as String? ?? 'Laporan Kerusakan Fasilitas',
      detailKendala:
          json['body'] as String? ?? 'Tidak ada rincian kerusakan tambahan.',
      status: _tentukanStatusProses(idPengajuan, statusMentah),
    );
  }

  /// Aturan proses bisnis untuk memetakan status pengajuan
  static StatusPengajuan _tentukanStatusProses(
      int idPengajuan, String? statusMentah) {
    if (statusMentah != null) {
      switch (statusMentah.toLowerCase()) {
        case 'diproses':
          return StatusPengajuan.diproses;
        case 'selesai':
          return StatusPengajuan.selesai;
        case 'ditolak':
          return StatusPengajuan.ditolak;
        default:
          return StatusPengajuan.menunggu;
      }
    }

    // Simulasi aturan status berjenjang berdasarkan urutan ID tiket
    if (idPengajuan % 4 == 0) return StatusPengajuan.selesai;
    if (idPengajuan % 3 == 0) return StatusPengajuan.diproses;
    if (idPengajuan % 7 == 0) return StatusPengajuan.ditolak;
    return StatusPengajuan.menunggu;
  }
}

/// ViewModel hasil penggabungan DataPengajuan + DataPengguna + DataFasilitas
class DataPengajuanRingkas {
  final int idPengajuan;
  final int userId;
  final int fasilitasId;
  final String namaPelapor;
  final String emailPelapor;
  final String namaFasilitas;
  final String lokasiGedung;
  final String judulKendala;
  final String detailKendala;
  final StatusPengajuan status;

  const DataPengajuanRingkas({
    required this.idPengajuan,
    required this.userId,
    required this.fasilitasId,
    required this.namaPelapor,
    required this.emailPelapor,
    required this.namaFasilitas,
    required this.lokasiGedung,
    required this.judulKendala,
    required this.detailKendala,
    required this.status,
  });
}