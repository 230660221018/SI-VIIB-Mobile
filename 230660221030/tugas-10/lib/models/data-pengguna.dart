
class DataPengguna {
  final int id;
  final String nama;
  final String email;
  final String telepon;

  const DataPengguna({
    required this.id,
    required this.nama,
    required this.email,
    required this.telepon,
  });

  factory DataPengguna.fromJson(Map<String, dynamic> json) {
    return DataPengguna(
      id: (json['id'] as num?)?.toInt() ?? 0,
      nama: json['name']?.toString() ?? 'Nama tidak tersedia',
      email: json['email']?.toString() ?? 'Email tidak tersedia',
      telepon: json['phone']?.toString() ?? 'Telepon tidak tersedia',
    );
  }
}
