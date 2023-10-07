import 'package:flutter/material.dart';
import 'package:requeue/res/constants/app_colors.dart';

class UserPrfilePic extends StatelessWidget {
  const UserPrfilePic({
    super.key,
    this.avatar,
  });

  final String? avatar;

  @override
  Widget build(BuildContext context) {
    return avatar == null
        ? Container(
            height: 156,
            width: 156,
            decoration: BoxDecoration(
              border: Border.all(color: AppColor.greyColor, width: 0.2),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.10),
                  blurRadius: 2.0,
                  spreadRadius: 1,
                  offset: const Offset(0, 2),
                )
              ],
              shape: BoxShape.circle,
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  "assets/images/836.jpg",
                ),
              ),
            ),
          )
        : Container(
            height: 156,
            width: 156,
            decoration: BoxDecoration(
              border: Border.all(color: AppColor.greyColor, width: 0.2),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.10),
                  blurRadius: 2.0,
                  spreadRadius: 1,
                  offset: const Offset(0, 2),
                )
              ],
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  avatar!,
                ),
              ),
            ),
          );
  }
}