import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/data_fasilitas.dart';
import '../models/data_pengajuan.dart';
import '../models/data_pengguna.dart';

class IntegrasiService {
  static const String _baseUrl = 'https://jsonplaceholder.typicode.com';
  static const Duration _batasWaktu = Duration(seconds: 10);

  /// Request 1: Mengambil daftar pengguna (pelapor) dari GET /users
  static Future<List<DataPengguna>> ambilDaftarPengguna() async {
    final uri = Uri.parse('$_baseUrl/users');
    final response = await http.get(uri).timeout(_batasWaktu);

    if (response.statusCode == 200) {
      final List<dynamic> listJson =
          jsonDecode(response.body) as List<dynamic>;
      return listJson
          .map((item) => DataPengguna.fromJson(item as Map<String, dynamic>))
          .toList();
    } else if (response.statusCode == 404) {
      throw Exception('Endpoint data pengguna tidak ditemukan (HTTP 404).');
    } else {
      throw Exception(
          'Gagal memuat data pengguna dari server (HTTP ${response.statusCode}).');
    }
  }

  /// Request 2: Mengambil daftar fasilitas kampus dari GET /comments (simulasi)
  static Future<List<DataFasilitas>> ambilDaftarFasilitas() async {
    final uri = Uri.parse('$_baseUrl/comments');
    final response = await http.get(uri).timeout(_batasWaktu);

    if (response.statusCode == 200) {
      final List<dynamic> listJson =
          jsonDecode(response.body) as List<dynamic>;
      return listJson
          .take(20)
          .map((item) => DataFasilitas.fromJson(item as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception(
          'Gagal memuat data fasilitas kampus (HTTP ${response.statusCode}).');
    }
  }

  /// Request 3: Mengambil daftar pengajuan kerusakan dari GET /posts
  static Future<List<DataPengajuan>> ambilDaftarPengajuan() async {
    final uri = Uri.parse('$_baseUrl/posts');
    final response = await http.get(uri).timeout(_batasWaktu);

    if (response.statusCode == 200) {
      final List<dynamic> listJson =
          jsonDecode(response.body) as List<dynamic>;
      return listJson
          .take(15)
          .map((item) => DataPengajuan.fromJson(item as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception(
          'Gagal memuat daftar pengajuan fasilitas (HTTP ${response.statusCode}).');
    }
  }

  /// Menggabungkan data ketiga endpoint secara paralel menggunakan Future.wait
  static Future<List<DataPengajuanRingkas>> ambilPengajuanTerintegrasi({
    bool simulasiDataKosong = false,
  }) async {
    try {
      // Ketiga request tidak saling bergantung sehingga dijalankan paralel
      final hasilParalel = await Future.wait([
        ambilDaftarPengguna(),
        ambilDaftarFasilitas(),
        ambilDaftarPengajuan(),
      ]);

      if (simulasiDataKosong) {
        return [];
      }

      final daftarPengguna = hasilParalel[0] as List<DataPengguna>;
      final daftarFasilitas = hasilParalel[1] as List<DataFasilitas>;
      final daftarPengajuan = hasilParalel[2] as List<DataPengajuan>;

      // Indeks berdasarkan identifier agar pencocokan relasi efisien O(1)
      final Map<int, DataPengguna> petaPengguna = {
        for (final pengguna in daftarPengguna) pengguna.id: pengguna,
      };
      final Map<int, DataFasilitas> petaFasilitas = {
        for (final fasilitas in daftarFasilitas) fasilitas.id: fasilitas,
      };

      // Penggabungan data berdasarkan identifier userId dan fasilitasId
      return daftarPengajuan.map((pengajuan) {
        final pelapor = petaPengguna[pengajuan.userId];
        final fasilitas = petaFasilitas[pengajuan.fasilitasId];

        return DataPengajuanRingkas(
          idPengajuan: pengajuan.id,
          userId: pengajuan.userId,
          fasilitasId: pengajuan.fasilitasId,
          namaPelapor: pelapor?.nama ?? 'Pelapor #${pengajuan.userId}',
          emailPelapor: pelapor?.email ?? 'tidak-diketahui@kampus.ac.id',
          namaFasilitas:
              fasilitas?.namaFasilitas ?? 'Fasilitas #${pengajuan.fasilitasId}',
          lokasiGedung: fasilitas?.lokasiGedung ?? 'Area Kampus Utama',
          judulKendala: pengajuan.judulKendala,
          detailKendala: pengajuan.detailKendala,
          status: pengajuan.status,
        );
      }).toList();
    } on TimeoutException {
      throw Exception(
          'Waktu koneksi ke server habis (timeout). Periksa jaringan Anda.');
    } on http.ClientException {
      throw Exception(
          'Tidak dapat terhubung ke server. Pastikan koneksi internet aktif.');
    } on FormatException {
      throw Exception('Format data JSON dari server tidak sesuai.');
    } catch (e) {
      throw Exception(e.toString().replaceFirst('Exception: ', ''));
    }
  }
}