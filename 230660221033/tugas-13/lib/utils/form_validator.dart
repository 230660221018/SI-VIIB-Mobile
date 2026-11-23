class CeriaReadsValidator {
  static String? validasiNama(String? value) {
    final nama = value?.trim() ?? '';
    if (nama.isEmpty) {
      return 'Nama peminjam wajib diisi.';
    }
    if (nama.length < 3) {
      return 'Nama minimal terdiri dari 3 karakter.';
    }
    if (nama.length > 60) {
      return 'Nama maksimal 60 karakter.';
    }
    return null;
  }

  static String? validasiJudulBuku(String? value) {
    final judul = value?.trim() ?? '';
    if (judul.isEmpty) {
      return 'Judul buku wajib diisi.';
    }
    if (judul.length > 100) {
      return 'Judul buku maksimal 100 karakter.';
    }
    return null;
  }

  static String? validasiDurasiPinjam(String? value) {
    final teks = value?.trim() ?? '';
    if (teks.isEmpty) {
      return 'Durasi peminjaman wajib diisi.';
    }
    final hari = int.tryParse(teks);
    if (hari == null) {
      return 'Durasi harus berupa angka bulat.';
    }
    if (hari < 1 || hari > 14) {
      return 'Durasi peminjaman hanya diperbolehkan antara 1 hingga 14 hari.';
    }
    return null;
  }
}