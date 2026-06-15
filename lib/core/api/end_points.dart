class EndPoints {
  static const pageSize = 20;
  static const baseUrl = 'https://canzo.dodoadam893.workers.dev/';
  static const signup = 'auth/client/signup';
  static const signIn = 'auth/login';
  static const forgetPassword = 'auth/forgot-password';
  static const resetPassword = 'auth/reset-password';
  static const verifyOtp = 'auth/verify-otp';
  static const baskets = 'api/client/baskets';
  static const analytics = 'api/admin/analytics';
  static String fill(int id) =>
      'api/client/baskets/$id/fill';
  static String deleteBasket(int id) =>
      'api/client/basket/$id';
  static String orderStatus(String status) =>
      'api/client/orders/$status';
  static const transaction = 'api/client/transactions';
  static const wallet = 'api/client/wallet';
  static const profile = 'api/client/profile';
  static const setupProfile = 'api/setup-profile';
  static const  googleLogin = '/auth/google';
  static const adminProfile = 'api/admin/profile';
  static const orders = 'api/admin/orders?status=Pending';
  static const order = 'api/admin/order';
  static const requestWithdraw = 'api/client/withdraw';
  static const stats = 'api/admin/stats';
  static const withdraw = 'api/admin/withdrawals?status=Pending';
  static const approveWithdraw = 'api/admin/withdraw';
  static const userWithdraw = 'api/client/withdrawals';
}
