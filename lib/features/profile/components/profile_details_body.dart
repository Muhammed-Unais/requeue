import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:requeue/data/response/api_response.dart';
import 'package:requeue/data/response/status.dart';
import 'package:requeue/features/profile/components/follow_and_message_button.dart';
import 'package:requeue/features/profile/components/followers_following_count.dart';
import 'package:requeue/features/profile/components/user_profile_pic.dart';
import 'package:requeue/features/profile/model/user_profile_model.dart';
import 'package:requeue/features/profile/view_model/profile_viewmodel_provider.dart';
import 'package:requeue/res/constants/ksize.dart';

class ProfileDetailsBody extends StatefulWidget {
  const ProfileDetailsBody({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  State<ProfileDetailsBody> createState() => _ProfileDetailsBodyState();
}

class _ProfileDetailsBodyState extends State<ProfileDetailsBody> {
  @override
  void initState() {
    var profileProvider = context.read<ProfileViewModelProvider>();
    profileProvider.profileApiRespose.data ??
        profileProvider.getUserProfiel(context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<ProfileViewModelProvider>(
      builder: (context, userProfileProvider, _) {
        ApiResponse<UserProfileModel>? apiResponse;
        apiResponse = userProfileProvider.profileApiRespose;
        Status? status;
        status = apiResponse.status;
        var userProfileData = apiResponse.data?.userProfileData;
        var profileData = userProfileData?[0];
        switch (status) {
          case Status.loading:
            return SizedBox(
              height: size.height * 0.4,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          case Status.completed:
            return Container(
              padding: const EdgeInsets.all(20),
              width: widget.size.width,
              child: Column(
                children: [
                  UserPrfilePic(avatar: profileData?.avatar),
                  Ksize.ktenH,
                  Text(
                    profileData?.clientName ?? "",
                    style: const TextStyle(
                      fontSize: 16,
                      fontFamily: "Inter",
                      color: Colors.black,
                    ),
                  ),
                  Ksize.kfiveH,
                  Text(
                    "@${profileData?.username}",
                    style: const TextStyle(
                      fontSize: 14,
                      fontFamily: "Inter",
                      color: Colors.black,
                    ),
                  ),
                  Ksize.ktenH,
                  const Text(
                    "Obsessed with Fahim MD's, love to go shopping on weekends and loveee food #foodielife",
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: "Inter",
                      color: Color.fromRGBO(170, 170, 170, 1),
                    ),
                  ),
                  Ksize.ktwentyH,
                  FollowersFollowingCount(
                    following: profileData?.followlist?.following,
                    follwers: profileData?.followlist?.follower,
                  ),
                  Ksize.ktwentyH,
                  const FollowAndMessageButton(),
                  Ksize.ktenH,
                  const Divider(
                    endIndent: 10,
                    thickness: 0.5,
                  )
                ],
              ),
            );
          case Status.error:
            return SizedBox(
              height: size.height * 0.4,
              child: Center(
                child: Text(apiResponse.message ?? ""),
              ),
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}
