import 'package:flutter/material.dart';
import 'package:requeue/res/constants/app_colors.dart';

class Utils {
  static void showCustomSnackBar(BuildContext context, String content) {
    final snackBar = SnackBar(
      content: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: AppColor.primaryColor,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Text(
          content,
          style: const TextStyle(
              color: Colors.white, fontSize: 12.0, fontFamily: "Inter"),
        ),
      ),
      action: SnackBarAction(
        label: 'Close',
        textColor: Colors.black,
        onPressed: () {},
      ),
      duration: const Duration(seconds: 2),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static Future<void> showLogoutDialog(BuildContext context,
      {required void Function()? onPressed}) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: const Text(
            'Logout',
            style: TextStyle(
                color: Colors.black, fontSize: 16.0, fontFamily: "Inter"),
          ),
          content: const Text(
            'Are you sure you want to log out?',
            style: TextStyle(
                color: Colors.black, fontSize: 12.0, fontFamily: "Inter"),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Cancel',
                style: TextStyle(
                    color: Colors.black, fontSize: 12.0, fontFamily: "Inter"),
              ),
            ),
            TextButton(
              onPressed:onPressed,
              child: const Text(
                'Logout',
                style: TextStyle(
                    color: Colors.red, fontSize: 12.0, fontFamily: "Inter"),
              ),
            ),
          ],
        );
      },
    );
  }
}
