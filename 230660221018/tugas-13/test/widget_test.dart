import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sipora/halaman-utama.dart';

void main() {
  // Test 1: Menampilkan halaman utama SIPORA
  testWidgets('SIPORA menampilkan halaman utama', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: HalamanUtama()));

    expect(find.text('Intan Kartika'), findsOneWidget);
    expect(find.text('Beranda'), findsOneWidget);
    expect(find.text('Pengajuan'), findsOneWidget);
    expect(find.text('Akun'), findsOneWidget);

    expect(find.text('Urus Surat Akademik\nLebih Mudah'), findsOneWidget);
    expect(find.text('Ringkasan Pengajuan'), findsOneWidget);
    expect(find.text('Total Pengajuan'), findsOneWidget);
  });

  // Test 2: Navigasi ke halaman Pengajuan
  testWidgets('Navigasi ke halaman Pengajuan', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: HalamanUtama()));

    final navigasi = find.byType(NavigationBar);
    final tujuanPengajuan = find.descendant(
      of: navigasi,
      matching: find.text('Pengajuan'),
    );

    await tester.tap(tujuanPengajuan);
    await tester.pump();

    expect(tester.widget<NavigationBar>(navigasi).selectedIndex, 1);
  });

  // Test 3: Navigasi ke halaman Akun
  testWidgets('Navigasi ke halaman Akun', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: HalamanUtama()));

    final navigasi = find.byType(NavigationBar);
    final tujuanAkun = find.descendant(
      of: navigasi,
      matching: find.text('Akun'),
    );

    await tester.tap(tujuanAkun);
    await tester.pump();

    expect(tester.widget<NavigationBar>(navigasi).selectedIndex, 2);
  });

  // Test 4: Kembali ke halaman Beranda
  testWidgets('Navigasi kembali ke halaman Beranda', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: HalamanUtama()));

    final navigasi = find.byType(NavigationBar);

    final tujuanAkun = find.descendant(
      of: navigasi,
      matching: find.text('Akun'),
    );

    await tester.tap(tujuanAkun);
    await tester.pump();

    final tujuanBeranda = find.descendant(
      of: navigasi,
      matching: find.text('Beranda'),
    );

    await tester.tap(tujuanBeranda);
    await tester.pump();

    expect(tester.widget<NavigationBar>(navigasi).selectedIndex, 0);
  });
}
