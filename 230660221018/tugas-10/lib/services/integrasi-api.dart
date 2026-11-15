import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/data-pengguna.dart';
import '../models/data-pengajuan.dart';

class ApiException implements Exception {
  final String pesan;

  const ApiException(this.pesan);

  @override
  String toString() => pesan;
}

class IntegrasiApiService {
  static const String _baseUrl = 'https://jsonplaceholder.typicode.com';

  final http.Client _client;

  IntegrasiApiService({http.Client? client})
    : _client = client ?? http.Client();

  /// Mengambil daftar pengguna dari endpoint /users.
  Future<List<DataPengguna>> ambilDaftarPengguna() async {
    final uri = Uri.parse('$_baseUrl/users');

    try {
      final response = await _client
          .get(uri, headers: {'Accept': 'application/json'})
          .timeout(const Duration(seconds: 15));

      if (response.statusCode != 200) {
        throw ApiException(
          'Gagal mengambil data pengguna. Kode: ${response.statusCode}',
        );
      }

      final List<dynamic> hasil = jsonDecode(response.body);

      return hasil
          .map((item) => DataPengguna.fromJson(Map<String, dynamic>.from(item)))
          .toList();
    } on TimeoutException {
      throw const ApiException(
        'Permintaan data pengguna melewati batas waktu.',
      );
    } on FormatException {
      throw const ApiException('Format data pengguna dari server tidak valid.');
    } on http.ClientException {
      throw const ApiException('Tidak dapat terhubung ke server pengguna.');
    }
  }

  /// Mengambil daftar data simulasi dari endpoint /posts.
  Future<List<DataPengajuan>> ambilDaftarPengajuan() async {
    final uri = Uri.parse('$_baseUrl/posts');

    try {
      final response = await _client
          .get(uri, headers: {'Accept': 'application/json'})
          .timeout(const Duration(seconds: 15));

      if (response.statusCode != 200) {
        throw ApiException(
          'Gagal mengambil data pengajuan. Kode: ${response.statusCode}',
        );
      }

      final List<dynamic> hasil = jsonDecode(response.body);

      return hasil
          .map(
            (item) => DataPengajuan.fromJson(Map<String, dynamic>.from(item)),
          )
          .toList();
    } on TimeoutException {
      throw const ApiException(
        'Permintaan data pengajuan melewati batas waktu.',
      );
    } on FormatException {
      throw const ApiException(
        'Format data pengajuan dari server tidak valid.',
      );
    } on http.ClientException {
      throw const ApiException('Tidak dapat terhubung ke server pengajuan.');
    }
  }

  /// Mengambil dua endpoint secara bersamaan dan menggabungkan datanya.
  Future<List<DataPengajuan>> ambilDataTerintegrasi() async {
    final hasil = await Future.wait([
      ambilDaftarPengguna(),
      ambilDaftarPengajuan(),
    ]);

    final daftarPengguna = hasil[0] as List<DataPengguna>;
    final daftarPengajuan = hasil[1] as List<DataPengajuan>;

    // Membuat pemetaan ID pengguna ke nama pengguna.
    final Map<int, String> penggunaById = {
      for (final pengguna in daftarPengguna) pengguna.id: pengguna.nama,
    };

    // Menggabungkan data berdasarkan userId dan id pengguna.
    return daftarPengajuan.map((pengajuan) {
      final nama = penggunaById[pengajuan.userId];

      return pengajuan.copyWith(
        namaPengguna: nama ?? 'Pengguna tidak diketahui',
      );
    }).toList();
  }

  /// Menutup HTTP client ketika tidak lagi digunakan.
  void dispose() {
    _client.close();
  }
}
