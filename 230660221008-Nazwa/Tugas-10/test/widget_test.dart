import 'package:flutter_test/flutter_test.dart';
import 'package:pengaduan_fasilitas_kampus_p10/main.dart';

void main() {
  testWidgets('Halaman utama integrasi pengaduan berhasil dimuat',
      (WidgetTester tester) async {
    await tester.pumpWidget(const AplikasiPengaduanTerintegrasi());
    expect(find.text('Pengaduan Fasilitas Terintegrasi'), findsOneWidget);
  });
}