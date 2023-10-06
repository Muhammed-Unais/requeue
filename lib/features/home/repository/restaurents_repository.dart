import 'package:requeue/data/network/base_api_service.dart';
import 'package:requeue/features/home/model/restaurent_model.dart';
import 'package:requeue/res/app_url.dart';

class RestaurenRepository {
  RestaurenRepository(this.baseApiService);

  final BaseApiService baseApiService;

  Future<RestuarentModel> getAllRestuarents(
      Map<String, dynamic>? queryParameters,
      Map<String, String>? headers) async {
    try {
      dynamic response = await baseApiService.getGetApiResponse(
          AppUrl.baseUrlnohttp, AppUrl.restaurantAPI, queryParameters, headers);

      return restuarentModelFromMap(response);
    } catch (e) {
      rethrow;
    }
  }
}
