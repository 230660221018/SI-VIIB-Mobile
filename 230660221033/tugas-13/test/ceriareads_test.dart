import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ceriareads_testing_debugging/main.dart';
import 'package:ceriareads_testing_debugging/utils/form_validator.dart';

void main() {
  group('Unit Test — CeriaReadsValidator', () {
    test('UT-01: Menolak nama kosong dan menerima nama valid', () {
      expect(CeriaReadsValidator.validasiNama(''), 'Nama peminjam wajib diisi.');
      expect(CeriaReadsValidator.validasiNama('Yo'), 'Nama minimal terdiri dari 3 karakter.');
      expect(CeriaReadsValidator.validasiNama('Yelly Ambarwaty'), isNull);
    });

    test('UT-02: Menolak durasi di luar rentang 1-14 hari', () {
      expect(
        CeriaReadsValidator.validasiDurasiPinjam('0'),
        'Durasi peminjaman hanya diperbolehkan antara 1 hingga 14 hari.',
      );
      expect(
        CeriaReadsValidator.validasiDurasiPinjam('20'),
        'Durasi peminjaman hanya diperbolehkan antara 1 hingga 14 hari.',
      );
      expect(CeriaReadsValidator.validasiDurasiPinjam('7'), isNull);
    });
  });

  group('Widget Test & Regresi — HalamanPeminjamanTeruji', () {
    testWidgets('WT-01: Menampilkan pesan validasi jika form kosong dikirim',
        (tester) async {
      await tester.pumpWidget(const MaterialApp(home: HalamanPeminjamanTeruji()));

      await tester.tap(find.byKey(const Key('tombol_simpan')));
      await tester.pump();

      expect(find.text('Nama peminjam wajib diisi.'), findsOneWidget);
      expect(find.text('Judul buku wajib diisi.'), findsOneWidget);
    });

    testWidgets('WT-02: Menyimpan data dengan benar saat input valid',
        (tester) async {
      await tester.pumpWidget(const MaterialApp(home: HalamanPeminjamanTeruji()));

      await tester.enterText(
          find.byKey(const Key('input_nama')), 'Yelly Ambarwaty');
      await tester.enterText(
          find.byKey(const Key('input_judul')), 'Filosofi Teras');
      await tester.enterText(find.byKey(const Key('input_durasi')), '5');

      await tester.tap(find.byKey(const Key('tombol_simpan')));
      await tester.pump();

      // Memastikan indikator loading muncul saat proses berlangsung
      expect(find.text('Menyimpan...'), findsOneWidget);

      // Menunggu jeda simulasi penyimpanan selesai (400 ms)
      await tester.pump(const Duration(milliseconds: 500));

      expect(find.text('Filosofi Teras'), findsOneWidget);
      expect(find.text('Peminjam: Yelly Ambarwaty • 5 hari'), findsOneWidget);
    });

    testWidgets(
        'WT-03 (Regresi BUG-01): Klik tombol simpan 2x cepat tidak membuat data ganda',
        (tester) async {
      await tester.pumpWidget(const MaterialApp(home: HalamanPeminjamanTeruji()));

      await tester.enterText(
          find.byKey(const Key('input_nama')), 'Yelly Ambarwaty');
      await tester.enterText(
          find.byKey(const Key('input_judul')), 'Bumi Manusia');

      // Tap pertama dan kedua secara beruntun sebelum jeda selesai
      await tester.tap(find.byKey(const Key('tombol_simpan')));
      await tester.pump();
      await tester.tap(find.byKey(const Key('tombol_simpan')));
      await tester.pump(const Duration(milliseconds: 500));

      // Data 'Bumi Manusia' hanya boleh muncul tepat satu kali di daftar
      expect(find.text('Bumi Manusia'), findsOneWidget);
    });

    testWidgets('WT-04: Menghapus item mengembalikan daftar ke state kosong',
        (tester) async {
      await tester.pumpWidget(const MaterialApp(home: HalamanPeminjamanTeruji()));

      await tester.enterText(find.byKey(const Key('input_nama')), 'Yelly');
      await tester.enterText(find.byKey(const Key('input_judul')), 'Laskar Pelangi');
      await tester.tap(find.byKey(const Key('tombol_simpan')));
      await tester.pump(const Duration(milliseconds: 500));

      expect(find.text('Laskar Pelangi'), findsOneWidget);

      await tester.tap(find.byIcon(Icons.delete_outline));
      await tester.pump();

      expect(find.text('Laskar Pelangi'), findsNothing);
      expect(
          find.text('Belum ada data pengajuan peminjaman.'), findsOneWidget);
    });
  });
}