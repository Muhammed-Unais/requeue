import 'package:requeue/data/network/base_api_service.dart';
import 'package:requeue/features/auth/model/user_model.dart';
import 'package:requeue/res/app_url.dart';

class AuthRepository {
  AuthRepository(this.apiService);

  final BaseApiService apiService;

  Future<UserModel> signupPostApi(dynamic body) async {
    try {
      dynamic response =await apiService.getPostApiResponse(AppUrl.signUpUrl, body);
      return userModelFromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> loginPostApi(dynamic body) async {
    try {
      dynamic response =await apiService.getPostApiResponse(AppUrl.loginUrl, body);
      return userModelFromJson(response);
    } catch (e) {
      rethrow;
    }
  }


}
