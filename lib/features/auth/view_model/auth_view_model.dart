import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:requeue/data/network/network_api_service.dart';
import 'package:requeue/features/auth/model/signup_model.dart';
import 'package:requeue/features/auth/reposiotry/auth_repository.dart';
import 'package:requeue/features/home/view_model/restaurent_viewmodel_provider.dart';
import 'package:requeue/features/profile/view_model/profile_viewmodel_provider.dart';
import 'package:requeue/utils/routes/routes_name.dart';
import 'package:requeue/utils/utils.dart';

class AuthViewmodelProvider with ChangeNotifier {
  final authRepo = AuthRepository(NetWorkApiService());

  final storage = const FlutterSecureStorage();

  final String _keyJwtToken = 'token';
  final String _keycliendId = 'cliendId';

  String? _jwtToken;
  String? get token => _jwtToken;

  bool isSignup = false;
  bool islogin = false;

  void setLoginIsloading(bool value) {
    islogin = value;
    notifyListeners();
  }

  void setSignupIsloading(bool value) {
    isSignup = value;
    notifyListeners();
  }

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

  Future<void> logoutUser(BuildContext context) async {
    _jwtToken = null;
    context.read<RestaurantViewModelProvider>().clearAllData();
    context.read<ProfileViewModelProvider>().clearAllData();

    await storage.deleteAll().then((value) {
      Navigator.popAndPushNamed(context, RoutesNames.loginroute);
    });
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
    setSignupIsloading(true);
    await authRepo.signupPostApi(body).then((usermodel) {
      _setJwtToken(usermodel.token);
      _setClientId(usermodel.user?.clientId.toString());
      setSignupIsloading(false);

      Navigator.pushNamedAndRemoveUntil(
        context,
        RoutesNames.homeroute,
        (route) => false,
      );

      clearAllFields();
    }).onError((error, stackTrace) {
      setSignupIsloading(false);
      Utils.showCustomSnackBar(context, error.toString());
    });
  }

  Future loginApi(Map<String, dynamic> data, BuildContext context) async {
    setLoginIsloading(true);
    await authRepo.loginPostApi(data).then((value) async {
      Utils.showCustomSnackBar(context,value.message ??"");
      _setJwtToken(value.token);
      _setClientId(value.user?.clientId.toString());
      setLoginIsloading(false);
      
      Navigator.pushReplacementNamed(context, RoutesNames.homeroute);
    }).onError((error, stackTrace) {
      setLoginIsloading(false);
      Utils.showCustomSnackBar(context, error.toString());
      log(error.toString());
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
