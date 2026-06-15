class LoginEntity {
  final String message;
  final String token;
  final int userId;
  final String userRole;
  final bool isFirstLogin;

  LoginEntity({
    required this.message,
    required this.token,
    required this.userId,
    required this.userRole,
    required this.isFirstLogin,
  });
}
