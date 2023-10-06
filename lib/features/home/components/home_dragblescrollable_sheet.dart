import 'package:flutter/material.dart';
import 'package:requeue/res/components/menu_listtale.dart';

class HomeDragabbleScrollabeSheet extends StatelessWidget {
  const HomeDragabbleScrollabeSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.84,
      maxChildSize: 0.84,
      builder: (context, controller) {
        return Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            gradient: LinearGradient(
              colors: [Color(0xff5bc1e0), Color(0xff7f5bff)],
              stops: [0, 0.5],
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
            ),
          ),
          margin: const EdgeInsets.only(
            left: 10,
            right: 10,
          ),
          child: ListView(
            controller: controller,
            children: [
              const Padding(
                padding: EdgeInsets.only(
                  left: 150,
                  right: 150,
                  top: 15,
                  bottom: 20,
                ),
                child: Divider(
                  thickness: 1.5,
                  color: Colors.white,
                ),
              ),
              const ListTile(
                leading: CircleAvatar(
                  radius: 36,
                  backgroundImage:
                      AssetImage("assets/images/rq-logo-OMAR-WHITE.png"),
                ),
                title: Text(
                  "Welcome",
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
                subtitle: Text(
                  "Yousuf bunashi",
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontSize: 19,
                    color: Colors.white,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Divider(),
              ),
              MenuListTale(
                titile: "View Restaurants",
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              const MenuListTale(titile: "View Profile"),
            ],
          ),
        );
      },
    );
  }
}
