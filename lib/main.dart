import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech_blog/view/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale:const Locale('fa', 'IR'),
      debugShowCheckedModeBanner: false,
      title: 'Tech Blog',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
