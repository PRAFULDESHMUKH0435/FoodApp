import 'package:flutter/material.dart';
import 'package:food_app/screens/splash_screen.dart';

void main() {
  runApp(const FoodFactoryApp());
}

class FoodFactoryApp extends StatelessWidget {
  const FoodFactoryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food Factory',
      theme: ThemeData(primarySwatch: Colors.red),
      home: const SplashScreen(),
    );
  }
}
