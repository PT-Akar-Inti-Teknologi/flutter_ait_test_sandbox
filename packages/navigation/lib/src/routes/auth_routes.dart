import 'package:go_router/go_router.dart';
import 'package:auth/auth.dart';
import 'package:nav_list/nav_list.dart';
import 'package:navigation/src/util/route_guards.dart';

class AuthRoutes extends GoRoute {
  AuthRoutes()
      : super(
            path: AuthNav.login.path,
            builder: (context, state) => const LocalLoginPage(),
            routes: [
              GoRoute(
                path: AuthNav.register.path,
                builder: (context, state) => const RegisterPage(),
              ),
            ],
            redirect: guestRedirect);
}
