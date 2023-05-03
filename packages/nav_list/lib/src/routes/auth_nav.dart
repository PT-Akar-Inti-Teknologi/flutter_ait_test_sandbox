import 'package:nav_list/src/util/navigation_data.dart';

class AuthNav {
  AuthNav._();
  static const login = NavigationData(path: '/login');
  static const register = NavigationData(path: 'register', parent: login);
}
