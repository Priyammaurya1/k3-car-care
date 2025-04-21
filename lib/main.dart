import 'package:flutter/material.dart';
import 'package:k3carcare/screens/home_screen_new.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue.shade700,
          primary: Colors.blue.shade700,
        ),
        useMaterial3: true,
        fontFamily: 'Poppins',
      ),
      home: const HomeScreenNew(),
    );
  }
}
