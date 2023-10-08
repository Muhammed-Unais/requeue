import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:requeue/data/response/status.dart';
import 'package:requeue/features/profile/view_model/profile_viewmodel_provider.dart';

class UserNameAndProfile extends StatelessWidget {
  const UserNameAndProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileViewModelProvider>(
      builder: (context, profileProvider, _) {
        switch (profileProvider.profileApiRespose.status) {
          case Status.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case Status.completed:
            var userData = profileProvider.profileApiRespose.data;
            return ListTile(
              leading: const CircleAvatar(
                radius: 36,
                backgroundImage: AssetImage("assets/images/836.jpg"),
              ),
              title: const Text(
                "Welcome",
                style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
              subtitle: Text(
                userData?.userProfileData?[0].clientName ?? "",
                style: const TextStyle(
                  fontFamily: "Inter",
                  fontSize: 19,
                  color: Colors.white,
                ),
              ),
            );
          case Status.error:
            return const Center(
              child: Text(
                "No Profile",
              ),
            );

          default:
            return const SizedBox();
        }
      },
    );
  }
}