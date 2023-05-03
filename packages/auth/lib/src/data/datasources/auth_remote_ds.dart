import 'package:common_dependency/common_dependency.dart';
import 'package:auth/auth.dart';
import 'package:auth/src/data/datasources/endpoint/auth_endpoint.dart';

abstract class AuthRemoteDataSource {
  Future<TokenModel> login(LoginModel body);
  Future<void> getProfile();
  Future<Either<Failure, Unit>> logout();
  Future<TokenModel> refreshToken(String refreshtoken);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final DioService service;

  AuthRemoteDataSourceImpl(this.service);

  @override
  Future<TokenModel> login(LoginModel body) async {
    return await service.post<TokenModel>(
      endpoint: AuthEndpoint.login,
      data: body.toJson(),
      converter: (response) {
        return AITResponseModel.fromJson(response,
                (value) => TokenModel.fromJson(value as Map<String, dynamic>))
            .data!;
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> logout() {
    throw UnimplementedError();
  }

  @override
  Future<void> getProfile() async {
    return await service.get(
      endpoint: AuthEndpoint.getProfile,
      converter: (response) {},
    );
  }

  @override
  Future<TokenModel> refreshToken(String refreshtoken) async {
    return await service.post(
      endpoint: AuthEndpoint.refreshUserToken,
      options: Options(
        headers: <String, Object?>{'Authorization': 'Bearer $refreshtoken'},
      ),
      converter: (response) => ApiResponseDetail.fromJson(response,
              (value) => TokenModel.fromJson(value as Map<String, dynamic>))
          .responseOutput!
          .detail!,
    );
  }
}
