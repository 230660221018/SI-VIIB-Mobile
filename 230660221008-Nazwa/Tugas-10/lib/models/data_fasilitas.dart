class DataFasilitas {
  final int id;
  final String namaFasilitas;
  final String lokasiGedung;

  const DataFasilitas({
    required this.id,
    required this.namaFasilitas,
    required this.lokasiGedung,
  });

  factory DataFasilitas.fromJson(Map<String, dynamic> json) {
    final int idFasilitas = json['id'] as int? ?? 0;
    final String namaMentah =
        (json['name'] as String? ?? 'Fasilitas Umum').trim();
    final String namaKapital = namaMentah.isNotEmpty
        ? '${namaMentah[0].toUpperCase()}${namaMentah.substring(1)}'
        : 'Fasilitas Umum';

    return DataFasilitas(
      id: idFasilitas,
      namaFasilitas: 'Ruang Lab/Kelas #$idFasilitas ($namaKapital)',
      lokasiGedung: 'Gedung Kuliah ${(idFasilitas % 3) + 1}',
    );
  }
}