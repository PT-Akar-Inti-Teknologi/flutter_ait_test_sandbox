import 'package:ait_flutter_template/themes/design_theme_extended.dart';
import 'package:common_dependency/common_dependency.dart';
import 'package:dependency_injection/dependency_injection.dart';
import 'package:env/env.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:navigation/navigation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DependencyInjector().injectApp(
      baseUrl: Env.baseUrl, apiAppKey: Env.appKey, apiAppName: Env.appName);
  runApp(const MyApp());
}

final _router = MainNavigation();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 667),
      minTextAdapt: true,
      builder: (context, child) {
        return LocaleSwitchApp(
          listenable: di<LocaleSwitchNotifier>(),
          builder: (_, locale, __) => MaterialApp.router(
              routerConfig: _router,
              scrollBehavior: const MaterialScrollBehavior().copyWith(
                dragDevices: {
                  PointerDeviceKind.mouse,
                  PointerDeviceKind.touch,
                  PointerDeviceKind.stylus,
                  PointerDeviceKind.unknown
                },
              ),
              locale: locale,
              localizationsDelegates: const [
                SharedStr.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: SharedStr.delegate.supportedLocales,
              title: 'Flutter Demo',
              themeMode: ThemeMode.light,
              theme: DesignThemeExtended.lightTheme(fontFamily: 'Satoshi')),
        );
      },
    );
  }
}
