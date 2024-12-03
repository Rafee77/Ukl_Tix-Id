import 'package:ex_ukl/views/BoardView.dart';
import 'package:ex_ukl/views/LogoSplash.dart';
import 'package:ex_ukl/views/PassView.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TIX',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: Logosplash(),
    );
  }
}
