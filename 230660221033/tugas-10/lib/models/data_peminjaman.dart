enum StatusPeminjaman { menunggu, disetujui, ditolak }

class DataPeminjaman {
  final int id;
  final int userId;
  final String judulBuku;
  final String catatan;
  final StatusPeminjaman status;

  const DataPeminjaman({
    required this.id,
    required this.userId,
    required this.judulBuku,
    required this.catatan,
    required this.status,
  });

  // Aturan Proses Bisnis: Menentukan status awal berdasarkan ID transaksi simulasi
  static StatusPeminjaman tentukanStatusProses(int idTransaksi) {
    if (idTransaksi % 3 == 0) {
      return StatusPeminjaman.ditolak;
    } else if (idTransaksi % 2 == 0) {
      return StatusPeminjaman.disetujui;
    }
    return StatusPeminjaman.menunggu;
  }

  factory DataPeminjaman.fromJson(Map<String, dynamic> json) {
    final parsedId = json['id'] as int? ?? 0;
    return DataPeminjaman(
      id: parsedId,
      userId: json['userId'] as int? ?? 0,
      judulBuku: json['title'] as String? ?? 'Judul Buku Tidak Diketahui',
      catatan: json['body'] as String? ?? '-',
      status: tentukanStatusProses(parsedId),
    );
  }
}