import 'dart:convert';

import 'package:http/http.dart' as http;

/// Model data buku untuk latihan integrasi REST API.
///
/// JSONPlaceholder sebenarnya mengembalikan data posts:
/// userId, id, title, dan body. Field title/body dipetakan
/// menjadi judul/deskripsi agar dapat ditampilkan pada PustakaKu.
class DataBuku {
  final int id;
  final int userId;
  final String judul;
  final String deskripsi;

  const DataBuku({
    required this.id,
    required this.userId,
    required this.judul,
    required this.deskripsi,
  });

  factory DataBuku.fromJson(Map<String, dynamic> json) {
    return DataBuku(
      id: (json['id'] as num?)?.toInt() ?? 0,
      userId: (json['userId'] as num?)?.toInt() ?? 0,
      judul: json['title']?.toString() ?? 'Tanpa judul',
      deskripsi: json['body']?.toString() ?? 'Tidak ada deskripsi',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'title': judul,
      'body': deskripsi,
    };
  }
}

/// Service terpisah untuk seluruh komunikasi HTTP.
class ServiceApi {
  static const String _baseUrl = 'https://jsonplaceholder.typicode.com';

  /// Mengambil daftar data dari API menggunakan GET.
  Future<List<DataBuku>> ambilDaftarBuku() async {
    try {
      final response = await http
          .get(Uri.parse('$_baseUrl/posts'))
          .timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final List<dynamic> hasilJson = jsonDecode(response.body);
        return hasilJson
            .map((item) => DataBuku.fromJson(
                  item as Map<String, dynamic>,
                ))
            .toList();
      }

      throw Exception(
        'Gagal mengambil data. Kode HTTP: ${response.statusCode}',
      );
    } on http.ClientException {
      throw Exception('Tidak dapat terhubung ke server.');
    } on FormatException {
      throw Exception('Format data dari server tidak valid.');
    } catch (e) {
      if (e.toString().contains('TimeoutException')) {
        throw Exception('Permintaan terlalu lama. Periksa koneksi internet.');
      }
      rethrow;
    }
  }

  /// Mengirim data baru menggunakan POST.
  Future<DataBuku> tambahBuku({
    required String judul,
    required String deskripsi,
  }) async {
    try {
      final response = await http
          .post(
            Uri.parse('$_baseUrl/posts'),
            headers: {
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode({
              'userId': 1,
              'title': judul,
              'body': deskripsi,
            }),
          )
          .timeout(const Duration(seconds: 10));

      if (response.statusCode == 201) {
        return DataBuku.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        );
      }

      throw Exception(
        'Gagal mengirim data. Kode HTTP: ${response.statusCode}',
      );
    } on http.ClientException {
      throw Exception('Tidak dapat terhubung ke server.');
    } on FormatException {
      throw Exception('Respons server tidak dapat dibaca.');
    } catch (e) {
      if (e.toString().contains('TimeoutException')) {
        throw Exception('Pengiriman terlalu lama. Silakan coba lagi.');
      }
      rethrow;
    }
  }
}
