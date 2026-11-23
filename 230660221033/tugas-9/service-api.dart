import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

// ==========================================
// MODEL DATA (PARSING JSON)
// ==========================================
class DataPengajuanApi {
  final int id;
  final String judulBuku;
  final String keteranganPinjam;

  const DataPengajuanApi({
    required this.id,
    required this.judulBuku,
    required this.keteranganPinjam,
  });

  // Factory constructor dengan penanganan null yang aman
  factory DataPengajuanApi.fromJson(Map<String, dynamic> json) {
    return DataPengajuanApi(
      id: json['id'] is int ? json['id'] : int.tryParse(json['id'].toString()) ?? 0,
      judulBuku: json['title']?.toString() ?? 'Judul Buku Tidak Tersedia',
      keteranganPinjam: json['body']?.toString() ?? 'Tidak ada keterangan peminjaman',
    );
  }

  // Serialisasi objek ke Map untuk dikirim via POST
  Map<String, dynamic> toJson() {
    return {
      'title': judulBuku,
      'body': keteranganPinjam,
      'userId': 1,
    };
  }
}

// ==========================================
// LAPISAN SERVICE (ISOLASI LOGIKA HTTP)
// ==========================================
class CeriaReadsApiService {
  // Menggunakan JSONPlaceholder sebagai endpoint simulasi REST API
  static const String baseUrl = 'https://jsonplaceholder.typicode.com';

  // 1. Operasi GET: Mengambil daftar data pengajuan/katalog
  static Future<List<DataPengajuanApi>> ambilDaftarPengajuan() async {
    final url = Uri.parse('$baseUrl/posts');

    try {
      final response = await http
          .get(url)
          .timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final List<dynamic> dataMentah = jsonDecode(response.body) as List<dynamic>;
        // Mengambil 10 data teratas agar daftar rapi dan cepat dimuat
        return dataMentah
            .take(10)
            .map((item) => DataPengajuanApi.fromJson(item as Map<String, dynamic>))
            .toList();
      } else {
        throw Exception('Server gagal merespons (Kode HTTP: ${response.statusCode})');
      }
    } on TimeoutException {
      throw Exception('Waktu koneksi habis (Timeout). Periksa kecepatan internet Anda.');
    } on SocketException {
      throw Exception('Tidak ada koneksi internet. Pastikan perangkat terhubung ke jaringan.');
    } catch (e) {
      throw Exception('Gagal memuat data: $e');
    }
  }

  // 2. Operasi POST: Mengirim pengajuan peminjaman baru ke server
  static Future<DataPengajuanApi> kirimPengajuanBaru(DataPengajuanApi pengajuanBaru) async {
    final url = Uri.parse('$baseUrl/posts');

    try {
      final response = await http
          .post(
            url,
            headers: {
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(pengajuanBaru.toJson()),
          )
          .timeout(const Duration(seconds: 10));

      if (response.statusCode == 201) {
        final Map<String, dynamic> hasilJson = jsonDecode(response.body) as Map<String, dynamic>;
        return DataPengajuanApi.fromJson(hasilJson);
      } else {
        throw Exception('Gagal mengirim pengajuan (Kode HTTP: ${response.statusCode})');
      }
    } on TimeoutException {
      throw Exception('Waktu pengiriman habis (Timeout). Silakan coba lagi.');
    } on SocketException {
      throw Exception('Koneksi terputus saat mengirim data.');
    } catch (e) {
      throw Exception('Terjadi kesalahan sistem: $e');
    }
  }
}