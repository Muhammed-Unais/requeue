class SignupModel {
  final String name;
  final String email;
  final int phoneNumber;
  final String password;
  final String confirmPassword;
  final int country;
  final String userName;

  SignupModel({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.password,
    required this.confirmPassword,
    required this.country,
    required this.userName,
  });

  Map<String, dynamic> toJson() => {
    "Name":name,
    "Email":email,
    "phone_number":phoneNumber,
    "Password":password,
    "confirm_password":confirmPassword,
    "Country":country, 
    "UserName":userName
  };
}

