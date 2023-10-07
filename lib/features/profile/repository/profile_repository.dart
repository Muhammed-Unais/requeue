import 'package:requeue/data/network/base_api_service.dart';
import 'package:requeue/features/profile/model/user_profile_model.dart';
import 'package:requeue/res/app_url.dart';

class ProfileRepository {
  final BaseApiService _baseApiService;

  ProfileRepository(this._baseApiService);

  Future<UserProfileModel> getUserProfile({
    required Map<String, dynamic>? queryParameters,
    required Map<String, String>? headers,
  }) async {
    try {
      dynamic response = await _baseApiService.getGetApiResponse(
          AppUrl.baseUrlnohttp, AppUrl.profileUrl, queryParameters, headers);
      return userProfileModelFromMap(response);
    } catch (e) {
      rethrow;
    }
  }
}
