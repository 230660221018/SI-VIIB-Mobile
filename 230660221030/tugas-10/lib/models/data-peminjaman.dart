
class DataPeminjaman {
  final int id;
  final int userId;
  final String judulBuku;
  final String deskripsi;
  final String status;

  const DataPeminjaman({
    required this.id,
    required this.userId,
    required this.judulBuku,
    required this.deskripsi,
    required this.status,
  });

  factory DataPeminjaman.fromJson(Map<String, dynamic> json) {
    return DataPeminjaman(
      id: (json['id'] as num?)?.toInt() ?? 0,
      userId: (json['userId'] as num?)?.toInt() ?? 0,
      judulBuku: json['title']?.toString() ?? 'Judul tidak tersedia',
      deskripsi: json['body']?.toString() ?? 'Deskripsi tidak tersedia',
      status: json['status']?.toString() ?? 'Menunggu',
    );
  }
}
