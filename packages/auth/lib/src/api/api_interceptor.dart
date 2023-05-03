import 'package:common_dependency/common_dependency.dart';
import 'package:auth/auth.dart';
import 'package:auth/src/data/datasources/endpoint/auth_endpoint.dart';

class ApiInterceptor extends QueuedInterceptor {
  ApiInterceptor(this.authDs, this.dio, {this.guestTokenData}) : super();
  final AuthLocalDataSource authDs;
  final Dio dio;
  final JSON? guestTokenData;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (!options.headers.containsKey("Authorization")) {
      TokenModel? token = authDs.getTokens();
      if (token == null) {
        try {
          token = await _fetchNewToken();
          await authDs.setTokens(whichToken: WhichToken.guest, token: token);
        } catch (_) {}
      }
      if (token != null) {
        options.headers['Authorization'] = 'Bearer ${token.accessToken}';
      }
    }
    return super.onRequest(options, handler);
  }

  @override
  void onError(
    DioError err,
    ErrorInterceptorHandler handler,
  ) async {
    WhichToken? which = authDs.whichTokenAvailable();
    if (err.response?.statusCode == 401 && which != null) {
      try {
        TokenModel newToken = await refreshToken(
          whichToken: which,
          token: (authDs.getTokens(which))!,
        );
        await authDs.setTokens(whichToken: which, token: newToken);
        handler.resolve(await _retry(
          err.requestOptions,
          newToken.accessToken ?? '',
        ));
      } catch (e) {
        await authDs.deleteTokens();
        handler.next(err);
      }
    } else {
      return handler.next(err);
    }
  }

  Future<TokenModel> _fetchNewToken() async {
    final response = await dio.post(
      AuthEndpoint.getInitialToken,
      data: guestTokenData,
    );
    return TokenModel.fromJson(response.data['data']);
  }

  Future<TokenModel> refreshToken(
      {required WhichToken whichToken, required TokenModel token}) async {
    final String uri = whichToken == WhichToken.guest
        ? AuthEndpoint.refreshGuestToken
        : AuthEndpoint.refreshUserToken;
    try {
      final response = await dio.post(
        uri,
        options: Options(
          headers: <String, Object?>{
            'Authorization': 'Bearer ${token.refreshToken}'
          },
        ),
      );
      return TokenModel.fromJson(response.data['data']);
    } catch (e) {
      rethrow;
    }
  }

  Future<Response<dynamic>> _retry(
      RequestOptions requestOptions, String accessToken) async {
    final options = Options(
      method: requestOptions.method,
      headers: <String, Object?>{'Authorization': 'Bearer $accessToken'},
    );
    return dio.request<dynamic>(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }
}
