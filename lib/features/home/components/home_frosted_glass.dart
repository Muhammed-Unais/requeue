import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:requeue/features/auth/view_model/auth_view_model.dart';
import 'package:requeue/features/home/components/home_dragblescrollable_sheet.dart';
import 'package:requeue/features/profile/view_model/profile_viewmodel_provider.dart';
import 'package:requeue/res/constants/app_colors.dart';
import 'package:requeue/res/constants/ksize.dart';

class HomeFrosetedGlass extends StatelessWidget {
  const HomeFrosetedGlass({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
        height: size.height * 0.1,
        width: size.width,
        color: Colors.transparent,
        child: Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 7.0, sigmaY: 7.0),
              child: Container(),
            ),
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.10),
                  )
                ],
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Colors.white.withOpacity(0.5),
                    Colors.white.withOpacity(0.5)
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                onTap: () {
                  var authProvider = context.read<AuthViewmodelProvider>();
                  if (authProvider.token != null) {
                    var profileProvider =
                        context.read<ProfileViewModelProvider>();
                    profileProvider.profileApiRespose.data ??
                        profileProvider.getUserProfiel(context: context);
                  }
                  showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (context) {
                      return HomeDragabbleScrollabeSheet(
                        authViewmodelProvider: authProvider,
                      );
                    },
                  );
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 30),
                  padding: const EdgeInsets.all(4),
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                  child: Container(
                    height: 38,
                    width: 38,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColor.primaryColor,
                    ),
                    child: const Icon(
                      Icons.menu_rounded,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Ksize.ktenW,
            const Center(
              child: Text(
                "Restaurants",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: "Inter",
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
