import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:requeue/features/profile/components/profile_chip_widget.dart';
import 'package:requeue/features/profile/components/profile_details_body.dart';
import 'package:requeue/features/profile/components/profile_frosted_glass.dart';
import 'package:requeue/features/profile/components/profile_restaurants_widget.dart';
import 'package:requeue/features/profile/view_model/profile_viewmodel_provider.dart';
import 'package:requeue/res/constants/ksize.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
              SafeArea(
                child: ProfileFrosetedGlass(
                  size: size,
                ),
              ),
            ],
          ),
          Ksize.ktwenty5H,
          Expanded(
            child: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverToBoxAdapter(child: ProfileDetailsBody(size: size)),
                ];
              },
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    const ProfileChipWidget(),
                    Consumer<ProfileViewModelProvider>(
                      builder: (context, value, child) {
                        switch (value.profileChip) {
                          case ProfileChip.rates:
                            return ProfileRestaurants(size: size);
                          case ProfileChip.visited:
                            return ProfileRestaurants(size: size);

                          case ProfileChip.favorite:
                            return ProfileRestaurants(size: size);

                          default:
                            return const SizedBox();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
