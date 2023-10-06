import 'package:flutter/material.dart';

class MenuListTale extends StatelessWidget {
  const MenuListTale({
    super.key, required this.titile, this.onTap,
  });

  final String titile;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return  ListTile(
      onTap: onTap,
      leading: const Icon(
        Icons.watch_later_outlined,
        size: 24,
        color: Colors.white,
      ),
      title: Text(
        titile,
        style:const TextStyle(
          fontSize: 15,
          fontFamily: "Inter",
          color: Colors.white,
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios_rounded,
        size: 22,
        color: Colors.white,
      ),
    );
  }
}