import 'package:flutter/material.dart';

class Homeviews extends StatelessWidget {
  const Homeviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: true,
            expandedHeight: 100.0,
            backgroundColor: Colors.grey,
            title: Image.asset(
              'assets/lari.png',
              width: 90,
              height: 90,
            ),
          )
        ],
      ),
    );
  }
}
