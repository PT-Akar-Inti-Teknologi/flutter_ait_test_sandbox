import 'package:auth/auth.dart';
import 'package:go_router/go_router.dart';
import 'package:nav_list/nav_list.dart';
import 'package:navigation/injection.dart';
import 'package:navigation/src/routes/auth_routes.dart';
import 'package:navigation/src/routes/home_routes.dart';
import 'package:navigation/src/routes/splash_routes.dart';

class MainNavigation extends GoRouter {
  MainNavigation()
      : super(
          routes: [SplashRoutes(), AuthRoutes(), HomeRoutes()],
          initialLocation: SplashNav.splash.fullpath,
          debugLogDiagnostics: true,
        ) {
    di<AuthLocalDataSource>().listen((action, model) {
      if (action == AuthLocalDataAction.delete && model.authToken == null) {
        go(AuthNav.login.fullpath);
      }
    });
  }
}
