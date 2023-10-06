import 'package:flutter/material.dart';
import 'package:requeue/features/home/components/home_body.dart';
import 'package:requeue/features/home/components/home_frosted_glass.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: size.height * 0.12,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xff5bc1e0), Color(0xff7f5bff)],
                stops: [0, 0.5],
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
              ),
            ),
          ),
          SafeArea(
            child: HomeFrosetedGlass(size: size),
          ),
          HomeBody(size: size)
        ],
      ),
    );
  }
}
