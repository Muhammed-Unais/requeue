import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:requeue/data/network/network_api_service.dart';
import 'package:requeue/features/auth/view_model/auth_view_model.dart';
import 'package:requeue/features/home/repository/restaurents_repository.dart';

class RestaurantViewModelProvider {
  final _myrepo = RestaurenRepository(NetWorkApiService());

  Future getAllPickedUpRestaurent(
      {required int page, required BuildContext context}) async {
    var userToken = context.read<AuthViewmodelProvider>().token;

    Map<String, dynamic>? queryParameters = {
      "PickupAvailable": 1,
      "AreaName": "Kuwait",
      "page": page,
      "page limit": 10,
    };
    Map<String, String>? headers = {"userToken": userToken.toString()};
    _myrepo
        .getAllRestuarents(queryParameters, headers)
        .then((value) {})
        .onError((error, stackTrace) {});
  }
}
