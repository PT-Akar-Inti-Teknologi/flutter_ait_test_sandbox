import 'package:common_dependency/common_dependency.dart';
import 'package:auth/src/data/datasources/auth_remote_ds.dart';
import 'package:auth_blocks/auth_blocks.dart';
import 'package:auth/auth.dart';

class AuthRepositoriesImpl implements AuthRepository {
  final NetworkInfo networkInfo;
  final AuthLocalDataSource localData;
  final AuthRemoteDataSource service;

  AuthRepositoriesImpl({
    required this.networkInfo,
    required this.localData,
    required this.service,
  });

  @override
  Either<Failure, bool> checkLoggedIn() {
    final hasToken = localData.getTokens();
    if (hasToken != null) {
      return const Right(true);
    } else {
      return const Right(false);
    }
  }

  @override
  Future<Either<Failure, Unit>> login(LoginEntity body) async {
    if (await networkInfo.isConnected == false) {
      return const Left(NetworkFailure());
    } else {
      try {
        final res = await service.login(LoginModel.fromEntity(body));
        try {
          await localData.setTokens(whichToken: WhichToken.user, token: res);
        } catch (e) {
          return const Left(CacheFailure());
        }
        return const Right(unit);
      } catch (e) {
        if (e is DioServiceError) {
          return Left(e.failure);
        } else {
          return const Left(UnRecognizedFailure());
        }
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> logout() async {
    if (await networkInfo.isConnected == false) {
      return const Left(NetworkFailure());
    } else {
      try {
        try {
          await localData.deleteTokens();
        } catch (e) {
          return const Left(CacheFailure());
        }
        return const Right(unit);
      } catch (e) {
        if (e is DioServiceError) {
          return Left(e.failure);
        } else {
          return const Left(UnRecognizedFailure());
        }
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> refreshToken() async {
    final token = localData.getTokens(WhichToken.user);
    if (token == null) return const Left(UnAuthorizedFailure());
    try {
      final response = await service.refreshToken(token.refreshToken!);
      final finalToken = TokenModel(
          accessToken: response.accessToken, refreshToken: token.refreshToken);
      localData.setTokens(whichToken: WhichToken.user, token: finalToken);
      return const Right(unit);
    } on DioServiceError catch (e) {
      return Left(e.failure);
    } catch (e) {
      return Left(UnRecognizedFailure(e));
    }
  }
}
