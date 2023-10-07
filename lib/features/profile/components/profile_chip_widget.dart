import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:requeue/features/profile/view_model/profile_viewmodel_provider.dart';
import 'package:requeue/res/components/chip_widget.dart';
import 'package:requeue/res/constants/app_colors.dart';

class ProfileChipWidget extends StatefulWidget {
  const ProfileChipWidget({
    super.key,
  });

  @override
  State<ProfileChipWidget> createState() => _ProfileChipWidgetState();
}

class _ProfileChipWidgetState extends State<ProfileChipWidget> {
  late List<String> chipNames;
  late ProfileViewModelProvider profileProvider;

  @override
  void initState() {
    profileProvider = context.read<ProfileViewModelProvider>();
    chipNames = profileProvider.chipNames;
    profileProvider.selectedChip = chipNames[0];
    profileProvider.profileChip = ProfileChip.rates;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    profileProvider = context.watch<ProfileViewModelProvider>();
    return SizedBox(
      height: 60,
      child: ListView.builder(
        shrinkWrap: true,
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 10),
        scrollDirection: Axis.horizontal,
        itemCount: chipNames.length,
        itemBuilder: (context, index) {
          final chipName = chipNames[index];
          return GestureDetector(
            onTap: () {
              profileProvider.setChipValu(chipName);
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: ChipWidget(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                label: chipName,
                backgroundColor: profileProvider.selectedChip == chipName
                    ? AppColor.primaryColor
                    : Colors.white,
                labeColor: profileProvider.selectedChip == chipName
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
