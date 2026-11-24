import 'package:flutter/material.dart';

import 'halaman-api.dart';

void main() {
  runApp(const SIPORATugas9App());
}

class SIPORATugas9App extends StatelessWidget {
  const SIPORATugas9App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SIPORA - Tugas 9',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2459A9)),
        scaffoldBackgroundColor: const Color(0xFFF6F8FC),
      ),
      home: const HalamanApiPage(),
    );
  }
}

