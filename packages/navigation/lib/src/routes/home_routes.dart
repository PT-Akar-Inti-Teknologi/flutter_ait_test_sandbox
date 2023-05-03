import 'package:auth/auth.dart';
import 'package:go_router/go_router.dart';
import 'package:nav_list/nav_list.dart';
import 'package:navigation/src/util/route_guards.dart';

class HomeRoutes extends GoRoute {
  HomeRoutes()
      : super(
          path: HomeNav.home.path,
          builder: (context, state) => const HomePage(),
          redirect: (context, state) {
            if (!isLoggedIn()) return AuthNav.login.fullpath;
            return null;
          },
          routes: [],
        );
}
