import 'package:nav_list/nav_list.dart';
import 'package:otp/otp.dart';
// import 'package:splash_feature/splash_feature.dart';
import 'package:go_router/go_router.dart';

class SplashRoutes extends GoRoute {
  SplashRoutes()
      : super(
          path: SplashNav.splash.path,
          builder: (context, state) => const Otp(),
        );
}
