class EndPoints {
  static const pageSize = 20;
  static const baseUrl = 'https://canzo.dodoadam893.workers.dev/';
  static const signup = 'auth/client/signup';
  static const signIn = 'auth/login';
  static const forgetPassword = 'auth/forgot-password';
  static const resetPassword = 'auth/reset-password';
  static const verifyOtp = 'auth/verify-otp';
  static const baskets = 'api/client/baskets';
  static String fill(int id) =>
      'api/client/baskets/$id/fill';
  static String orderStatus(String status) =>
      'api/client/orders/$status';
}
