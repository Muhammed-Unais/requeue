import 'package:flutter/material.dart';
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
  List<String> chipNames = ["Dine in", "Pickup"];

  late String selcetedChip;

  @override
  void initState() {
    selcetedChip = chipNames[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.05,
      child: ListView.builder(
        shrinkWrap: true,
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 10),
        scrollDirection: Axis.horizontal,
        itemCount: chipNames.length,
        itemBuilder: (context, index) {
          final chipName = chipNames[index];
          return GestureDetector(
            onTap: () {
              setState(() {
                selcetedChip = chipName;
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 30),
              child: HomeChipWidget(
                label: chipName,
                backgroundColor: selcetedChip == chipName
                    ? AppColor.primaryColor
                    : Colors.white,
                labeColor:
                    selcetedChip == chipName ? Colors.white : Colors.black,
              ),
            ),
          );
        },
      ),
    );
  }
}