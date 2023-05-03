import 'package:common_dependency/common_dependency.dart';
import 'package:otp/src/data/datasource/otp_data_source.dart';
import 'package:otp/src/data/repositories/otp_repository_impl.dart';
import 'package:otp/src/domain/domain.dart';
import 'package:otp/src/presentation/pages/otp_page/cubit/otp_cubit.dart';

class OtpModules {
  Future<void> call() async {
    di.registerLazySingleton<OtpRepository>(() => OtpRepositoryImpl(di()));
    di.registerLazySingleton(() => VerifyOtpUseCase(di()));
    di.registerLazySingleton<OtpDataSource>(() => OtpDataSourceImpl());
    di.registerFactory(() => OtpCubit(di()));
  }
}
