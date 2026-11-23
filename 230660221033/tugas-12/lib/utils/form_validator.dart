class CeriaReadsValidator {
  // 1. Validator Nama Peminjam (Wajib & Batas Panjang 3-60 karakter)
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

  // 2. Validator Email Anggota (Wajib & Format Email Valid)
  static String? validasiEmail(String? value) {
    final email = value?.trim() ?? '';
    if (email.isEmpty) {
      return 'Alamat email wajib diisi.';
    }
    final regexEmail = RegExp(r'^[\w\.-]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!regexEmail.hasMatch(email)) {
      return 'Format email tidak valid (contoh: anggota@domain.com).';
    }
    return null;
  }

  // 3. Validator Judul Buku (Wajib & Batas Panjang Maksimal 100 karakter)
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

  // 4. Validator Durasi Peminjaman (Angka Wajib & Rentang 1 - 14 Hari)
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

  // 5. Validator Lampiran Foto Kondisi Buku (Format JPG/PNG & Maksimal 5 MB)
  static String? validasiFileLampiran({
    required String? namaFile,
    required int ukuranByte,
  }) {
    if (namaFile == null || namaFile.trim().isEmpty) {
      return 'Harap pilih foto bukti kondisi buku.';
    }
    final ekstensiValid = namaFile.toLowerCase().endsWith('.jpg') ||
        namaFile.toLowerCase().endsWith('.jpeg') ||
        namaFile.toLowerCase().endsWith('.png');
    if (!ekstensiValid) {
      return 'Format file tidak didukung. Gunakan format JPG, JPEG, atau PNG.';
    }
    const batas5Mb = 5 * 1024 * 1024;
    if (ukuranByte > batas5Mb) {
      return 'Ukuran file melebihi batas maksimal 5 MB.';
    }
    return null;
  }
}