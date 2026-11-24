class DataPengajuan {
  final int id;
  final int userId;
  final String judul;
  final String isi;
  final String namaPengguna;

  const DataPengajuan({
    required this.id,
    required this.userId,
    required this.judul,
    required this.isi,
    this.namaPengguna = 'Pengguna tidak diketahui',
  });

  factory DataPengajuan.fromJson(Map<String, dynamic> json) {
    return DataPengajuan(
      id: json['id'] is int
          ? json['id']
          : int.tryParse(json['id']?.toString() ?? '') ?? 0,
      userId: json['userId'] is int
          ? json['userId']
          : int.tryParse(json['userId']?.toString() ?? '') ?? 0,
      judul: json['title']?.toString() ?? 'Judul tidak tersedia',
      isi: json['body']?.toString() ?? 'Isi tidak tersedia',
    );
  }

  DataPengajuan copyWith({String? namaPengguna}) {
    return DataPengajuan(
      id: id,
      userId: userId,
      judul: judul,
      isi: isi,
      namaPengguna: namaPengguna ?? this.namaPengguna,
    );
  }
}
