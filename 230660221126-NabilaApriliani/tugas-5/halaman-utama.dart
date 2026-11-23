@'
import 'package:flutter/material.dart';

void main() {
  runApp(const TravelApp());
}

class TravelApp extends StatelessWidget {
  const TravelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel Booking App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const HalamanKatalogUtama(),
    );
  }
}

class HalamanKatalogUtama extends StatelessWidget {
  const HalamanKatalogUtama({super.key});

  final List> daftarPaket = const [
    {
      'nama': 'Paket Wisata Bali 3D2N',
      'kategori': 'Domestik',
      'status': 'Tersedia',
      'harga': 'Rp 2.500.000'
    },
    {
      'nama': 'Paket Tour Jogja Hemat',
      'kategori': 'Domestik',
      'status': 'Tersedia',
      'harga': 'Rp 1.200.000'
    },
    {
      'nama': 'Eksplor Labuan Bajo 4D3N',
      'kategori': 'Premium',
      'status': 'Penuh',
      'harga': 'Rp 5.800.000'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Travel Booking & Tour'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Halo, Wisatawan!',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Temukan paket liburan impianmu hari ini.',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
          Expanded(
            child: daftarPaket.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.inbox, size: 64, color: Colors.grey),
                        SizedBox(height: 8),
                        Text('Belum ada paket wisata tersedia.'),
                      ],
                    ),
                  )
                : ListView.builder(
                    itemCount: daftarPaket.length,
                    itemBuilder: (context, index) {
                      final item = daftarPaket[index];
                      final bool isTersedia = item['status'] == 'Tersedia';

                      return Card(
                        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        elevation: 2,
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(12),
                          leading: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.indigo.shade50,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Icon(Icons.flight_takeoff, color: Colors.indigo),
                          ),
                          title: Text(
                            item['nama']!,
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 6),
                              Text('Kategori: ${item['kategori']}'),
                              const SizedBox(height: 4),
                              Text(
                                'Harga: ${item['harga']}',
                                style: TextStyle(
                                  color: Colors.indigo.shade700,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          trailing: Chip(
                            label: Text(
                              item['status']!,
                              style: TextStyle(
                                color: isTersedia ? Colors.green.shade800 : Colors.red.shade800,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                            backgroundColor: isTersedia ? Colors.green.shade100 : Colors.red.shade100,
                            padding: EdgeInsets.zero,
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        icon: const Icon(Icons.add_shopping_cart),
        label: const Text('Pesan Paket'),
      ),
    );
  }
}
'@ | Out-File -Encoding utf8 "tugas-5\230660221126-Nabila-Apriliani\halaman-utama.dart"
