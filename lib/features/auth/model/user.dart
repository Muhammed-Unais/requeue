class User {
  final String name;
  final String email;
  final String phoneNumber;
  final String password;
  final String confirmPassword;
  final String country;
  final String userName;

  User({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.password,
    required this.confirmPassword,
    required this.country,
    required this.userName,
  });

  Map<String, dynamic> toJson() => {
    "name":name,
    "email":email,
    "phoneNumber":phoneNumber,
    "password":password,
    "confirmPassword":confirmPassword,
    "country":country, 
    "userName":userName
  };
}
