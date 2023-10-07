import 'package:flutter/material.dart';
import 'package:requeue/res/components/restaurent_card.dart';


class ProfileRestaurants extends StatefulWidget {
  const ProfileRestaurants({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  State<ProfileRestaurants> createState() => _ProfileRestaurantsState();
}

class _ProfileRestaurantsState extends State<ProfileRestaurants> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      primary: false,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(
        horizontal: 10,vertical: 10
      ),
      shrinkWrap: true,
      itemCount: 3,
      itemBuilder: (context, index) {
        return const RestarentCard(
          rating: 5.0,
          image: null,
          titile: "Restuaruarent",
        );
      },
    );
  }
}
