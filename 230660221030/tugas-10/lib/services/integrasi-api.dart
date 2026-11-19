
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/data-pengguna.dart';
import '../models/data-peminjaman.dart';

class ServiceIntegrasi {
  static const String _baseUrl =
      'https://jsonplaceholder.typicode.com';

  Future<List<DataPengguna>> ambilDataPengguna() async {
    final response = await http
        .get(Uri.parse('$_baseUrl/users'))
        .timeout(const Duration(seconds: 10));

    if (response.statusCode != 200) {
      throw Exception(
        'Gagal mengambil data pengguna: ${response.statusCode}',
      );
    }

    final List<dynamic> hasilJson = jsonDecode(response.body);

    return hasilJson
        .map((item) => DataPengguna.fromJson(
              item as Map<String, dynamic>,
            ))
        .toList();
  }

  Future<List<DataPeminjaman>> ambilDataPeminjaman() async {
    final response = await http
        .get(Uri.parse('$_baseUrl/posts'))
        .timeout(const Duration(seconds: 10));

    if (response.statusCode != 200) {
      throw Exception(
        'Gagal mengambil data peminjaman: ${response.statusCode}',
      );
    }

    final List<dynamic> hasilJson = jsonDecode(response.body);

    return hasilJson
        .map((item) => DataPeminjaman.fromJson(
              item as Map<String, dynamic>,
            ))
        .toList();
  }

  Future<List<Map<String, dynamic>>> ambilDataTerintegrasi() async {
    try {
      final hasil = await Future.wait([
        ambilDataPengguna(),
        ambilDataPeminjaman(),
      ]);

      final daftarPengguna = hasil[0] as List<DataPengguna>;
      final daftarPeminjaman = hasil[1] as List<DataPeminjaman>;

      return daftarPeminjaman.map((peminjaman) {
        final pengguna = daftarPengguna.firstWhere(
          (item) => item.id == peminjaman.userId,
          orElse: () => const DataPengguna(
            id: 0,
            nama: 'Anggota tidak ditemukan',
            email: '-',
            telepon: '-',
          ),
        );

        return {
          'id': peminjaman.id,
          'judulBuku': peminjaman.judulBuku,
          'deskripsi': peminjaman.deskripsi,
          'status': peminjaman.status,
          'namaPengguna': pengguna.nama,
          'email': pengguna.email,
        };
      }).toList();
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
}
