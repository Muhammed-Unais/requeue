import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:requeue/features/home/view_model/restaurent_viewmodel_provider.dart';
import 'package:requeue/res/components/chip_widget.dart';
import 'package:requeue/res/constants/app_colors.dart';

class HomeTopChip extends StatefulWidget {
  const HomeTopChip({
    super.key,
  });

  @override
  State<HomeTopChip> createState() => _HomeTopChipState();
}

class _HomeTopChipState extends State<HomeTopChip> {
  late List<String> chipNames;
  late RestaurantViewModelProvider restuarentProvider;

  @override
  void initState() {
    restuarentProvider = context.read<RestaurantViewModelProvider>();
    chipNames = restuarentProvider.chipNames;
    restuarentProvider.selcetedChip = chipNames[0];
    restuarentProvider.homeChip = HomeChip.dinein;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    restuarentProvider = context.watch<RestaurantViewModelProvider>();
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.05,
      child: ListView.builder(
        shrinkWrap: true,
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        itemCount: chipNames.length,
        itemBuilder: (context, index) {
          final chipName = chipNames[index];
          return GestureDetector(
            onTap: () {
              restuarentProvider.seHomeChipValue(chipName);
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 30),
              child: HomeChipWidget(
                label: chipName,
                backgroundColor: restuarentProvider.selcetedChip == chipName
                    ? AppColor.primaryColor
                    : Colors.white,
                labeColor: restuarentProvider.selcetedChip == chipName
                    ? Colors.white
                    : Colors.black,
              ),
            ),
          );
        },
      ),
    );
  }
}
