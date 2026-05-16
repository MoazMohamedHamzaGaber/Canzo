class SignInParams {
  final String identifier;
  final String password;

  SignInParams({
    required this.identifier,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
    "identifier": identifier,
    "password": password,
  };
}

class SignUpParams {
  final String username;
  final String email;
  final String password;
  final String confirmPassword;
  final String phoneNumber;
  final String address;
  final String activityType;
  final String activityName;

  SignUpParams({
    required this.username,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.phoneNumber,
    required this.address,
    required this.activityType,
    required this.activityName,
  });

  Map<String, dynamic> toJson() => {
    "username": username,
    "email": email,
    "password": password,
    "confirmPassword": confirmPassword,
    "phoneNumber": phoneNumber,
    "address": address,
    "activityType": activityType,
    "activityName": activityName,
  };
}