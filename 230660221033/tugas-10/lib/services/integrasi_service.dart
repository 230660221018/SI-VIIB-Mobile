import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../models/data_anggota.dart';
import '../models/data_peminjaman.dart';
import '../models/peminjaman_ringkas.dart';

class IntegrasiService {
  static const String _baseUrl = 'https://jsonplaceholder.typicode.com';

  // Request 1: Mengambil daftar anggota dari endpoint /users
  static Future<List<DataAnggota>> ambilDaftarAnggota() async {
    final url = Uri.parse('$_baseUrl/users');
    final response = await http.get(url).timeout(const Duration(seconds: 10));

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body) as List<dynamic>;
      return jsonList
          .map((item) => DataAnggota.fromJson(item as Map<String, dynamic>))
          .toList();
    } else if (response.statusCode == 404) {
      throw Exception('Endpoint data anggota tidak ditemukan (404).');
    } else {
      throw Exception('Gagal memuat data anggota (HTTP ${response.statusCode}).');
    }
  }

  // Request 2: Mengambil daftar peminjaman dari endpoint /posts
  static Future<List<DataPeminjaman>> ambilDaftarPeminjaman() async {
    final url = Uri.parse('$_baseUrl/posts');
    final response = await http.get(url).timeout(const Duration(seconds: 10));

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body) as List<dynamic>;
      return jsonList
          .take(15) // Membatasi 15 transaksi teratas agar ringkas
          .map((item) => DataPeminjaman.fromJson(item as Map<String, dynamic>))
          .toList();
    } else if (response.statusCode == 404) {
      throw Exception('Endpoint data peminjaman tidak ditemukan (404).');
    } else {
      throw Exception('Gagal memuat data peminjaman (HTTP ${response.statusCode}).');
    }
  }

  // Menggabungkan kedua endpoint dengan Future.wait berdasarkan identifier userId
  static Future<List<PeminjamanRingkas>> ambilPeminjamanTerintegrasi() async {
    try {
      // Menjalankan dua request independen secara paralel
      final hasilParalel = await Future.wait([
        ambilDaftarAnggota(),
        ambilDaftarPeminjaman(),
      ]);

      final daftarAnggota = hasilParalel[0] as List<DataAnggota>;
      final daftarPeminjaman = hasilParalel[1] as List<DataPeminjaman>;

      // Memetakan anggota ke dalam Map berdasarkan id untuk pencarian cepat O(1)
      final petaAnggota = {
        for (var anggota in daftarAnggota) anggota.id: anggota
      };

      // Menggabungkan data peminjaman dengan nama peminjam menggunakan userId
      return daftarPeminjaman.map((pinjam) {
        final peminjam = petaAnggota[pinjam.userId];
        return PeminjamanRingkas(
          idPeminjaman: pinjam.id,
          namaPeminjam: peminjam?.nama ?? 'Anggota Tidak Dikenal (ID: ${pinjam.userId})',
          emailPeminjam: peminjam?.email ?? '-',
          judulBuku: pinjam.judulBuku,
          status: pinjam.status,
        );
      }).toList();
    } on TimeoutException {
      throw Exception('Waktu koneksi habis (Timeout). Periksa jaringan internet Anda.');
    } on SocketException {
      throw Exception('Tidak ada koneksi internet. Pastikan perangkat terhubung jaringan.');
    } catch (e) {
      throw Exception('Gagal mengintegrasikan data: ${e.toString().replaceAll('Exception: ', '')}');
    }
  }
}