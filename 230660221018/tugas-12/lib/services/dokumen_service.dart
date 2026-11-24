import 'package:file_picker/file_picker.dart';

class DokumenService {
  /// Memilih dokumen pendukung dari perangkat.
  ///
  /// Format file yang diperbolehkan:
  /// PDF, DOC, DOCX.
  ///
  /// Mengembalikan PlatformFile jika berhasil memilih.
  /// Mengembalikan null jika tidak ada file yang dipilih.
  Future<PlatformFile?> pilihDokumenPendukung() async {
    final hasil = await FilePicker.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx'],
    );

    if (hasil.isEmpty) {
      return null;
    }

    return hasil.first;
  }
}
