final List<Map<String, Object>> komponen = [
  {'nama': 'Tugas', 'bobot': 30, 'skor': 28},
  {'nama': 'Praktikum', 'bobot': 25, 'skor': 24},
  {'nama': 'Kehadiran', 'bobot': 10, 'skor': 9},
  {'nama': 'UTS', 'bobot': 20, 'skor': 17},
  {'nama': 'UAS', 'bobot': 15, 'skor': 13},
];

// Menghitung rata-rata dari seluruh skor komponen.
double hitungRataRata(List<Map<String, Object>> komponen) {
  int totalSkor = 0;

  for (var item in komponen) {
    totalSkor += item['skor'] as int;
  }

  return totalSkor / komponen.length;
}

// Aturan predikat berdasarkan rata-rata skor (rentang 0 sampai 20):
// >= 18       -> A
// >= 16 dan < 18 -> B
// >= 13 dan < 16 -> C
// < 13        -> Perlu perbaikan
String predikat(double nilai) {
  if (nilai >= 18) {
    return 'A';
  } else if (nilai >= 16) {
    return 'B';
  } else if (nilai >= 13) {
    return 'C';
  } else {
    return 'Perlu perbaikan';
  }
}

void main() {
  const String mataKuliah = 'Pemrograman Aplikasi Bergerak';

  print('====================================');
  print('         MODUL HITUNG NILAI');
  print('====================================');
  print('Mata Kuliah: $mataKuliah');
  print('\nDaftar Komponen Penilaian:');

  for (var item in komponen) {
    print(
      "${item['nama']} - Bobot: ${item['bobot']} - Skor: ${item['skor']}",
    );
  }

  final double rataRata = hitungRataRata(komponen);

  print('\n====================================');
  print('Rata-rata Skor : ${rataRata.toStringAsFixed(2)}');
  print('Predikat Akhir : ${predikat(rataRata)}');
  print('====================================');
}
