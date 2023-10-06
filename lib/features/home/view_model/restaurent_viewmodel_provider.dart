import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:requeue/data/network/network_api_service.dart';
import 'package:requeue/data/response/api_response.dart';
import 'package:requeue/features/auth/view_model/auth_view_model.dart';
import 'package:requeue/features/home/model/restaurent_model.dart';
import 'package:requeue/features/home/repository/restaurents_repository.dart';

enum HomeChip { dinein, pickup }

class RestaurantViewModelProvider with ChangeNotifier {
  final _myrepo = RestaurenRepository(NetWorkApiService());

  ApiResponse<RestuarentModel> pickedrestaurantResponse = ApiResponse.loading();
  ApiResponse<RestuarentModel> dineinrestaurantResponse = ApiResponse.loading();

  void setAllpickedRestuarent(ApiResponse<RestuarentModel> apiResponse) {
    pickedrestaurantResponse = apiResponse;
    notifyListeners();
  }

  void setAlldineinRestuarent(ApiResponse<RestuarentModel> apiResponse) {
    dineinrestaurantResponse = apiResponse;
    notifyListeners();
  }

  int dineInItemsCount = 0;
  int pickUpItemsCount = 0;

  late HomeChip homeChip;

  List<String> chipNames = ["Dine in", "Pickup"];

  late String selcetedChip;

  void seHomeChipValue(String chipName) {
    selcetedChip = chipName;
    if (chipName == chipNames[0]) {
      homeChip = HomeChip.dinein;
    } else if (chipName == chipNames[1]) {
      homeChip = HomeChip.pickup;
    }
    notifyListeners();
  }

  Future getAllPickedUpRestaurent({required BuildContext context}) async {
    var userToken = context.read<AuthViewmodelProvider>().token;

    setAllpickedRestuarent(ApiResponse.loading());

    Map<String, dynamic>? queryParameters = {
      "PickupAvailable": 1.toString(),
      "AreaName": "Kuwait",
      "page": 1.toString(),
      "pagelimit": 10.toString(),
    };

    Map<String, String>? headers = {"userToken": userToken.toString()};

    _myrepo.getAllRestuarents(queryParameters, headers).then((value) {
      pickUpItemsCount = value.count!;
      setAllpickedRestuarent(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      log(error.toString());
      setAllpickedRestuarent(ApiResponse.error(error.toString()));
    });
  }

  Future<List<Restaurents>?> paginationPickedUpRestaurent(
      {required int page, required BuildContext context}) async {
    var userToken = context.read<AuthViewmodelProvider>().token;

    List<Restaurents>? restaurents;

    Map<String, dynamic>? queryParameters = {
      "PickupAvailable": 1.toString(),
      "AreaName": "Kuwait",
      "page": page.toString(),
      "pagelimit": 10.toString(),
    };

    Map<String, String>? headers = {"userToken": userToken.toString()};
    await _myrepo.getAllRestuarents(queryParameters, headers).then((value) {
      // pickedUPrestuarentModel = value;
      restaurents = value.data;
    }).onError((error, stackTrace) {});

    return restaurents;
  }

  Future getAlldineinRestaurent({required BuildContext context}) async {
    var userToken = context.read<AuthViewmodelProvider>().token;

    setAlldineinRestuarent(ApiResponse.loading());

    Map<String, dynamic>? queryParameters = {
      "DineinAvailable": 1.toString(),
      "AreaName": "Kuwait",
      "page": 1.toString(),
      "pagelimit": 10.toString(),
    };

    Map<String, String>? headers = {"userToken": userToken.toString()};

    _myrepo.getAllRestuarents(queryParameters, headers).then((value) {
      dineInItemsCount = value.count!;
      setAlldineinRestuarent(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      log(error.toString());
      setAlldineinRestuarent(ApiResponse.error(error.toString()));
    });
  }

  Future<List<Restaurents>?> paginationDineinRestaurent(
      {required int page, required BuildContext context}) async {
    var userToken = context.read<AuthViewmodelProvider>().token;

    List<Restaurents>? restaurents;

    Map<String, dynamic>? queryParameters = {
      "DineinAvailable": 1.toString(),
      "AreaName": "Kuwait",
      "page": page.toString(),
      "pagelimit": 10.toString(),
    };

    Map<String, String>? headers = {"userToken": userToken.toString()};

    await _myrepo.getAllRestuarents(queryParameters, headers).then((value) {
      restaurents = value.data!;
    }).onError((error, stackTrace) {});
    return restaurents;
  }
}
