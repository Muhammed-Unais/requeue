import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:requeue/features/auth/view_model/auth_view_model.dart';
import 'package:requeue/features/home/components/user_name_and_profile.dart';
import 'package:requeue/features/home/view_model/restaurent_viewmodel_provider.dart';
import 'package:requeue/res/components/menu_listtale.dart';
import 'package:requeue/utils/routes/routes_name.dart';
import 'package:requeue/utils/utils.dart';

class HomeDragabbleScrollabeSheet extends StatelessWidget {
  const HomeDragabbleScrollabeSheet({
    super.key,
    required this.authViewmodelProvider,
  });

  final AuthViewmodelProvider authViewmodelProvider;

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
          child: authViewmodelProvider.token != null
              ? ListView(
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
                    const UserNameAndProfile(),
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
                    MenuListTale(
                      titile: "View Profile",
                      onTap: () {
                        Navigator.pushNamed(context, RoutesNames.profileRoute);
                      },
                    ),
                    MenuListTale(
                      titile: "Logout",
                      onTap: () async {
                        Utils.showLogoutDialog(
                          context,
                          onPressed: () async {
                            await authViewmodelProvider.logoutUser(context);
                          },
                        );
                      },
                    ),
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Center(
                      child: Text(
                        "You dont have account",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: "Inter",
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          context
                              .read<RestaurantViewModelProvider>()
                              .clearAllData();
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            RoutesNames.loginroute,
                            (route) => false,
                          );
                        },
                        child: const Text(
                          "Create a new account or login",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.white,
                            fontSize: 16,
                            fontFamily: "Inter",
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
        );
      },
    );
  }
}
