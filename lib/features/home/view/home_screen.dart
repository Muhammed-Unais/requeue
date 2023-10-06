import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:requeue/features/home/components/home_body_dinein.dart';
import 'package:requeue/features/home/components/home_body_pickup.dart';
import 'package:requeue/features/home/components/home_frosted_glass.dart';
import 'package:requeue/features/home/components/home_top_chip.dart';
import 'package:requeue/features/home/view_model/restaurent_viewmodel_provider.dart';
import 'package:requeue/res/constants/ksize.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Stack(
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
              SafeArea(child: HomeFrosetedGlass(size: size)),
            ],
          ),
          Ksize.ktenH,
          const Align(
            alignment: Alignment.centerLeft,
            child: HomeTopChip(),
          ),
          Ksize.ktenH,
          Consumer<RestaurantViewModelProvider>(
            builder: (context, value, child) {
              switch (value.homeChip) {
                case HomeChip.dinein:
                  return HomeBodyDiniIn(
                    size: size,
                  );

                case HomeChip.pickup:
                  return HomeBodyPickup(
                    size: size,
                  );

                default:
                  return const SizedBox();
              }
            },
          )
        ],
      ),
    );
  }
}
