import 'package:flutter/material.dart';
import 'package:k3carcare/provider/selected_car_provider.dart';
import 'package:k3carcare/screens/car_selection.dart';
import 'package:k3carcare/screens/login_screen.dart';
import 'package:provider/provider.dart';
// Import your provider

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SelectedCarProvider()),
        // Add other providers if needed
      ],
      child: MaterialApp(
        title: 'K3 Car Care',
        debugShowCheckedModeBanner: false,
        home: const LoginScreen(),
        routes: {
          '/brand_selection': (context) => const BrandSelectionScreen(),
          // Add other routes as needed
        },
      ),
    );
  }
}