class AuthEndpoint {
  const AuthEndpoint._();
  static String getInitialToken = '/oauth/auth';
  static String refreshGuestToken = '/oauth/refresh';
  static String login = '/user/auth/login';
  static String getProfile = '/user/profile';
  static String refreshUserToken = '/user/auth/refresh';
}
