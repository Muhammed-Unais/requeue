import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:requeue/data/network/network_api_service.dart';
import 'package:requeue/features/auth/model/signup_model.dart';
import 'package:requeue/features/auth/reposiotry/auth_repository.dart';
import 'package:requeue/utils/routes/routes_name.dart';

class AuthViewmodelProvider with ChangeNotifier {
  final authRepo = AuthRepository(NetWorkApiService());

  final storage = const FlutterSecureStorage();

  final String _keyJwtToken = 'token';
  final String _keycliendId = 'cliendId';

  String? _jwtToken;
  String? get token => _jwtToken;

  Future _setJwtToken(String? token) async {
    await storage.write(key: _keyJwtToken, value: token);
  }

  Future<String?> getJwtToken() async {
    _jwtToken = await storage.read(key: _keyJwtToken);
    return _jwtToken;
  }

  Future _setClientId(String? clientId) async {
    await storage.write(key: _keycliendId, value: clientId);
  }

  Future<String?> getClientId() async {
    return await storage.read(key: _keycliendId);
  }

  String? countryPhoneCode;
  var formKey = GlobalKey<FormState>();

  TextEditingController userNameController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Map<String, dynamic> postSignupUserData() {
    var userData = SignupModel(
      name: nameController.text,
      email: emailController.text,
      phoneNumber: int.parse(phoneController.text),
      password: passwordController.text,
      confirmPassword: passwordController.text,
      country: int.parse(countryPhoneCode ?? "91"),
      userName: userNameController.text,
    );
    return userData.toJson();
  }

  Future signUpPostApi(BuildContext context) async {
    var body = postSignupUserData();
    authRepo.signupPostApi(body).then((value) {
      _setJwtToken(value.token);
      _setClientId(value.user?.clientId.toString());
      Navigator.pushNamed(context, RoutesNames.homeroute);
    }).onError((error, stackTrace) {
      // snackbar
    });
  }

  clearAllFields() {
    userNameController.clear();
    nameController.clear();
    emailController.clear();
    phoneController.clear();
    passwordController.clear();
    countryPhoneCode = null;
  }
}
