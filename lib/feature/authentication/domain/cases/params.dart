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

class ForgetPasswordParams {
  final String email;

  ForgetPasswordParams({
    required this.email,
  });

  Map<String, dynamic> toJson() => {
    "email": email,
  };
}

class VerifyOtpParams {
  final String email;
  final String otp;

  VerifyOtpParams({
    required this.email,
    required this.otp,
  });

  Map<String, dynamic> toJson() => {
    "otp": otp,
  };
}

class ResetPasswordParams {
  final String email;
  final String password;
  final String resetToken;

  ResetPasswordParams({
    required this.email,
    required this.password,
    required this.resetToken,
  });

  Map<String, dynamic> toJson() => {
    "email": email,
    "password": password,
    "resetToken": resetToken,
  };
}