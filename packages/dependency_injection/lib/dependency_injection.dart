import 'package:auth/auth.dart';
import 'package:auth_blocks/auth_blocks.dart';
import 'package:auth/auth_module.dart';
import 'package:common_dependency/common_dependency.dart';
import 'package:flutter/widgets.dart';
import 'package:navigation/navigation.dart';

export 'package:dependency_injection/dependency_injection.dart';

class DependencyInjector {
  //util
  final ApiModule _apiModule = ApiModule();
  final CachingModule _cachingModule = CachingModule();
  final AppLocalizationModule _localizationModule = AppLocalizationModule();
  final NavigationModule _navigationModule = NavigationModule();
  //package
  final AuthBlocksModule _authModule = AuthBlocksModule();
  final AuthModule _internalAuthModule = AuthModule();

  Future<void> injectApp(
      {required String baseUrl,
      required String apiAppName,
      required String apiAppKey}) async {
    await _apiModule(di,
        dio: (_) =>
            Dio(BaseOptions(baseUrl: baseUrl, contentType: 'application/json')),
        dioService: (di) => DioService(dioClient: di(), interceptors: [
              ApiInterceptor(
                  di(),
                  Dio(BaseOptions(
                      baseUrl: baseUrl, contentType: 'application/json')),
                  guestTokenData: {"app": apiAppName, "key": apiAppKey}),
              LoggingInterceptor(),
            ]));
    await _cachingModule(di);
    await _authModule(stringFinder: SharedStr.maybeOf);
    await _internalAuthModule();
    await _localizationModule(di);
    await _navigationModule(di);
  }
}
