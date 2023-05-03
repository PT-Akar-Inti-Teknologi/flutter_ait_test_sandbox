import 'package:common_dependency/common_dependency.dart';
import 'package:dependency_injection/dependency_injection.dart';
import 'package:env/env.dart';
import 'package:flutter/material.dart';
import 'package:common_dependency/common_dependency.dart';

import 'widgetbook.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DependencyInjector().injectApp(
      baseUrl: Env.baseUrl, apiAppKey: Env.appKey, apiAppName: Env.appName);
  runApp(
    ScreenUtilInit(
      designSize: const Size(375, 667),
      minTextAdapt: true,
      builder: (context, child) {
        return const WidgetbookHotReload();
      },
    ),
  );
}
