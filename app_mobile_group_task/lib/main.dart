import 'package:first_app/pages/pages.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      initialRoute: '/login', // Mengubah route awal ke login
      routes: {
        '/login': (context) => WellcomePage(), // Halaman login
        '/home': (context) => HomePage(), // Halaman utama
      },
    );
  }
}
