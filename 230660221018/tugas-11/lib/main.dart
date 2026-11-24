import 'package:flutter/material.dart';

import 'halaman-utama.dart';

void main() {
  runApp(const SIPORAApp());
}

class SIPORAApp extends StatelessWidget {
  const SIPORAApp({super.key});

  static const Color warnaUtama = Color(0xFF2459A9);
  static const Color warnaLatar = Color(0xFFF6F8FC);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SIPORA',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: warnaUtama,
          primary: warnaUtama,
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: warnaLatar,
        fontFamily: 'Roboto',
      ),
      home: const HalamanUtama(),
    );
  }
}