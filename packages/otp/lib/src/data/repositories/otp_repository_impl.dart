import 'package:common_dependency/common_dependency.dart';
import 'package:otp/src/data/datasource/otp_data_source.dart';
import 'package:otp/src/data/models/otp_models.dart';
import 'package:otp/src/domain/otp_entity.dart';

import '../../domain/repositories/otp_repository.dart';

class OtpRepositoryImpl implements OtpRepository {
  final OtpDataSource otpDataSource;

  OtpRepositoryImpl(this.otpDataSource);
  @override
  Future<Either<Failure, Unit>> verifyOtp(OtpEntity body) async {
    try {
      await otpDataSource.verifyOtp(OtpModel.fromEntity(body));
      return const Right(unit);
    } catch (e) {
      return const Left(ServerFailure());
    }
  }
}
