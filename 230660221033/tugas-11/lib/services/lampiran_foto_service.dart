import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class HasilPilihanFoto {
  final String namaFile;
  final String path;
  final Uint8List bytes;
  final int ukuranByte;

  const HasilPilihanFoto({
    required this.namaFile,
    required this.path,
    required this.bytes,
    required this.ukuranByte,
  });

  String get ukuranFormatted {
    final kb = ukuranByte / 1024;
    if (kb > 1024) {
      return '${(kb / 1024).toStringAsFixed(2)} MB';
    }
    return '${kb.toStringAsFixed(1)} KB';
  }
}

class PermissionDitolakException implements Exception {
  final String pesan;
  PermissionDitolakException(this.pesan);

  @override
  String toString() => pesan;
}

class LampiranFotoService {
  final ImagePicker _picker = ImagePicker();
  static const int _batasUkuranByte = 5 * 1024 * 1024; // Maksimal 5 MB

  /// Mengambil gambar dari kamera atau galeri.
  /// Mengembalikan null jika pengguna membatalkan aksi.
  /// Melempar Exception jika permission ditolak, ukuran berlebih, atau perangkat gagal.
  Future<HasilPilihanFoto?> pilihFotoKondisiBuku(ImageSource sumber) async {
    try {
      final XFile? fileTerpilih = await _picker.pickImage(
        source: sumber,
        maxWidth: 1600,
        imageQuality: 85,
      );

      // Jika null, artinya pengguna menekan tombol kembali / batal
      if (fileTerpilih == null) {
        return null;
      }

      // Membaca bytes agar kompatibel baik di Android/iOS maupun Flutter Web (Chrome)
      final Uint8List dataBytes = await fileTerpilih.readAsBytes();
      final int ukuran = dataBytes.length;

      // Validasi aturan proses bisnis: ukuran foto maksimal 5 MB
      if (ukuran > _batasUkuranByte) {
        throw Exception(
          'Ukuran foto (${(ukuran / (1024 * 1024)).toStringAsFixed(2)} MB) melebihi batas maksimal 5 MB.',
        );
      }

      return HasilPilihanFoto(
        namaFile: fileTerpilih.name,
        path: fileTerpilih.path,
        bytes: dataBytes,
        ukuranByte: ukuran,
      );
    } on PlatformException catch (e) {
      if (e.code == 'camera_access_denied' || e.code == 'photo_access_denied') {
        throw PermissionDitolakException(
          'Izin akses kamera atau galeri ditolak. Silakan aktifkan izin melalui pengaturan perangkat/browser Anda.',
        );
      }
      throw Exception('Gagal mengakses perangkat keras (${e.code}): ${e.message ?? "Kesalahan sistem"}');
    } catch (e) {
      if (e is PermissionDitolakException) rethrow;
      throw Exception(e.toString().replaceAll('Exception: ', ''));
    }
  }
}