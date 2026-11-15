class DataPengguna {
  final int id;
  final String nama;
  final String email;

  const DataPengguna({
    required this.id,
    required this.nama,
    required this.email,
  });

  factory DataPengguna.fromJson(Map<String, dynamic> json) {
    return DataPengguna(
      id: json['id'] is int
          ? json['id']
          : int.tryParse(json['id']?.toString() ?? '') ?? 0,
      nama: json['name']?.toString() ?? 'Nama tidak tersedia',
      email: json['email']?.toString() ?? 'Email tidak tersedia',
    );
  }
}
