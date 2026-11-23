class DataPengguna {
  final int id;
  final String nama;
  final String email;
  final String unitKerja;

  const DataPengguna({
    required this.id,
    required this.nama,
    required this.email,
    required this.unitKerja,
  });

  factory DataPengguna.fromJson(Map<String, dynamic> json) {
    final company = json['company'] as Map<String, dynamic>?;
    return DataPengguna(
      id: json['id'] as int? ?? 0,
      nama: json['name'] as String? ?? 'Pelapor Tidak Diketahui',
      email: json['email'] as String? ?? '-',
      unitKerja: company?['name'] as String? ?? 'Fakultas Teknologi Informasi',
    );
  }
}