class DataAnggota {
  final int id;
  final String nama;
  final String email;

  const DataAnggota({
    required this.id,
    required this.nama,
    required this.email,
  });

  factory DataAnggota.fromJson(Map<String, dynamic> json) {
    return DataAnggota(
      id: json['id'] as int? ?? 0,
      nama: json['name'] as String? ?? 'Anggota Tanpa Nama',
      email: json['email'] as String? ?? '-',
    );
  }
}