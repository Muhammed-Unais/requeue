import 'package:flutter/material.dart';
import 'package:requeue/features/home/components/home_top_chip.dart';
import 'package:requeue/res/components/restaurent_card.dart';
import 'package:requeue/res/constants/ksize.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: size.height * 0.125,
      left: 10,
      right: 10,
      child: const SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomeTopChip(),
            Ksize.ktwentyH,
            RestarentCard()
          ],
        ),
      ),
    );
  }
}


