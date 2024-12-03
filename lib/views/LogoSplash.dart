import 'dart:async';

import 'package:ex_ukl/views/PassView.dart';
import 'package:flutter/material.dart';

class Logosplash extends StatefulWidget {
  const Logosplash({super.key});

  @override
  State<Logosplash> createState() => _LogosplashState();
}

class _LogosplashState extends State<Logosplash> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Passview()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 4, 22, 101),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/splash.png',
              width: 400,
            ),
            SizedBox(height: 16),
            Text(
              'TIX VIP, lebih seru, koin melimpah,\n dapat hadiah!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Gabung TIX VIP dan kumpulkan koin untuk\nmendapatkan hadiah dan diskon.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white70,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
