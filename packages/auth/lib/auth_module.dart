import 'package:auth_blocks/auth_blocks.dart';
import 'package:auth/src/data/datasources/auth_local_ds.dart';
import 'package:auth/src/data/datasources/auth_remote_ds.dart';
import 'package:auth/src/data/repositories/auth_repository_impl.dart';
import 'package:auth/src/domain/usecase/login_use_case.dart';
import 'package:common_dependency/common_dependency.dart';

class AuthModule {
  Future<void> call() async {
    //Repository
    di.registerLazySingleton<AuthRepository>(
      () => AuthRepositoriesImpl(
        networkInfo: di(),
        localData: di(),
        service: di(),
      ),
    );
    //DataSource
    di.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(di()),
    );
    di.registerLazySingleton<AuthLocalDataSource>(
      () => AuthLocalDataSourceImpl(di()),
    );
    //Cubit
    di.registerFactory(() => LoginCubit.load(loginUseCase: di<LoginUseCase>()));
    //UseCase
    di.registerLazySingleton(() => LoginUseCase(di()));
    di.registerLazySingleton(() => CheckLoggedInUseCase(di()));
    await di<AuthLocalDataSource>().load();
  }
}
