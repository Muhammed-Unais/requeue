import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:requeue/data/network/network_api_service.dart';
import 'package:requeue/data/response/api_response.dart';
import 'package:requeue/features/auth/view_model/auth_view_model.dart';
import 'package:requeue/features/profile/model/user_profile_model.dart';
import 'package:requeue/features/profile/repository/profile_repository.dart';

enum ProfileChip { rates, visited, favorite }

class ProfileViewModelProvider with ChangeNotifier {
  final _myRepo = ProfileRepository(NetWorkApiService());

  List<String> chipNames = ["Rates 135", "Visited 358", "Favorite Restaurant"];

  late String selectedChip;

  ProfileChip? profileChip;

  void setChipValu(String chipName) {
    selectedChip = chipName;

    if (chipName == chipNames[0]) {
      profileChip = ProfileChip.rates;
    } else if (chipName == chipNames[1]) {
      profileChip = ProfileChip.visited;
    } else {
      profileChip = ProfileChip.favorite;
    }
    notifyListeners();
  }

  ApiResponse<UserProfileModel> profileApiRespose = ApiResponse.loading();

  void setProfileApiResponse(ApiResponse<UserProfileModel> response) {
    profileApiRespose = response;
    notifyListeners();
  }

  Future<void> getUserProfiel({required BuildContext context}) async {
    var authProvider = context.read<AuthViewmodelProvider>();
    var userToken = authProvider.token;
    var clientId = await authProvider.getClientId();

    Map<String, dynamic>? queryParameters = {
      "ClientID": clientId,
      "userid": clientId
    };

    Map<String, String>? headers = {
      "userToken": userToken.toString(),
    };

    setProfileApiResponse(ApiResponse.loading());

    _myRepo
        .getUserProfile(queryParameters: queryParameters, headers: headers)
        .then((value) {
      setProfileApiResponse(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setProfileApiResponse(ApiResponse.error(error.toString()));
    });
  }

  void clearAllData() {
    profileApiRespose.data = null;
  }
}
